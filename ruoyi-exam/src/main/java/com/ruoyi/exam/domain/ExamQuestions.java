package com.ruoyi.exam.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 试题对象 exam_questions
 */
public class ExamQuestions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 题目的图片 */
    @Excel(name = "题目图片")
    private String images;

    /** 主键id */
    private Long id;

    /** 题目 */
    @Excel(name = "题目")
    private String name;

    /** 题目类型 */
    @Excel(name = "题目类型")
    private String type;

    /** 问答题答案 */
    @Excel(name = "问答题答案")
    private String answer;

    /** 判断题答案 */
    @Excel(name = "判断题答案")
    private Integer judgeAnswer;

    /** 单选题或者多选题答案 */
    @Excel(name = "单选题或者多选题答案")
    private String selectAnswer;

    /** 试题解析 */
    @Excel(name = "试题解析")
    private String analysis;

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

    /** 是否启用 */
    @Excel(name = "是否启用")
    private Integer isEnable;

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setAnswer(String answer)
    {
        this.answer = answer;
    }

    public String getAnswer()
    {
        return answer;
    }
    public void setJudgeAnswer(Integer judgeAnswer)
    {
        this.judgeAnswer = judgeAnswer;
    }

    public Integer getJudgeAnswer()
    {
        return judgeAnswer;
    }
    public void setSelectAnswer(String selectAnswer)
    {
        this.selectAnswer = selectAnswer;
    }

    public String getSelectAnswer()
    {
        return selectAnswer;
    }
    public void setAnalysis(String analysis)
    {
        this.analysis = analysis;
    }

    public String getAnalysis()
    {
        return analysis;
    }

    public void setIsEnable(Integer isEnable)
    {
        this.isEnable = isEnable;
    }

    public Integer getIsEnable()
    {
        return isEnable;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .append("answer", getAnswer())
            .append("judgeAnswer", getJudgeAnswer())
            .append("selectAnswer", getSelectAnswer())
            .append("analysis", getAnalysis())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("modifyUser", getModifyUser())
            .append("modifyTime", getModifyTime())
            .append("isEnable", getIsEnable())
                .append("images", getImages())
            .toString();
    }
}
