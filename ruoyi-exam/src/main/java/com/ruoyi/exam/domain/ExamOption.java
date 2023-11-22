package com.ruoyi.exam.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 试题选项对象 exam_option
 */
public class ExamOption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 题目表的Id */
    @Excel(name = "题目表的Id")
    private Long optionId;

    /** 选项内容 */
    @Excel(name = "选项内容")
    private String optionContent;

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
    public void setOptionId(Long optionId)
    {
        this.optionId = optionId;
    }

    public Long getOptionId()
    {
        return optionId;
    }
    public void setOptionContent(String optionContent)
    {
        this.optionContent = optionContent;
    }

    public String getOptionContent()
    {
        return optionContent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("optionId", getOptionId())
            .append("optionContent", getOptionContent())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("modifyUser", getModifyUser())
            .append("modifyTime", getModifyTime())
            .toString();
    }
}
