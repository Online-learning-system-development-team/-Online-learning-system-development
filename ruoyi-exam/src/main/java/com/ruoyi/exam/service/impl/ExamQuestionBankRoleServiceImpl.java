package com.ruoyi.exam.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamQuestionBankRoleMapper;
import com.ruoyi.exam.domain.ExamQuestionBankRole;
import com.ruoyi.exam.service.IExamQuestionBankRoleService;

/**
 * 题库与角色关系Service业务层处理
 */
@Service
public class ExamQuestionBankRoleServiceImpl implements IExamQuestionBankRoleService
{
    @Autowired
    private ExamQuestionBankRoleMapper examQuestionBankRoleMapper;

    /**
     * 查询题库与角色关系
     *
     * @param id 题库与角色关系主键
     * @return 题库与角色关系
     */
    @Override
    public ExamQuestionBankRole selectExamQuestionBankRoleById(Long id)
    {
        return examQuestionBankRoleMapper.selectExamQuestionBankRoleById(id);
    }

    /**
     * 查询题库与角色关系列表
     *
     * @param examQuestionBankRole 题库与角色关系
     * @return 题库与角色关系
     */
    @Override
    public List<ExamQuestionBankRole> selectExamQuestionBankRoleList(ExamQuestionBankRole examQuestionBankRole)
    {
        return examQuestionBankRoleMapper.selectExamQuestionBankRoleList(examQuestionBankRole);
    }

    /**
     * 新增题库与角色关系
     *
     * @param examQuestionBankRole 题库与角色关系
     * @return 结果
     */
    @Override
    public int insertExamQuestionBankRole(ExamQuestionBankRole examQuestionBankRole)
    {
        examQuestionBankRole.setCreateTime(DateUtils.getNowDate());
        return examQuestionBankRoleMapper.insertExamQuestionBankRole(examQuestionBankRole);
    }

    /**
     * 修改题库与角色关系
     *
     * @param examQuestionBankRole 题库与角色关系
     * @return 结果
     */
    @Override
    public int updateExamQuestionBankRole(ExamQuestionBankRole examQuestionBankRole)
    {
        return examQuestionBankRoleMapper.updateExamQuestionBankRole(examQuestionBankRole);
    }

    /**
     * 批量删除题库与角色关系
     *
     * @param ids 需要删除的题库与角色关系主键
     * @return 结果
     */
    @Override
    public int deleteExamQuestionBankRoleByIds(Long[] ids)
    {
        return examQuestionBankRoleMapper.deleteExamQuestionBankRoleByIds(ids);
    }

    /**
     * 删除题库与角色关系信息
     *
     * @param id 题库与角色关系主键
     * @return 结果
     */
    @Override
    public int deleteExamQuestionBankRoleById(Long id)
    {
        return examQuestionBankRoleMapper.deleteExamQuestionBankRoleById(id);
    }
}
