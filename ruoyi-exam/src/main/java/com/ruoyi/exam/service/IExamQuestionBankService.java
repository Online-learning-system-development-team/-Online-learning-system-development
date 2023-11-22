package com.ruoyi.exam.service;

import java.util.List;
import com.ruoyi.exam.domain.ExamQuestionBank;
import com.ruoyi.exam.vo.ExamBankQuestionCountVo;

/**
 * 题库Service接口
 */
public interface IExamQuestionBankService
{
    /**
     * 查询题库
     *
     * @param id 题库主键
     * @return 题库
     */
    public ExamQuestionBank selectExamQuestionBankById(Long id);

    /**
     * 查询题库列表
     *
     * @param examQuestionBank 题库
     * @return 题库集合
     */
    public List<ExamQuestionBank> selectExamQuestionBankList(ExamQuestionBank examQuestionBank);

    /***
     *
     *
     * @param examBankQuestionCountVo:
     * @return: java.util.List<com.ruoyi.exam.vo.ExamBankQuestionCountVo>
     * @author: TheRaging
     * @date: 2022/4/5 16:00
     * @throws:
     */
    public List<ExamBankQuestionCountVo> selectExamBankQuestionCountList(ExamBankQuestionCountVo examBankQuestionCountVo);



    List<ExamQuestionBank> selectExamQuestionBankListByRole(Long roleId);

    /***
     *
     *  根据题目ID查询关联的题库
     * @param questionId:
     * @return: java.util.List<com.ruoyi.exam.domain.ExamQuestionBank>
     * @author: TheRaging
     * @date: 2022/4/5 16:00
     * @throws:
     */
    public List<ExamQuestionBank> selectBankByQuestionIdList(Long questionId);


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
     * 批量删除题库
     *
     * @param ids 需要删除的题库主键集合
     * @return 结果
     */
    public int deleteExamQuestionBankByIds(Long[] ids);

    /**
     * 删除题库信息
     *
     * @param id 题库主键
     * @return 结果
     */
    public int deleteExamQuestionBankById(Long id);
}
