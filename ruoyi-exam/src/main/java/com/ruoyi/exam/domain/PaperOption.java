package com.ruoyi.exam.domain;

import lombok.Data;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.domain
 * @ClassName PaperOption
 * @Description 查询的试卷的题目的选项类
 **/
@Data
public class PaperOption {

    private Long questionsId;
    private Long optionId;
    private String serialNumber;
    private String optionContent;

}
