package com.ruoyi.exam.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 题库与角色关系对象 exam_question_bank_role
 */
public class ExamQuestionBankRole extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 题库id */
    @Excel(name = "题库id")
    private Long questionBankId;

    /** 角色id */
    @Excel(name = "角色id")
    private Long roleId;

    /** 创建用户 */
    @Excel(name = "创建用户")
    private String createUser;

    /** 修改用户 */
    @Excel(name = "修改用户")
    private String modifyUser;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifyTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setQuestionBankId(Long questionBankId)
    {
        this.questionBankId = questionBankId;
    }

    public Long getQuestionBankId()
    {
        return questionBankId;
    }
    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionBankId", getQuestionBankId())
            .append("roleId", getRoleId())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("modifyUser", getModifyUser())
            .append("modifyTime", getModifyTime())
            .toString();
    }
}
