package com.ruoyi.exam.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.annotation.LogAop;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.core.service.impl.BaseServicePage;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.exam.domain.*;
import com.ruoyi.exam.dto.ExamOptionDto;
import com.ruoyi.exam.dto.ExamPaperDetailDto;
import com.ruoyi.exam.dto.ExamQuestionsDto;
import com.ruoyi.exam.enums.QuestionTypeEnum;
import com.ruoyi.exam.service.*;
import com.ruoyi.exam.vo.ExamOptionVo;
import com.ruoyi.exam.vo.ExamQuestionShowVo;
import com.ruoyi.exam.vo.ExamQuestionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamQuestionsMapper;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * 试题Service业务层处理
 */
@SuppressWarnings("ALL")
@Service
public class ExamQuestionsServiceImpl extends BaseServicePage implements IExamQuestionsService
{
    @Autowired
    private ExamQuestionsMapper examQuestionsMapper;

    @Autowired
    private IExamQuestionBankQuestionsService questionBankQuestionsService;

    @Autowired
    private IExamLabelQuestionsService labelQuestionsService;

    @Autowired
    private IExamOptionService optionService;


    @Autowired
    private IExamLabelService labelService;

    @Autowired
    private IExamQuestionBankService bankService;


    /**
     * 查询试题
     *
     * @param id 试题主键
     * @return 试题
     */
    @Override
    public ExamQuestions selectExamQuestionsById(Long id)
    {
        return examQuestionsMapper.selectExamQuestionsById(id);
    }

    /***
     * @Summary
     * @Param: [paperDetail]
     * @Return: com.ruoyi.exam.domain.ExamPaperDetail
     * @Author: TheRaging
     * @Date: 2021/12/16 0:25
     * @Description 根据选择的这个试卷生成的所需要的标签和题库，去查询对应的不同题目类型的题目数量
     */
    @Override
    public ExamPaperDetail selectExamQuestionCountByType(ExamPaperDetailDto.SelectQuestionTypeCount.Input paperDetail) {
        //查询不同的题目类型的题目数量
        ExamPaperDetail detail = new ExamPaperDetail();
        ExamPaperDetail examPaperDetail = new ExamPaperDetail();
        examPaperDetail.setAnswerCount((long) 0);
        examPaperDetail.setJudgeCount((long) 0);
        examPaperDetail.setSelectCount((long) 0);
        examPaperDetail.setSelectsCount((long) 0);
        if(paperDetail.getLabel().size()<1&&paperDetail.getBank().size()<1){
            return  examPaperDetail;
        }
        detail.setBankList(paperDetail.getBank().toArray(new Long[paperDetail.getBank().size()]));
        detail.setLabelList(paperDetail.getLabel().toArray(new Long[paperDetail.getLabel().size()]));
        List<QuestionCount> typeCountList =  examQuestionsMapper.selectExamQuestionCountByType(detail);
        //设置返回值

        for(QuestionCount entity : typeCountList){
            if(entity.getType().equals(QuestionTypeEnum.SELECT.getCode())){
                examPaperDetail.setSelectCount(entity.getCount());
            }else if(entity.getType().equals(QuestionTypeEnum.SELECTS.getCode())){
                examPaperDetail.setSelectsCount(entity.getCount());
            }else if(entity.getType().equals(QuestionTypeEnum.TEXT.getCode())){
                examPaperDetail.setAnswerCount(entity.getCount());
            }else if(entity.getType().equals(QuestionTypeEnum.VERDICT.getCode())){
                examPaperDetail.setJudgeCount(entity.getCount());
            }
        }
        return examPaperDetail;
    }

    /** 生成试卷的时候 按照试卷详情生成具体的题目信息*/
    @Override
    public List<ExamQuestions> selectExamQuestionByLabelsBanks(ExamPaperDetail examPaperDetail) {
        return examQuestionsMapper.selectExamQuestionByLabelsBanks(examPaperDetail);
    }


    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            Boolean reasonable = pageDomain.getReasonable();
            PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
        }
    }

    @Override
    @LogAop(title = "这个是试题模块",businessType = BusinessType.OTHER,remark = "这个是备注 查看模块")
    public TableDataInfo selectExamQuestionAndOptionsByLabelsBanks(ExamQuestions examPaperDetail) {
        LoginUser user = SecurityUtils.getLoginUser();
        //获取所有的复合条件的题目
        examPaperDetail.setUserId(getUserId());
        List<ExamQuestionShowVo> questionsList = examQuestionsMapper.selectExamQuestionShowVo(examPaperDetail);
        List<ExamQuestionShowVo> resList = new ArrayList<>(questionsList);
        TableDataInfo tableDataInfo = getDataTable(questionsList);
        //判断题目数量是否为小于1
        if(resList.size()<1){
            return  tableDataInfo;
        }
        //取出题目的id
        List<Long> questionIdList = resList.stream().map(ExamQuestionShowVo::getId).collect(Collectors.toList());
        //根据题目的id取出所有的选项的id
        List<ExamOption> optionsList = optionService.selectExamOptionByquestionId(questionIdList.toArray(new Long[questionIdList.size()] ));
        //题目匹配选项然后做信息返回
        List<ExamQuestionVo> questionVoList =  resList.stream().map(item->{
            ExamQuestionVo questionVo = new ExamQuestionVo();
            BeanUtil.copyProperties(item, questionVo, "");
            questionVo.setOptionVoList(
            optionsList.stream().filter(obj->item.getId().equals(obj.getOptionId())).map(obj->{
                ExamOptionVo optionVo = new ExamOptionVo();
                BeanUtil.copyProperties(obj, optionVo, "");
                return optionVo;
            }).collect(Collectors.toList())
            );
            return questionVo;
        }).collect(Collectors.toList());
        tableDataInfo.setRows(questionVoList);

        return tableDataInfo;
    }

    public void exec(){
        System.out.println(Thread.currentThread().getName()+"---------1111--------------------------");
        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    //do Something
                    System.out.println("执行结束---------------------------");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        },1000*60*2,1000);
    }


    /**
     * 查询试题列表
     *
     * @param examQuestions 试题
     * @return 试题
     */
    @Override
    public List<ExamQuestions> selectExamQuestionsList(ExamQuestions examQuestions)
    {
        //TODO  只显示当前拥有的题库的 题目\
        /**
         * 先查询当前用户的题库数据
         */
        return examQuestionsMapper.selectExamQuestionsList(examQuestions);
    }

    /**
     * 新增试题
     *
     * @param examQuestions 试题
     * @return 结果
     */
    @Override
    public int insertExamQuestions(ExamQuestions examQuestions)
    {
        examQuestions.setCreateTime(DateUtils.getNowDate());
        return examQuestionsMapper.insertExamQuestions(examQuestions);
    }

    @SuppressWarnings("AlibabaTransactionMustHaveRollback")
    @Override
    @Transactional
    @LogAop(title = "新增的方法")
    public int addExamQuestions(ExamQuestionsDto.Add.Input params) {
        //判断是否有需要新建的标签
        if(params.getNewLabelList().size()>0){
            //如果有 就添加进去
            List <ExamLabel> labelList =  params.getNewLabelList().stream().map(item->{
                ExamLabel label = new ExamLabel();
                label.setName(item);
                label.setCreateUser(getUsername());
                label.setCreateTime(new Date());
                return label;
            }).collect(Collectors.toList());
            labelService.insertBatchExamLabel(labelList);
            labelList.forEach(item->{
                params.getLabels().add(item.getId().intValue());
            });
        }
        System.out.println(params.getLabels().toString());
        //试题的实体类
        ExamQuestions question = new ExamQuestions();
        BeanUtil.copyProperties(params, question, "");
        //判断要添加的题目类型
        if(params.getType().equals(QuestionTypeEnum.SELECT.getCode())){
            //单选题
            question.setSelectAnswer(params.getSelectAnswer().toString());
        }else
        if(params.getType().equals(QuestionTypeEnum.SELECTS.getCode())){
            //多选题
            String str = "";
            for(int i=0;i<params.getSelectAnswers().size() ;i++){
                if(i==0){
                    str = params.getSelectAnswers().get(i).toString();
                }else {
                    str = str +","+ params.getSelectAnswers().get(i);
                }
            }
            question.setSelectAnswer(str);
        }else
        if(params.getType().equals(QuestionTypeEnum.VERDICT.getCode())){
            //判断题
            int s = params.getJudgeAnswer()?0:1;
            question.setJudgeAnswer(s);
        }else
        if(params.getType().equals(QuestionTypeEnum.TEXT.getCode())){
            //问答题
            question.setAnswer(params.getAnswer());
        }
        //设置是否启用的属性
        int s = params.getIsEnable()?0:1;
        question.setIsEnable(s);
        //调用添加试题的方法
        int count = this.insertExamQuestions(question);
        //批量添加题库，添加标签
        insertBatchBankQuestion(question, params.getBanks());
        insertBatchLabelQuestion(question, params.getLabels());
        //TODO 方法做拆分
        //多选题或者单选题 添加选项并修改题目答案绑定
        insertOptions(params.getList(),question);
        return count;
    }

    @Override
    public Map uploadExamQuestions(MultipartFile file) throws IOException {
        Map map = new HashMap();
        //上传文件 并获取到文件名称
        String fileName= FileUploadUtils.upload( file);
        map.put("fileName", fileName);
        //读取文件

        BufferedReader reader = null;
        System.out.println(RuoYiConfig.getProfile()+fileName.replace("profile", ""));
        File files = new File(RuoYiConfig.getProfile()+fileName.replace("profile", ""));
        StringBuffer sbf = new StringBuffer();
        try {
            reader = new BufferedReader(new FileReader(files));
            String tempStr;
            while ((tempStr = reader.readLine()) != null) {
                sbf.append(tempStr);
            }
            reader.close();
            map.put("str", sbf.toString());
            return map;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
        return map;
    }

    /*批量添加实体与题库的关系*/
    private void insertBatchBankQuestion(ExamQuestions question,List<Integer> bankIds){
        if(bankIds.size()>0){
            List<ExamQuestionBankQuestions> list  = bankIds.stream().map(item->{
                ExamQuestionBankQuestions entity = new ExamQuestionBankQuestions();
                entity.setExaminationQuestionId(question.getId());
                entity.setQuestionBankId(item.longValue());
                return entity;
            }).collect(Collectors.toList());
            System.out.println(list);
            int count = questionBankQuestionsService.insertBatchExamQuestionBankQuestions(list);
            if(count!=bankIds.size()){
                throw new RuntimeException("添加题库与试题关系失败");
            }
        }
    };

    /*批量添加试题与标签的关系*/
    private void insertBatchLabelQuestion(ExamQuestions question,List<Integer> labelIds){
        if(labelIds.size()>0){
            List<ExamLabelQuestions> list  = labelIds.stream().map(item->{
                ExamLabelQuestions entity = new ExamLabelQuestions();
                entity.setExaminationQuestionsId(question.getId());
                entity.setLabelId(item.longValue());
                return entity;
            }).collect(Collectors.toList());
            int count = labelQuestionsService.insertBatchExamLabelQuestions(list);
            if(count!=labelIds.size()){
                throw new RuntimeException("添加标签与试题关系失败");
            }
        }
    };

    /*多选题添加选项*/
    private void insertOptions(List<ExamOptionDto.Add.Input> optionsList, ExamQuestions question){
        if(optionsList.size()>0){
            //调用批量添加选项的方法，整理初始化数据
            List<ExamOption> optionList = new ArrayList<>();
            for(ExamOptionDto.Add.Input item : optionsList){
                ExamOption option = new ExamOption();
                //设置试题的主键
                option.setOptionId(question.getId());
                option.setOptionContent(item.getName());
                optionList.add(option);
            }
            int count = optionService.insertBatchExamOption(optionList);
            if(count!=optionList.size()){
                throw new RuntimeException("批量添加试题选项失败");
            }
            //添加后 修改题目的正确答案 绑定选项的id
            this.updateOption(optionsList,optionList,question);
        }
    }

    /*多选题单选题在添加完选项后 修改题目的正确答案进行绑定*/
    public void updateOption(List<ExamOptionDto.Add.Input> optionsList,List<ExamOption> optionList,ExamQuestions question){
        List<ExamOption> list = optionList.stream().map(item->{
            optionsList.stream().forEach(obj->{
                if(item.getOptionContent().equals(obj.getName())){
                    item.setOptionContent(obj.getOption());
                }
            });
            return item;
        }).collect(Collectors.toList());
        //修改question 匹配正确的试题选项
        String answer = "";;
        int index = 0;
        for(ExamOption item : list ){
            /*if(params.getType().equals(QuestionTypeEnum.SELECT.getCode())){
                //不需要再次循环 直接进行替换即可
                if(item.getOptionContent().equals(question.getSelectAnswer())){
                    question.setSelectAnswer(item.getId().toString());
                }
            }else if(params.getType().equals(QuestionTypeEnum.SELECTS.getCode())){
                //多选，做切割，数组循环
                List<String> answerList = Arrays.asList(question.getSelectAnswer().split(","));
                for(String str : answerList){
                    if(str.equals(item.getOptionContent())){
                        answer= index==0?item.getId().toString():answer+","+item.getId();
                        index=index+1;
                    }
                }
            }*/
            //多选，做切割，数组循环
            List<String> answerList = Arrays.asList(question.getSelectAnswer().split(","));
            for(String str : answerList){
                if(str.equals(item.getOptionContent())){
                    answer= index==0?item.getId().toString():answer+","+item.getId();
                    index=index+1;
                }
            }
        };
        question.setSelectAnswer(answer);
        int count =   this.updateExamQuestions(question);
        if(count<1){
            throw new RuntimeException("修改题目正确答案失败");
        }
    }

    /**
     * 修改试题
     *
     * @param examQuestions 试题
     * @return 结果
     */
    @Override
    public int updateExamQuestions(ExamQuestions examQuestions)
    {
        return examQuestionsMapper.updateExamQuestions(examQuestions);
    }

    /**
     * 批量删除试题
     *
     * @param ids 需要删除的试题主键
     * @return 结果
     */
    @Override
    public int deleteExamQuestionsByIds(Long[] ids)
    {
        return examQuestionsMapper.deleteExamQuestionsByIds(ids);
    }

    /**
     * 删除试题信息
     *
     * @param id 试题主键
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteExamQuestionsById(Long id)
    {
        //删除选项
        optionService.deleteExamOptionByQuestionId(id);
        //删除标签绑定
        labelQuestionsService.deleteExamLabelQuestionsByQuestionId(id);
        //删除题库绑定
        questionBankQuestionsService.deleteExamQuestionBankQuestionsByQuestionId(id);
        //删除题目
        return examQuestionsMapper.deleteExamQuestionsById(id);
    }
}
