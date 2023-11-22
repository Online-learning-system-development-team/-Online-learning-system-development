package com.ruoyi.exam.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 题库与试题关系对象 exam_question_bank_questions
 */
public class ExamQuestionBankQuestions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 题库id */
    @Excel(name = "题库id")
    private Long questionBankId;

    /** 试题id */
    @Excel(name = "试题id")
    private Long examinationQuestionId;

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
    public void setExaminationQuestionId(Long examinationQuestionId)
    {
        this.examinationQuestionId = examinationQuestionId;
    }

    public Long getExaminationQuestionId()
    {
        return examinationQuestionId;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionBankId", getQuestionBankId())
            .append("examinationQuestionId", getExaminationQuestionId())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("modifyUser", getModifyUser())
            .append("modifyTime", getModifyTime())
            .toString();
    }
}
