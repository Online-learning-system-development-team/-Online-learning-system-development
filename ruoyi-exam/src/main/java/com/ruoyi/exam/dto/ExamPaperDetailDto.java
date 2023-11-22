package com.ruoyi.exam.dto;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.dto
 * @ClassName ExamPaperDetailDto
 * @Description TODO
 **/
public interface ExamPaperDetailDto {

    interface Add{
        @Accessors(chain = true)
        @Data
        class Input{
            private Long[] bank;
            private Long[] label;
            private Long paperId;
            private Long selectCount;
            private Long selectsCount;
            private Long judgeCount;
            private Long answerCount;
        }
    }

    interface SelectQuestionTypeCount{
        @Accessors(chain = true)
        @Data
        class Input{
            private List<Long> bank;
            private List<Long> label;
        }
    }

}
