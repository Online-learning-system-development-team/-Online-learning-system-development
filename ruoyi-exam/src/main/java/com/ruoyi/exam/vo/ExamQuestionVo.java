package com.ruoyi.exam.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.exam.domain.ExamQuestions;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author TheRaging
 * @Package com.ruoyi.exam.vo
 * @description
 */
@Data
public class ExamQuestionVo{

    private static final long serialVersionUID = 1L;

    /** 题目的图片 */
    private String images;

    /** 主键id */
    private Long id;

    /** 题目 */
    private String name;

    /** 题目类型 */
    private String type;

    /** 问答题答案 */
    private String answer;

    /** 判断题答案 */
    private Integer judgeAnswer;

    /** 单选题或者多选题答案 */
    private String selectAnswer;

    /** 试题解析 */
    private String analysis;

    /** 创建用户 */
    private String createUser;

    /** 修改用户 */
    private String modifyUser;

    /** 修改时间 */
    private Date modifyTime;

    /** 是否启用 */
    private Integer isEnable;

    private String labels;

    private String banks;

    private List<ExamOptionVo> optionVoList;

}
