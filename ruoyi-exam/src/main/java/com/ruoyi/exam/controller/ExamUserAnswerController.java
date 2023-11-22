package com.ruoyi.exam.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.exam.domain.ExamUserAnswer;
import com.ruoyi.exam.dto.ExamUserAnswerDto;
import com.ruoyi.exam.service.IExamUserAnswerService;
import com.ruoyi.exam.vo.ExamUserAnswerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户历史答题功能
 */
@RestController
@RequestMapping("/exam/userAnswer")
public class ExamUserAnswerController extends BaseController {

    @Autowired
    private IExamUserAnswerService userAnswerService;

    @PostMapping("/addUserAnswer")
    public AjaxResult addPaperQuestion(@RequestBody ExamUserAnswerDto.Add.Input paperQuestionsDto)
    {
        System.out.println( paperQuestionsDto.toString());
        paperQuestionsDto.setUserId(getUserId());
        paperQuestionsDto.setCreateUser(getUsername());
        return AjaxResult.success(userAnswerService.insertExamUserAnswer(paperQuestionsDto));
    }


    /**
     * 查询用户历史答题列表
     */
    @PostMapping("/getUserAnswer")
    public AjaxResult getUserAnswer(@RequestBody Long id)
    {
        return AjaxResult.success(userAnswerService.selectExamUserAnswerByPaperIdList(id));
    }

    /**
     * 查询用户答题列表
     */
    @PreAuthorize("@ss.hasPermi('exam:answer:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamUserAnswer examUserAnswer)
    {
        startPage();
        List<ExamUserAnswerVo> list = userAnswerService.selectExamUserAnswerList(examUserAnswer);
        return getDataTable(list);
    }


    /**
     * 获取用户答题详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:answer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(userAnswerService.selectExamUserAnswerById(id));
    }

    /**
     * 新增用户答题
     */
    @PreAuthorize("@ss.hasPermi('exam:answer:add')")
    @Log(title = "用户答题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamUserAnswer examUserAnswer)
    {
        return toAjax(userAnswerService.insertExamUserAnswer(examUserAnswer));
    }

    /**
     * 修改用户答题
     */
    @PreAuthorize("@ss.hasPermi('exam:answer:edit')")
    @Log(title = "用户答题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamUserAnswer examUserAnswer)
    {
        return toAjax(userAnswerService.updateExamUserAnswer(examUserAnswer));
    }

    /**
     * 删除用户答题
     */
    @PreAuthorize("@ss.hasPermi('exam:answer:remove')")
    @Log(title = "用户答题", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userAnswerService.deleteExamUserAnswerByIds(ids));
    }

}
