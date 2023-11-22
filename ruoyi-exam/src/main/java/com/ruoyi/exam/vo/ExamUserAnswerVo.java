package com.ruoyi.exam.vo;

import com.ruoyi.exam.domain.ExamUserAnswer;
import lombok.Data;

public class ExamUserAnswerVo extends ExamUserAnswer {

    private String task_name;

    private String paper_name;

    private String hf_name;


    @Override
    public String toString() {
        return "ExamUserAnswerVo{" +
                "task_name='" + task_name + '\'' +
                ", paper_name='" + paper_name + '\'' +
                '}';
    }

    public String getTask_name() {
        return task_name;
    }

    public void setTask_name(String task_name) {
        this.task_name = task_name;
    }

    public String getPaper_name() {
        return paper_name;
    }

    public void setPaper_name(String paper_name) {
        this.paper_name = paper_name;
    }

    public String getHf_name() {
        return hf_name;
    }

    public void setHf_name(String hf_name) {
        this.hf_name = hf_name;
    }
}
