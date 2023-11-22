package com.ruoyi.exam.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.exam.domain.ExamPaper;
import com.ruoyi.exam.domain.ExamPaperDetail;
import com.ruoyi.exam.domain.ExamTask;
import com.ruoyi.exam.domain.PaperOption;
import com.ruoyi.exam.domain.PaperQuestion;
import com.ruoyi.exam.enums.QuestionTypeEnum;
import com.ruoyi.exam.mapper.ExamPaperQuestionsOptionMapper;
import com.ruoyi.exam.service.IExamPaperQuestionsOptionService;
import com.ruoyi.exam.service.IExamPaperService;
import com.ruoyi.exam.service.IExamTaskService;
import com.ruoyi.exam.vo.PaperQuestionOptionVo;
import com.ruoyi.exam.vo.PaperQuestionVo;
import com.ruoyi.exam.vo.TaskPaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamPaperQuestionsMapper;
import com.ruoyi.exam.domain.ExamPaperQuestions;
import com.ruoyi.exam.service.IExamPaperQuestionsService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 试卷与试题关系Service业务层处理
 */
@Service
public class ExamPaperQuestionsServiceImpl implements IExamPaperQuestionsService
{
    @Autowired
    private ExamPaperQuestionsMapper examPaperQuestionsMapper;


    @Autowired
    private IExamPaperService paperService;

    @Autowired
    private IExamPaperQuestionsOptionService paperQuestionsOptionService;

    @Autowired
    private ExamPaperQuestionsOptionMapper paperQuestionsOptionMapper;

    /**
     * 查询试卷与试题关系
     *
     * @param id 试卷与试题关系主键
     * @return 试卷与试题关系
     */
    @Override
    public ExamPaperQuestions selectExamPaperQuestionsById(Long id)
    {
        return examPaperQuestionsMapper.selectExamPaperQuestionsById(id);
    }


    /**
     * 查询试卷与试题关系
     *
     * @param     paperId 试卷ID
     * @return 试卷与试题关系
     */
    @Override
    public TaskPaperVo selectPaperQuestionByPaperList(Long paperId)
    {
        //查询试卷
        ExamPaper paper = paperService.selectExamPaperById(paperId);
        if(!StringUtils.isNotNull(paper)){
            throw new ServiceException("未查询到任务关联的该试卷");
        }
        //查询考题
        List<PaperQuestion> paperQuestionList = examPaperQuestionsMapper.selectPaperQuestionByPaperId(paper.getId());
        if(paperQuestionList.size()<1){
            throw new ServiceException("该任务关联的试卷试题数量为空");
        }
        //获取查询的考题的id集合
        List<Long> paperQuestionIdList = paperQuestionList.stream().map(PaperQuestion::getId).collect(Collectors.toList());
        //查询选项
        List<PaperOption> paperOptionList = paperQuestionsOptionService.selectPaperOptionByQuestionIdList(paperQuestionIdList);
        //初始化需要返回的实体类
        TaskPaperVo taskPaperVo = new TaskPaperVo();
        BeanUtil.copyProperties(paper, taskPaperVo, "");
        //数据匹配
        List<PaperQuestionVo> questionVoList = new ArrayList<>();
        paperQuestionList.forEach(item->{
            PaperQuestionVo question = new PaperQuestionVo();
            BeanUtil.copyProperties(item, question, "");
            if(item.getQuestionsType().equals(QuestionTypeEnum.SELECT.getCode())||
            item.getQuestionsType().equals(QuestionTypeEnum.SELECTS.getCode())){
                //如果是选项题 就匹配出来 查找题目的选项
                List<PaperOption> paperOptionsList = paperOptionList.stream().filter(obj->
                        obj.getQuestionsId().equals(item.getId())).collect(Collectors.toList());
                //获取vo
                List<PaperQuestionOptionVo> paperQuestionOptionList = paperOptionsList.stream()
                        .map(obj->{
                            PaperQuestionOptionVo option =  new PaperQuestionOptionVo();
                            BeanUtil.copyProperties(obj,option,"");
                            return option;
                        })
                        .collect(Collectors.toList());
                //匹配正确答案
                String[] answerIds = StringUtils.split(item.getSelectAnswer(), ',');
                List<String> answerList = new ArrayList<>();
                for(String str : answerIds){
                    PaperOption paperOption =  paperOptionsList.stream().filter(optionid->optionid.getOptionId().equals(Long.valueOf(str)))
                            .findFirst().orElse(null);
                    if(StringUtils.isNotNull(paperOption)){
                        answerList.add(paperOption.getSerialNumber());
                    }
                }
                question.setSelectAnswer(StringUtils.join(answerList,','));
                question.setOptionList(paperQuestionOptionList);
            }
            questionVoList.add(question);
        });
        taskPaperVo.setQuestionList(questionVoList);
        return taskPaperVo;
    }

    /**
     * 查询试卷与试题关系列表
     *
     * @param examPaperQuestions 试卷与试题关系
     * @return 试卷与试题关系
     */
    @Override
    public List<ExamPaperQuestions> selectExamPaperQuestionsList(ExamPaperQuestions examPaperQuestions)
    {
        return examPaperQuestionsMapper.selectExamPaperQuestionsList(examPaperQuestions);
    }

    /**
     * 新增试卷与试题关系
     *
     * @param examPaperQuestions 试卷与试题关系
     * @return 结果
     */
    @Override
    public int insertExamPaperQuestions(ExamPaperQuestions examPaperQuestions)
    {
        examPaperQuestions.setCreateTime(DateUtils.getNowDate());
        return examPaperQuestionsMapper.insertExamPaperQuestions(examPaperQuestions);
    }

    @Override
    public int insertBatchExamPaperQuestions(List<ExamPaperQuestions> examPaperQuestionsList) {
        return examPaperQuestionsMapper.insertBatchExamPaperQuestions(examPaperQuestionsList);
    }




    /**
     * 修改试卷与试题关系
     *
     * @param examPaperQuestions 试卷与试题关系
     * @return 结果
     */
    @Override
    public int updateExamPaperQuestions(ExamPaperQuestions examPaperQuestions)
    {
        return examPaperQuestionsMapper.updateExamPaperQuestions(examPaperQuestions);
    }

    /**
     * 批量删除试卷与试题关系
     *
     * @param ids 需要删除的试卷与试题关系主键
     * @return 结果
     */
    @Override
    public int deleteExamPaperQuestionsByIds(Long[] ids)
    {
        return examPaperQuestionsMapper.deleteExamPaperQuestionsByIds(ids);
    }

    /**
     * 删除试卷与试题关系信息
     *
     * @param id 试卷与试题关系主键
     * @return 结果
     */
    @Override
    public int deleteExamPaperQuestionsById(Long id)
    {
        return examPaperQuestionsMapper.deleteExamPaperQuestionsById(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteExamPaperQuestionsByPaperids(Long[] paperIds) {
        //根据试卷的id查询所有关联的试题  方便删除 试题关联的选项
        List<PaperQuestion> list = examPaperQuestionsMapper.selectPaperQuestionByPaperIds(paperIds);
        if(StringUtils.isNotNull(list)&&list.size()>0){
            //删除关联的试题表
            int count = examPaperQuestionsMapper.deleteExamPaperQuestionsByPaperIds(paperIds);
            //删除关联的试题选项表
            Long[] questionIds = list.stream().map(PaperQuestion::getId).collect(Collectors.toList()).toArray(new Long[list.size()]);
            count = paperQuestionsOptionMapper.deleteExamPaperQuestionsOptionByPaperIds(questionIds);
        }
        return true;
    }
}
