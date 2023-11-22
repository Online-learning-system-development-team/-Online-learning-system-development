package com.ruoyi.exam.controller;

import java.util.List;

import com.ruoyi.exam.domain.ExamQuestionBank;
import com.ruoyi.exam.vo.ExamBankQuestionCountVo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.exam.domain.ExamLabel;
import com.ruoyi.exam.service.IExamLabelService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 标签Controller
 */
@RestController
@RequestMapping("/exam/label")
public class ExamLabelController extends BaseController
{
    @Autowired
    private IExamLabelService examLabelService;

    /**
     * 查询标签列表
     */
    @PreAuthorize("@ss.hasPermi('exam:label:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamBankQuestionCountVo examLabel)
    {
        startPage();
        //List<ExamLabel> list = examLabelService.selectExamLabelList(examLabel);
        List<ExamBankQuestionCountVo> list = examLabelService.selectExamLabelQuestionCount(examLabel);
        return getDataTable(list);
    }

    /**
     * 查询题库列表
     */
    @PreAuthorize("@ss.hasPermi('exam:bank:list')")
    @GetMapping("/listByQuestionId/{questionId}")
    public TableDataInfo list(@PathVariable("questionId") Long questionId)
    {
        startPage();
        List<ExamLabel> list = examLabelService.selectExamLabelByQuestionIdList(questionId);
        return getDataTable(list);
    }


    /**
     * 导出标签列表
     */
    @PreAuthorize("@ss.hasPermi('exam:label:export')")
    @Log(title = "标签", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamLabel examLabel)
    {
        List<ExamLabel> list = examLabelService.selectExamLabelList(examLabel);
        ExcelUtil<ExamLabel> util = new ExcelUtil<ExamLabel>(ExamLabel.class);
        return util.exportExcel(list, "标签数据");
    }

    /**
     * 获取标签详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:label:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examLabelService.selectExamLabelById(id));
    }

    /**
     * 新增标签
     */
    @PreAuthorize("@ss.hasPermi('exam:label:add')")
    @Log(title = "标签", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamLabel examLabel)
    {
        return toAjax(examLabelService.insertExamLabel(examLabel));
    }

    /**
     * 修改标签
     */
    @PreAuthorize("@ss.hasPermi('exam:label:edit')")
    @Log(title = "标签", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamLabel examLabel)
    {
        return toAjax(examLabelService.updateExamLabel(examLabel));
    }

    /**
     * 删除标签
     */
    @PreAuthorize("@ss.hasPermi('exam:label:remove')")
    @Log(title = "标签", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examLabelService.deleteExamLabelByIds(ids));
    }
}
