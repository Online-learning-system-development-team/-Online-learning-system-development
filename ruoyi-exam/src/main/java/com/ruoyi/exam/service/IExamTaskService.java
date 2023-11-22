package com.ruoyi.exam.service;

import java.util.List;
import com.ruoyi.exam.domain.ExamTask;

/**
 * 考试任务Service接口
 */
public interface IExamTaskService
{
    /**
     * 查询考试任务
     *
     * @param id 考试任务主键
     * @return 考试任务
     */
    public ExamTask selectExamTaskById(Long id);

    /**
     * 查询考试任务列表
     *
     * @param examTask 考试任务
     * @return 考试任务集合
     */
    public List<ExamTask> selectExamTaskList(ExamTask examTask);

    /**
     * 新增考试任务
     *
     * @param examTask 考试任务
     * @return 结果
     */
    public int insertExamTask(ExamTask examTask);

    /**
     * 修改考试任务
     *
     * @param examTask 考试任务
     * @return 结果
     */
    public int updateExamTask(ExamTask examTask);

    /**
     * 批量删除考试任务
     *
     * @param ids 需要删除的考试任务主键集合
     * @return 结果
     */
    public int deleteExamTaskByIds(Long[] ids) throws Exception;

    /**
     * 删除考试任务信息
     *
     * @param id 考试任务主键
     * @return 结果
     */
    public int deleteExamTaskById(Long id) throws Exception;
}
