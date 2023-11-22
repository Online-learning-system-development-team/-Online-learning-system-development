package com.ruoyi.exam.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamUserAnswerDetailsMapper;
import com.ruoyi.exam.domain.ExamUserAnswerDetails;
import com.ruoyi.exam.service.IExamUserAnswerDetailsService;

/**
 * 答题明细Service业务层处理
 */
@Service
public class ExamUserAnswerDetailsServiceImpl implements IExamUserAnswerDetailsService
{
    @Autowired
    private ExamUserAnswerDetailsMapper examUserAnswerDetailsMapper;

    /**
     * 查询答题明细
     *
     * @param id 答题明细主键
     * @return 答题明细
     */
    @Override
    public ExamUserAnswerDetails selectExamUserAnswerDetailsById(Long id)
    {
        return examUserAnswerDetailsMapper.selectExamUserAnswerDetailsById(id);
    }

    /**
     * 查询答题明细列表
     *
     * @param examUserAnswerDetails 答题明细
     * @return 答题明细
     */
    @Override
    public List<ExamUserAnswerDetails> selectExamUserAnswerDetailsList(ExamUserAnswerDetails examUserAnswerDetails)
    {
        return examUserAnswerDetailsMapper.selectExamUserAnswerDetailsList(examUserAnswerDetails);
    }

    /**
     * 新增答题明细
     *
     * @param examUserAnswerDetails 答题明细
     * @return 结果
     */
    @Override
    public int insertExamUserAnswerDetails(ExamUserAnswerDetails examUserAnswerDetails)
    {
        examUserAnswerDetails.setCreateTime(DateUtils.getNowDate());
        return examUserAnswerDetailsMapper.insertExamUserAnswerDetails(examUserAnswerDetails);
    }

    /**
     * 修改答题明细
     *
     * @param examUserAnswerDetails 答题明细
     * @return 结果
     */
    @Override
    public int updateExamUserAnswerDetails(ExamUserAnswerDetails examUserAnswerDetails)
    {
        return examUserAnswerDetailsMapper.updateExamUserAnswerDetails(examUserAnswerDetails);
    }

    /**
     * 批量删除答题明细
     *
     * @param ids 需要删除的答题明细主键
     * @return 结果
     */
    @Override
    public int deleteExamUserAnswerDetailsByIds(Long[] ids)
    {
        return examUserAnswerDetailsMapper.deleteExamUserAnswerDetailsByIds(ids);
    }

    /**
     * 删除答题明细信息
     *
     * @param id 答题明细主键
     * @return 结果
     */
    @Override
    public int deleteExamUserAnswerDetailsById(Long id)
    {
        return examUserAnswerDetailsMapper.deleteExamUserAnswerDetailsById(id);
    }
}
