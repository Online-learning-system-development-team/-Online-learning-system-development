package com.ruoyi.exam.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * @author TheRaging
 * @Package com.ruoyi.exam.vo
 * @description
 */
@Data
public class ExamOptionVo {

    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 题目表的Id */
    private Long optionId;

    /** 选项内容 */
    private String optionContent;

    /** 创建用户 */
    private String createUser;

    /** 修改用户 */
    private String modifyUser;

    /** 修改时间 */
    private Date modifyTime;

}
