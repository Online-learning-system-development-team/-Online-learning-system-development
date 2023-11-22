package com.ruoyi.exam.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.ruoyi.common.exception.base.BaseException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.exam.domain.ExamPaper;
import com.ruoyi.exam.domain.ExamTask;
import com.ruoyi.exam.domain.ExamUserAnswerDetails;
import com.ruoyi.exam.dto.ExamUserAnswerDto;
import com.ruoyi.exam.mapper.ExamPaperMapper;
import com.ruoyi.exam.mapper.ExamTaskMapper;
import com.ruoyi.exam.mapper.ExamUserAnswerDetailsMapper;
import com.ruoyi.exam.service.IExamPaperQuestionsService;
import com.ruoyi.exam.vo.ExamUserAnswerVo;
import com.ruoyi.exam.vo.TaskPaperVo;
import com.ruoyi.exam.vo.UserAnswerDetailVo;
import com.ruoyi.exam.vo.UserAnswerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamUserAnswerMapper;
import com.ruoyi.exam.domain.ExamUserAnswer;
import com.ruoyi.exam.service.IExamUserAnswerService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户答题Service业务层处理
 */
@Service
public class ExamUserAnswerServiceImpl implements IExamUserAnswerService
{
    @Autowired
    private ExamUserAnswerMapper examUserAnswerMapper;

    @Autowired
    private ExamUserAnswerDetailsMapper examUserAnswerDetailsMapper;

    @Autowired
    private IExamPaperQuestionsService paperQuestionsService;

    @Autowired
    private ExamTaskMapper examTaskMapper;

    /**
     * 查询用户答题
     *
     * @param id 用户答题主键
     * @return 用户答题
     */
    @Override
    public ExamUserAnswer selectExamUserAnswerById(Long id)
    {
        return examUserAnswerMapper.selectExamUserAnswerById(id);
    }

    /**
     * 查询用户答题列表
     *
     * @param examUserAnswer 用户答题
     * @return 用户答题
     */
    @Override
    public List<ExamUserAnswerVo> selectExamUserAnswerList(ExamUserAnswer examUserAnswer)
    {
        return examUserAnswerMapper.selectExamUserAnswerListVo(examUserAnswer);
    }

    @Override
    public UserAnswerVo selectExamUserAnswerByPaperIdList(Long id) {
        //先根据试卷id和用户id查找到历史的错题
        ExamUserAnswer userAnswer =  this.examUserAnswerMapper.selectExamUserAnswerById(id);
        //查找到试卷
        TaskPaperVo taskPaperVo =  this.paperQuestionsService.selectPaperQuestionByPaperList(userAnswer.getExaminationPaperId());
        //查找到用户此次答题的详情
        ExamUserAnswerDetails userAnswerDetails = new ExamUserAnswerDetails();
        userAnswerDetails.setUserAnswerId(id);
        List<ExamUserAnswerDetails> userAnswerDetailsList = this.examUserAnswerDetailsMapper
                .selectExamUserAnswerDetailsList(userAnswerDetails);
        UserAnswerVo userAnswerVo = new UserAnswerVo();
        BeanUtil.copyProperties(taskPaperVo,userAnswerVo,"");
        List<UserAnswerDetailVo> list = userAnswerVo.getQuestionList().stream().map(item->{
            ExamUserAnswerDetails answerDetails =  userAnswerDetailsList.stream().filter(obj->obj.getExaminationPaperQuestionsId().equals(item.getId())).findFirst().orElse(new ExamUserAnswerDetails());
            item.setUserAnswer(answerDetails.getUserAnswer());
            item.setSelectAnswer(answerDetails.getQuestionsAnswer());
            item.setIsCorrect(answerDetails.getIsCorrect());
            return  item;
        }).collect(Collectors.toList());
        userAnswerVo.setQuestionList(list);
        userAnswerVo.setTotalPoints(userAnswer.getTotalPoints());
        return userAnswerVo;
    }

    /**
     * 新增用户答题
     *
     * @param examUserAnswer 用户答题
     * @return 结果
     */
    @Override
    public int insertExamUserAnswer(ExamUserAnswer examUserAnswer)
    {
        examUserAnswer.setCreateTime(DateUtils.getNowDate());
        return examUserAnswerMapper.insertExamUserAnswer(examUserAnswer);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertExamUserAnswer(ExamUserAnswerDto.Add.Input examUserAnswer) {
        ExamUserAnswer userAnswer = new ExamUserAnswer();
        BeanUtil.copyProperties(examUserAnswer, userAnswer, "");
        userAnswer.setTotalPoints(examUserAnswer.getTotalPoints().longValue());
        Date start = DateUtils.getNowDate();
        userAnswer.setCreateTime(start);
        int count = examUserAnswerMapper.insertExamUserAnswer(userAnswer);
        if(count!=1){
            throw new BaseException("插入用户的答题试卷失败");
        }
        List<ExamUserAnswerDetails> userAnswerDetailsList =
                examUserAnswer.getOptionList().stream().map(item->{
                    ExamUserAnswerDetails userAnswerDetails = new ExamUserAnswerDetails();
                    userAnswerDetails.setUserAnswerId(userAnswer.getId());
                    userAnswerDetails.setCreateUser(examUserAnswer.getCreateUser());
                    BeanUtil.copyProperties(item, userAnswerDetails, "");
                    userAnswerDetails.setCreateTime(start);
                    return  userAnswerDetails;
                }).collect(Collectors.toList());
        count = this.examUserAnswerDetailsMapper.insertBatchExamUserAnswerDetails(userAnswerDetailsList);
        if(count!=userAnswerDetailsList.size()){
            throw new BaseException("插入用户的答题详情失败");
        }
        return userAnswer.getId().intValue();
    }

    /**
     * 修改用户答题
     *
     * @param examUserAnswer 用户答题
     * @return 结果
     */
    @Override
    public int updateExamUserAnswer(ExamUserAnswer examUserAnswer)
    {
        return examUserAnswerMapper.updateExamUserAnswer(examUserAnswer);
    }

    /**
     * 批量删除用户答题
     *
     * @param ids 需要删除的用户答题主键
     * @return 结果
     */
    @Override
    public int deleteExamUserAnswerByIds(Long[] ids)
    {
        return examUserAnswerMapper.deleteExamUserAnswerByIds(ids);
    }

    /**
     * 删除用户答题信息
     *
     * @param id 用户答题主键
     * @return 结果
     */
    @Override
    public int deleteExamUserAnswerById(Long id)
    {
        return examUserAnswerMapper.deleteExamUserAnswerById(id);
    }

    @Override
    public Boolean answerFrequency(Long userId, Long taskId) {
        ExamTask examPaper = examTaskMapper.selectExamTaskById(taskId);
        ExamUserAnswer answer = new ExamUserAnswer();
        answer.setUserId(userId);
        answer.setExaminationPaperId(examPaper.getExaminationPaperId());
        answer.setTaskId(examPaper.getId());
        List<ExamUserAnswer> examUserAnswers = examUserAnswerMapper.selectExamUserAnswerList(answer);
        int size = examUserAnswers.size();
        Long count = examPaper.getCount();
        return count > size;
    }
}
