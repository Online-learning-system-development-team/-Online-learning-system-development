package com.ruoyi.exam.service.impl;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.exam.domain.ExamQuestionBankRole;
import com.ruoyi.exam.service.IExamQuestionBankRoleService;
import com.ruoyi.exam.vo.ExamBankQuestionCountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.ExamQuestionBankMapper;
import com.ruoyi.exam.domain.ExamQuestionBank;
import com.ruoyi.exam.service.IExamQuestionBankService;

/**
 * 题库Service业务层处理
 */
@Service
public class ExamQuestionBankServiceImpl implements IExamQuestionBankService
{
    @Autowired
    private ExamQuestionBankMapper examQuestionBankMapper;

    @Autowired
    private IExamQuestionBankRoleService examQuestionBankRoleService;

    /**
     * 查询题库
     *
     * @param id 题库主键
     * @return 题库
     */
    @Override
    public ExamQuestionBank selectExamQuestionBankById(Long id)
    {
        return examQuestionBankMapper.selectExamQuestionBankById(id);
    }

    /**
     * 查询题库列表
     *
     * @param examQuestionBank 题库
     * @return 题库
     */
    @Override
    public List<ExamQuestionBank> selectExamQuestionBankList(ExamQuestionBank examQuestionBank)
    {

        return examQuestionBankMapper.selectExamQuestionBankList(examQuestionBank);
    }


    /**
     * 根据当前用户查询所有的题库信息
     * @param roleId:
     * @return: java.util.List<com.ruoyi.exam.domain.ExamQuestionBank>
     * @author: TheRaging
     * @date: 2022/6/7 13:10
     * @throws:
     */
    @Override
    public List<ExamQuestionBank> selectExamQuestionBankListByRole(Long roleId){
        return examQuestionBankMapper.selectExamQuestionBankListByRole(roleId);
    }




    @Override
    public List<ExamBankQuestionCountVo> selectExamBankQuestionCountList(ExamBankQuestionCountVo examBankQuestionCountVo) {
        LoginUser user = SecurityUtils.getLoginUser();
        examBankQuestionCountVo.setUserId(user.getUserId());
        return examQuestionBankMapper.selectExamBankQuestionCountList(examBankQuestionCountVo);
    }

    @Override
    public List<ExamQuestionBank> selectBankByQuestionIdList(Long questionId) {
        return examQuestionBankMapper.selectBankByQuestionIdList(questionId);
    }

    /**
     * 新增题库
     *
     * @param examQuestionBank 题库
     * @return 结果
     */
    @Override
    public int insertExamQuestionBank(ExamQuestionBank examQuestionBank)
    {
        //用户信息
        LoginUser user = SecurityUtils.getLoginUser();
        Date time = DateUtils.getNowDate();
        examQuestionBank.setCreateTime(time);
        examQuestionBank.setCreateUser(user.getUsername());
        int count = examQuestionBankMapper.insertExamQuestionBank(examQuestionBank);
        /**
         * 添加  试题和用户关系表
         */
        ExamQuestionBankRole bankRole = new ExamQuestionBankRole();
        bankRole.setModifyTime(time);
        bankRole.setModifyUser(user.getUsername());
        bankRole.setCreateTime(time);
        bankRole.setCreateUser(user.getUsername());
        bankRole.setRoleId(user.getUserId());
        bankRole.setQuestionBankId(examQuestionBank.getId());
        count =examQuestionBankRoleService.insertExamQuestionBankRole(bankRole);
        /**
         * 添加试题题库
         */

        return count;
    }

    /**
     * 修改题库
     *
     * @param examQuestionBank 题库
     * @return 结果
     */
    @Override
    public int updateExamQuestionBank(ExamQuestionBank examQuestionBank)
    {//用户信息
        LoginUser user = SecurityUtils.getLoginUser();
        examQuestionBank.setModifyUser(user.getUsername());
        examQuestionBank.setModifyTime(DateUtils.getNowDate());
        return examQuestionBankMapper.updateExamQuestionBank(examQuestionBank);
    }

    /**
     * 批量删除题库
     *
     * @param ids 需要删除的题库主键
     * @return 结果
     */
    @Override
    public int deleteExamQuestionBankByIds(Long[] ids)
    {
        return examQuestionBankMapper.deleteExamQuestionBankByIds(ids);
    }

    /**
     * 删除题库信息
     *
     * @param id 题库主键
     * @return 结果
     */
    @Override
    public int deleteExamQuestionBankById(Long id)
    {
        return examQuestionBankMapper.deleteExamQuestionBankById(id);
    }
}
