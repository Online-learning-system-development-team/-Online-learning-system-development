package com.ruoyi.exam.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.exam.domain.ExamUserAnswer;
import com.ruoyi.exam.mapper.ExamUserAnswerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamTaskMapper;
import com.ruoyi.exam.domain.ExamTask;
import com.ruoyi.exam.service.IExamTaskService;

import javax.annotation.Resource;

import static com.ruoyi.common.utils.SecurityUtils.getUserId;

/**
 * 考试任务Service业务层处理
 */
@Service
public class ExamTaskServiceImpl implements IExamTaskService
{
    @Autowired
    private ExamTaskMapper examTaskMapper;

    @Resource
    private ExamUserAnswerMapper userAnswerMapper;

    /**
     * 查询考试任务
     *
     * @param id 考试任务主键
     * @return 考试任务
     */
    @Override
    public ExamTask selectExamTaskById(Long id)
    {
        return examTaskMapper.selectExamTaskById(id);
    }

    /**
     * 查询考试任务列表
     *
     * @param examTask 考试任务
     * @return 考试任务
     */
    @Override
    public List<ExamTask> selectExamTaskList(ExamTask examTask)
    {
        ExamUserAnswer userAnswer = new ExamUserAnswer();
        userAnswer.setUserId(getUserId());
        List<ExamUserAnswer> examUserAnswers = userAnswerMapper.selectExamUserAnswerList(userAnswer);
        Map<Long, Long> longMap = Optional.ofNullable(examUserAnswers).orElse(Collections.emptyList())
                .stream().collect(Collectors.groupingBy(ExamUserAnswer::getTaskId))
                .entrySet().stream().collect(Collectors.toMap(Map.Entry::getKey, var -> {
                    List<ExamUserAnswer> value = var.getValue();
                    long delCount = 0L;
                    if (CollUtil.isNotEmpty(value)) {
                        delCount = value.size();
                    }
                    return delCount;
                }));

        List<ExamTask> examTasks = examTaskMapper.selectExamTaskList(examTask);
        if (CollUtil.isEmpty(examTasks)){
            return examTasks;
        }
        return examTasks.stream().peek(var->{
            Long delCount = longMap.get(var.getId());
            if (delCount!=null){
                var.setCount(var.getCount()-delCount);
            }
        }).collect(Collectors.toList());
    }

    /**
     * 新增考试任务
     *
     * @param examTask 考试任务
     * @return 结果
     */
    @Override
    public int insertExamTask(ExamTask examTask)
    {
        examTask.setCreateTime(DateUtils.getNowDate());
        return examTaskMapper.insertExamTask(examTask);
    }

    /**
     * 修改考试任务
     *
     * @param examTask 考试任务
     * @return 结果
     */
    @Override
    public int updateExamTask(ExamTask examTask)
    {
        return examTaskMapper.updateExamTask(examTask);
    }

    /**
     * 批量删除考试任务
     *
     * @param ids 需要删除的考试任务主键
     * @return 结果
     */
    @Override
    public int deleteExamTaskByIds(Long[] ids) throws Exception {

        /**
         * 删除前 先校验是否 有被 用户答题引用
         */
        List<ExamUserAnswer> list = userAnswerMapper.selectListByTaskIdOrPaperId(ids,null);

        if(StringUtils.isNotNull(list)&&list.size()>0){
            throw new Exception("任务有被用户答题引用，不允许删除！");
        }

        return examTaskMapper.deleteExamTaskByIds(ids);
    }

    /**
     * 删除考试任务信息
     *
     * @param id 考试任务主键
     * @return 结果
     */
    @Override
    public int deleteExamTaskById(Long id) throws Exception {

        /**
         * 删除前 先校验是否 有被 用户答题引用
         */
        Long []ids = new Long[1];
        ids[0]  = id;
        List<ExamUserAnswer> list = userAnswerMapper.selectListByTaskIdOrPaperId(ids,null);

        if(StringUtils.isNotNull(list)&&list.size()>0){
            throw new Exception("任务有被用户答题引用，不允许删除！");
        }
        return examTaskMapper.deleteExamTaskById(id);
    }
}
