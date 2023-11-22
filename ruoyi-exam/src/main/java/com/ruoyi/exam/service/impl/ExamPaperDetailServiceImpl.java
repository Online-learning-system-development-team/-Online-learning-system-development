package com.ruoyi.exam.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.exam.dto.ExamPaperDetailDto;
import com.ruoyi.exam.dto.ExamPaperDto;
import com.ruoyi.exam.service.IExamPaperQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamPaperDetailMapper;
import com.ruoyi.exam.domain.ExamPaperDetail;
import com.ruoyi.exam.service.IExamPaperDetailService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 【请填写功能名称】Service业务层处理
 */
@Service
public class ExamPaperDetailServiceImpl implements IExamPaperDetailService
{
    @Autowired
    private ExamPaperDetailMapper examPaperDetailMapper;

    @Autowired
    private IExamPaperQuestionsService examPaperQuestionsService;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public ExamPaperDetail selectExamPaperDetailById(Long id)
    {
        return examPaperDetailMapper.selectExamPaperDetailById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param examPaperDetail 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamPaperDetail> selectExamPaperDetailList(ExamPaperDetail examPaperDetail)
    {
        return examPaperDetailMapper.selectExamPaperDetailList(examPaperDetail);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param examPaperDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamPaperDetail(ExamPaperDetail examPaperDetail)
    {
        return examPaperDetailMapper.insertExamPaperDetail(examPaperDetail);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addExamPaperDetail(ExamPaperDto.Add.Input examPaper) {
        List<ExamPaperDetailDto.Add.Input> examPaperDetailList = examPaper.getList();
        List<ExamPaperDetail> list =new ArrayList<>();
        for(ExamPaperDetailDto.Add.Input item : examPaperDetailList){
            ExamPaperDetail entity = new ExamPaperDetail(item.getPaperId(),
                    StringUtils.join(item.getBank(),","),
                    StringUtils.join(item.getLabel(),","),
                    item.getSelectCount(),item.getSelectsCount(),
                    item.getJudgeCount(),item.getAnswerCount());
            entity.setCreateUser(examPaper.getCreateUser());
            entity.setCreateTime(new Date());
            entity.setPaperId(examPaper.getId());
            list.add(entity);
        }
        System.out.println(list.toString());
        int count = examPaperDetailMapper.insertBatchExamPaperDetail(list);
        return count;
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param examPaperDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamPaperDetail(ExamPaperDetail examPaperDetail)
    {
        return examPaperDetailMapper.updateExamPaperDetail(examPaperDetail);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteExamPaperDetailByIds(Long[] ids)
    {
        return examPaperDetailMapper.deleteExamPaperDetailByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteExamPaperDetailById(Long id)
    {
        return examPaperDetailMapper.deleteExamPaperDetailById(id);
    }
}
