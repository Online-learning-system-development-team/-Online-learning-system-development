package com.ruoyi.exam.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 答题明细对象 exam_user_answer_details
 */
public class ExamUserAnswerDetails extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 答题表id */
    @Excel(name = "答题表id")
    private Long userAnswerId;

    /** 题目id */
    @Excel(name = "题目id")
    private Long examinationPaperQuestionsId;

    /** 题目类型 */
    @Excel(name = "题目类型")
    private String questionsType;

    /** 题目答案 */
    @Excel(name = "题目答案")
    private String userAnswer;

    /** 正确答案 */
    @Excel(name = "正确答案")
    private String questionsAnswer;

    /** 是否正确 */
    @Excel(name = "是否正确")
    private Integer isCorrect;

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
    public void setUserAnswerId(Long userAnswerId)
    {
        this.userAnswerId = userAnswerId;
    }

    public Long getUserAnswerId()
    {
        return userAnswerId;
    }
    public void setExaminationPaperQuestionsId(Long examinationPaperQuestionsId)
    {
        this.examinationPaperQuestionsId = examinationPaperQuestionsId;
    }

    public Long getExaminationPaperQuestionsId()
    {
        return examinationPaperQuestionsId;
    }
    public void setQuestionsType(String questionsType)
    {
        this.questionsType = questionsType;
    }

    public String getQuestionsType()
    {
        return questionsType;
    }
    public void setUserAnswer(String userAnswer)
    {
        this.userAnswer = userAnswer;
    }

    public String getUserAnswer()
    {
        return userAnswer;
    }
    public void setQuestionsAnswer(String questionsAnswer)
    {
        this.questionsAnswer = questionsAnswer;
    }

    public String getQuestionsAnswer()
    {
        return questionsAnswer;
    }
    public void setIsCorrect(Integer isCorrect)
    {
        this.isCorrect = isCorrect;
    }

    public Integer getIsCorrect()
    {
        return isCorrect;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userAnswerId", getUserAnswerId())
            .append("examinationPaperQuestionsId", getExaminationPaperQuestionsId())
            .append("questionsType", getQuestionsType())
            .append("userAnswer", getUserAnswer())
            .append("questionsAnswer", getQuestionsAnswer())
            .append("isCorrect", getIsCorrect())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("modifyUser", getModifyUser())
            .append("modifyTime", getModifyTime())
            .toString();
    }
}
