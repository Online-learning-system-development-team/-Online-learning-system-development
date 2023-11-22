package com.ruoyi.exam.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.domain
 * @ClassName QuestionCount
 * @Description 统计标签和题库下不同的题目类型的数量
 **/
@Data
public class QuestionCount implements Serializable {

    private static final long serialVersionUID = 1L;

    private String type;
    private Long count;

}
