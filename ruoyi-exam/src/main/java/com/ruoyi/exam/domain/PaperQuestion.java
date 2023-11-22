package com.ruoyi.exam.domain;

import lombok.Data;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.domain
 * @ClassName PaperQuestion
 * @Description  查询试卷题目使用的实体类
 **/
@Data
public class PaperQuestion {

    private Long id;
    private Long paperId;
    private Long questionsId;
    private String title;
    private String images;
    private String questionsType;
    private Long score;
    private String analysis;
    private String answer;
    private String judgeAnswer;
    private String selectAnswer;

}
