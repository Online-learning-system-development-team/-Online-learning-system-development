package com.ruoyi.exam.dto;

import com.ruoyi.exam.domain.ExamOption;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.AssertTrue;
import java.util.List;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.dto
 * @ClassName ExamQuestionsDto
 * @Description TODO
 **/
public interface ExamQuestionsDto {

    interface Add{
        @Accessors(chain = true)
        @Data
        class Input{
            private String name;
            private List<Integer> labels;
            private List<Integer> banks;
            private String type;
            private String answer;
            private Boolean judgeAnswer;
            private String selectAnswer;
            private List<String> selectAnswers;
            private String analysis;
            private Boolean isEnable;
            private List<ExamOptionDto.Add.Input> list;
            private List<String>  newLabelList;
        }

    }

    interface AddBatch{
        @Accessors(chain = true)
        @Data
        class Input{
            private List<Add.Input> list;
        }

    }

}
