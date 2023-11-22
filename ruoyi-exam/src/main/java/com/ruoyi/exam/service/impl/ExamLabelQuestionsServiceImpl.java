package com.ruoyi.exam.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.exam.mapper.ExamLabelMapper;
import com.ruoyi.exam.vo.ExamBankQuestionCountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamLabelQuestionsMapper;
import com.ruoyi.exam.domain.ExamLabelQuestions;
import com.ruoyi.exam.service.IExamLabelQuestionsService;

/**
 * 试题与标签的关系Service业务层处理
 */
@Service
public class ExamLabelQuestionsServiceImpl implements IExamLabelQuestionsService
{
    @Autowired
    private ExamLabelQuestionsMapper examLabelQuestionsMapper;

    /**
     * 查询试题与标签的关系
     *
     * @param id 试题与标签的关系主键
     * @return 试题与标签的关系
     */
    @Override
    public ExamLabelQuestions selectExamLabelQuestionsById(Long id)
    {
        return examLabelQuestionsMapper.selectExamLabelQuestionsById(id);
    }

    /**
     * 查询试题与标签的关系列表
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 试题与标签的关系
     */
    @Override
    public List<ExamLabelQuestions> selectExamLabelQuestionsList(ExamLabelQuestions examLabelQuestions)
    {
        return examLabelQuestionsMapper.selectExamLabelQuestionsList(examLabelQuestions);
    }



    /**
     * 新增试题与标签的关系
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 结果
     */
    @Override
    public int insertExamLabelQuestions(ExamLabelQuestions examLabelQuestions)
    {
        examLabelQuestions.setCreateTime(DateUtils.getNowDate());
        return examLabelQuestionsMapper.insertExamLabelQuestions(examLabelQuestions);
    }

    /**
     * 批量新增试题与标签的关系
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 结果
     */
    @Override
    public int insertBatchExamLabelQuestions(List<ExamLabelQuestions> examLabelQuestions) {
        return examLabelQuestionsMapper.insertBatchExamLabelQuestions(examLabelQuestions);
    }

    /**
     * 修改试题与标签的关系
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 结果
     */
    @Override
    public int updateExamLabelQuestions(ExamLabelQuestions examLabelQuestions)
    {
        return examLabelQuestionsMapper.updateExamLabelQuestions(examLabelQuestions);
    }

    /**
     * 批量删除试题与标签的关系
     *
     * @param ids 需要删除的试题与标签的关系主键
     * @return 结果
     */
    @Override
    public int deleteExamLabelQuestionsByIds(Long[] ids)
    {
        return examLabelQuestionsMapper.deleteExamLabelQuestionsByIds(ids);
    }

    /**
     * 删除试题与标签的关系信息
     *
     * @param id 试题与标签的关系主键
     * @return 结果
     */
    @Override
    public int deleteExamLabelQuestionsById(Long id)
    {
        return examLabelQuestionsMapper.deleteExamLabelQuestionsById(id);
    }

    /**
     * 删除试题与标签的关系信息
     *
     * @param questionId 试题与标签的关系主键
     * @return 结果
     */
    @Override
    public int deleteExamLabelQuestionsByQuestionId(Long questionId) {
        return examLabelQuestionsMapper.deleteExamLabelQuestionsByQuestionId(questionId);
    }
}
