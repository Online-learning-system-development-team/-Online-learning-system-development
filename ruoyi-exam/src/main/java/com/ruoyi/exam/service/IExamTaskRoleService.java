package com.ruoyi.exam.service;

import java.util.List;
import com.ruoyi.exam.domain.ExamTaskRole;

/**
 * 考试任务与角色关系Service接口
 */
public interface IExamTaskRoleService
{
    /**
     * 查询考试任务与角色关系
     *
     * @param id 考试任务与角色关系主键
     * @return 考试任务与角色关系
     */
    public ExamTaskRole selectExamTaskRoleById(Long id);

    /**
     * 查询考试任务与角色关系列表
     *
     * @param examTaskRole 考试任务与角色关系
     * @return 考试任务与角色关系集合
     */
    public List<ExamTaskRole> selectExamTaskRoleList(ExamTaskRole examTaskRole);

    /**
     * 新增考试任务与角色关系
     *
     * @param examTaskRole 考试任务与角色关系
     * @return 结果
     */
    public int insertExamTaskRole(ExamTaskRole examTaskRole);

    /**
     * 修改考试任务与角色关系
     *
     * @param examTaskRole 考试任务与角色关系
     * @return 结果
     */
    public int updateExamTaskRole(ExamTaskRole examTaskRole);

    /**
     * 批量删除考试任务与角色关系
     *
     * @param ids 需要删除的考试任务与角色关系主键集合
     * @return 结果
     */
    public int deleteExamTaskRoleByIds(Long[] ids);

    /**
     * 删除考试任务与角色关系信息
     *
     * @param id 考试任务与角色关系主键
     * @return 结果
     */
    public int deleteExamTaskRoleById(Long id);
}
