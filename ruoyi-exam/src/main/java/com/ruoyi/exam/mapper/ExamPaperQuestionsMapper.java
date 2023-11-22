package com.ruoyi.exam.mapper;

import java.util.List;
import com.ruoyi.exam.domain.ExamPaperQuestions;
import com.ruoyi.exam.domain.PaperQuestion;

/**
 * 试卷与试题关系Mapper接口
 */
public interface ExamPaperQuestionsMapper
{
    /**
     * 查询试卷与试题关系
     *
     * @param id 试卷与试题关系主键
     * @return 试卷与试题关系
     */
    public ExamPaperQuestions selectExamPaperQuestionsById(Long id);

    /*** 查询试卷的题目
     * @Summary
     * @param  id
     * @return  List<PaperQuestion>
     * @Author: TheRaging
     * @Date: 2021/12/19 21:32
     * @Description 查询试卷的题目
     */
    public List<PaperQuestion> selectPaperQuestionByPaperId(Long id);

    public List<PaperQuestion> selectPaperQuestionByPaperIds(Long[] id);

    /**
     * 查询试卷与试题关系列表
     *
     * @param examPaperQuestions 试卷与试题关系
     * @return 试卷与试题关系集合
     */
    public List<ExamPaperQuestions> selectExamPaperQuestionsList(ExamPaperQuestions examPaperQuestions);

    /**
     * 新增试卷与试题关系
     *
     * @param examPaperQuestions 试卷与试题关系
     * @return 结果
     */
    public int insertExamPaperQuestions(ExamPaperQuestions examPaperQuestions);

    /**
     * 批量新增试卷与试题关系
     *
     * @param examPaperQuestionsList 试卷与试题关系
     * @return 结果
     */
    public int insertBatchExamPaperQuestions(List<ExamPaperQuestions> examPaperQuestionsList);

    /**
     * 修改试卷与试题关系
     *
     * @param examPaperQuestions 试卷与试题关系
     * @return 结果
     */
    public int updateExamPaperQuestions(ExamPaperQuestions examPaperQuestions);

    /**
     * 删除试卷与试题关系
     *
     * @param id 试卷与试题关系主键
     * @return 结果
     */
    public int deleteExamPaperQuestionsById(Long id);

    /**
     * 批量删除试卷与试题关系
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExamPaperQuestionsByIds(Long[] ids);

    public int deleteExamPaperQuestionsByPaperIds(Long[] ids);
}
