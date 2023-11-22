package com.ruoyi.exam.vo;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.vo
 * @ClassName ExamBankQuestionCountVo
 * @Description  题目表的接口
 **/
@Data
public class ExamBankQuestionCountVo extends BaseEntity {

    /**
     * 题库的ID 或者标签的ID
     */
    private Integer id;

    /**
     * 题库的名称 标签的名称
     */
    private String Name;

    /**
     * 单选题数量
     */
    private Integer selectCount;

    /**
     * 多选题数量
     */
    private Integer selectsCount;

    /**
     * 判断题数量
     */
    private Integer verdictCount;

    /**
     * 问答题数量
     */
    private Integer answerCount;

    private Long userId;

}
