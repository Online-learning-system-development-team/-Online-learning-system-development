package com.ruoyi.exam.vo;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.util.List;

/**
 * @version V1.0
 * @Package com.ruoyi.exam.vo
 * @ClassName TaskPaper
 * @Description TODO
 **/
@Data
public class TaskPaperVo {

    /** 试卷名称 */
    private String paperName;

    /** 问答题数量 */
    private Long selectScore;

    /** 问答题数量 */
    private Long selectsScore;

    /** 问答题数量 */
    private Long judgeScore;

    /** 问答题数量 */
    private Long answerScore;

    /** 及格线 */
    private Long passingScore;

    /** 优秀线 */
    private Long goodScore;

    /** 题目数量 */
    private Long questionCount;

    /** 试卷总分 */
    private Long totalPoint;

    /** 考试时长 */
    private Integer duration;

    /** 试题集合 */
    private List<PaperQuestionVo> questionList;


}
