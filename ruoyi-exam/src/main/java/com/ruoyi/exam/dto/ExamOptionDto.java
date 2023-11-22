package com.ruoyi.exam.dto;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.dto
 * @ClassName ExamOptionsDto
 * @Description TODO
 **/
public interface ExamOptionDto {

    interface Add{
        @Accessors(chain = true)
        @Data
        class Input{
            private String name;
            private String option;
        }
    }

}
