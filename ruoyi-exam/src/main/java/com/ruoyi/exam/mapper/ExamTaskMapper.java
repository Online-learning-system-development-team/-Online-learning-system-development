package com.ruoyi.exam.mapper;

import java.util.List;
import com.ruoyi.exam.domain.ExamTask;
import org.apache.ibatis.annotations.Param;

/**
 * 考试任务Mapper接口
 */
public interface ExamTaskMapper
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

    public List<ExamTask> selectExamTaskListByPaperId(@Param("paperIds") Long[] paperIds);


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
     * 删除考试任务
     *
     * @param id 考试任务主键
     * @return 结果
     */
    public int deleteExamTaskById(Long id);

    /**
     * 批量删除考试任务
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExamTaskByIds(Long[] ids);
}
