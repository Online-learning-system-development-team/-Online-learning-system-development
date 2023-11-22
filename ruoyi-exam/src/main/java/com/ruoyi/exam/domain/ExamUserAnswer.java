package com.ruoyi.exam.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户答题对象 exam_user_answer
 */
public class ExamUserAnswer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 试卷id */
    @Excel(name = "试卷id")
    private Long examinationPaperId;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 答题用户的id */
    @Excel(name = "答题用户的id")
    private Long userId;

    /** 总得分 */
    @Excel(name = "总得分")
    private Long totalPoints;

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

    /** 任务id */
    @Excel(name = "任务id")
    private Long taskId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setExaminationPaperId(Long examinationPaperId)
    {
        this.examinationPaperId = examinationPaperId;
    }

    public Long getExaminationPaperId()
    {
        return examinationPaperId;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setTotalPoints(Long totalPoints)
    {
        this.totalPoints = totalPoints;
    }

    public Long getTotalPoints()
    {
        return totalPoints;
    }

    public void setTaskId(Long taskId)
    {
        this.taskId = taskId;
    }

    public Long getTaskId()
    {
        return taskId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("examinationPaperId", getExaminationPaperId())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("userId", getUserId())
            .append("totalPoints", getTotalPoints())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("modifyUser", getModifyUser())
            .append("modifyTime", getModifyTime())
            .append("taskId", getTaskId())
            .toString();
    }
}
