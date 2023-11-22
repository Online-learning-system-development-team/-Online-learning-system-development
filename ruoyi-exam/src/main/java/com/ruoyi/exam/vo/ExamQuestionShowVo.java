package com.ruoyi.exam.vo;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * @description:
 */
@Data
public class ExamQuestionShowVo   extends BaseEntity {


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

    /** 是否启用 */
    private Integer isEnable;

    private String labels;

    private String banks;




}
