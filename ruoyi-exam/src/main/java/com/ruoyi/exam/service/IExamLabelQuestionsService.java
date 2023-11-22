package com.ruoyi.exam.service;

import java.util.List;
import com.ruoyi.exam.domain.ExamLabelQuestions;
import com.ruoyi.exam.vo.ExamBankQuestionCountVo;

/**
 * 试题与标签的关系Service接口
 */
public interface IExamLabelQuestionsService
{
    /**
     * 查询试题与标签的关系
     *
     * @param id 试题与标签的关系主键
     * @return 试题与标签的关系
     */
    public ExamLabelQuestions selectExamLabelQuestionsById(Long id);

    /**
     * 查询试题与标签的关系列表
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 试题与标签的关系集合
     */
    public List<ExamLabelQuestions> selectExamLabelQuestionsList(ExamLabelQuestions examLabelQuestions);


    /**
     * 新增试题与标签的关系
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 结果
     */
    public int insertExamLabelQuestions(ExamLabelQuestions examLabelQuestions);

    /**
     * 批量新增试题与标签的关系
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 结果
     */
    public int insertBatchExamLabelQuestions(List<ExamLabelQuestions> examLabelQuestions);

    /**
     * 修改试题与标签的关系
     *
     * @param examLabelQuestions 试题与标签的关系
     * @return 结果
     */
    public int updateExamLabelQuestions(ExamLabelQuestions examLabelQuestions);

    /**
     * 批量删除试题与标签的关系
     *
     * @param ids 需要删除的试题与标签的关系主键集合
     * @return 结果
     */
    public int deleteExamLabelQuestionsByIds(Long[] ids);

    /**
     * 删除试题与标签的关系信息
     *
     * @param id 试题与标签的关系主键
     * @return 结果
     */
    public int deleteExamLabelQuestionsById(Long id);

    /**
     * 删除试题与标签的关系信息
     *
     * @param questionId 试题与标签的关系主键
     * @return 结果
     */
    public int deleteExamLabelQuestionsByQuestionId(Long questionId);
}
