package com.ruoyi.exam.mapper;

import java.util.List;
import com.ruoyi.exam.domain.ExamQuestionBank;
import com.ruoyi.exam.vo.ExamBankQuestionCountVo;
import org.apache.ibatis.annotations.Param;

/**
 * 题库Mapper接口
 */
public interface ExamQuestionBankMapper
{

    /***
     *
     *   根据  这个题目ID查询 关联的题目的信息
     * @param questionId:
     * @return: java.util.List<com.ruoyi.exam.domain.ExamQuestionBank>
     * @author: TheRaging
     * @date: 2022/4/5 16:11
     * @throws:
     */
    public List<ExamQuestionBank> selectBankByQuestionIdList(Long questionId);


    /**
     * 查询题库
     *
     * @param id 题库主键
     * @return 题库
     */
    public ExamQuestionBank selectExamQuestionBankById(Long id);

    public List<ExamBankQuestionCountVo> selectExamBankQuestionCountList(ExamBankQuestionCountVo examBankQuestionCountVo);

    /**
     * 查询题库列表
     *
     * @param examQuestionBank 题库
     * @return 题库集合
     */
    public List<ExamQuestionBank> selectExamQuestionBankList(ExamQuestionBank examQuestionBank);


    /**
     * 查询题库列表
     *
     * @param roleId
     * @return 题库集合
     */
    public List<ExamQuestionBank> selectExamQuestionBankListByRole(@Param("roleId") Long roleId);


    /**
     * 新增题库
     *
     * @param examQuestionBank 题库
     * @return 结果
     */
    public int insertExamQuestionBank(ExamQuestionBank examQuestionBank);

    /**
     * 修改题库
     *
     * @param examQuestionBank 题库
     * @return 结果
     */
    public int updateExamQuestionBank(ExamQuestionBank examQuestionBank);

    /**
     * 删除题库
     *
     * @param id 题库主键
     * @return 结果
     */
    public int deleteExamQuestionBankById(Long id);

    /**
     * 批量删除题库
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExamQuestionBankByIds(Long[] ids);
}
