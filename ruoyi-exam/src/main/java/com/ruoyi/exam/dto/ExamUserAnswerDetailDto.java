package com.ruoyi.exam.dto;

import com.sun.org.apache.xpath.internal.operations.Bool;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @description:
 */
public interface ExamUserAnswerDetailDto {

    interface Add{
        @Accessors(chain = true)
        @Data
        class Input{
            private Integer examinationPaperQuestionsId;
            private String questionsType;
            private String userAnswer;
            private String questionsAnswer;
            private Boolean isCorrect;
        }
    }

}
