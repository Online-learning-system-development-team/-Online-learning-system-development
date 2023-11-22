package com.ruoyi.exam.service;

import java.util.List;
import com.ruoyi.exam.domain.ExamUserAnswer;
import com.ruoyi.exam.dto.ExamUserAnswerDto;
import com.ruoyi.exam.vo.ExamUserAnswerVo;
import com.ruoyi.exam.vo.UserAnswerVo;

/**
 * 用户答题Service接口
 */
public interface IExamUserAnswerService
{
    /**
     * 查询用户答题
     *
     * @param id 用户答题主键
     * @return 用户答题
     */
    public ExamUserAnswer selectExamUserAnswerById(Long id);

    /**
     * 查询用户答题列表
     *
     * @param examUserAnswer 用户答题
     * @return 用户答题集合
     */
    public List<ExamUserAnswerVo> selectExamUserAnswerList(ExamUserAnswer examUserAnswer);

    /**
     * 查询用户答题列表
     *
     * @param id 用户对试卷答题的 答题id
     * @return 用户答题集合
     */
    public UserAnswerVo selectExamUserAnswerByPaperIdList(Long id);

    /**
     * 新增用户答题
     *
     * @param examUserAnswer 用户答题
     * @return 结果
     */
    public int insertExamUserAnswer(ExamUserAnswer examUserAnswer);


    /**
     * 新增用户历史答题
     *
     * @param examUserAnswer 用户答题
     * @return 结果
     */
    public int insertExamUserAnswer(ExamUserAnswerDto.Add.Input examUserAnswer);

    /**
     * 修改用户答题
     *
     * @param examUserAnswer 用户答题
     * @return 结果
     */
    public int updateExamUserAnswer(ExamUserAnswer examUserAnswer);

    /**
     * 批量删除用户答题
     *
     * @param ids 需要删除的用户答题主键集合
     * @return 结果
     */
    public int deleteExamUserAnswerByIds(Long[] ids);

    /**
     * 删除用户答题信息
     *
     * @param id 用户答题主键
     * @return 结果
     */
    public int deleteExamUserAnswerById(Long id);

    /**
     * 查询是否还能答题
     *
     * @param userId 用户id
     * @param taskId 任务id
     * @return true为能，false相反
     */
    Boolean answerFrequency(Long userId,Long taskId);
}
