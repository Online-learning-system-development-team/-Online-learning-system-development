package com.ruoyi.exam.controller;

import java.util.List;
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
import com.ruoyi.exam.domain.ExamOption;
import com.ruoyi.exam.service.IExamOptionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 试题选项Controller
 */
@RestController
@RequestMapping("/exam/option")
public class ExamOptionController extends BaseController
{
    @Autowired
    private IExamOptionService examOptionService;

    /**
     * 查询试题选项列表
     */
    @PreAuthorize("@ss.hasPermi('exam:option:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamOption examOption)
    {
        startPage();
        List<ExamOption> list = examOptionService.selectExamOptionList(examOption);
        return getDataTable(list);
    }

    /**
     * 导出试题选项列表
     */
    @PreAuthorize("@ss.hasPermi('exam:option:export')")
    @Log(title = "试题选项", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamOption examOption)
    {
        List<ExamOption> list = examOptionService.selectExamOptionList(examOption);
        ExcelUtil<ExamOption> util = new ExcelUtil<ExamOption>(ExamOption.class);
        return util.exportExcel(list, "试题选项数据");
    }

    /**
     * 获取试题选项详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:option:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examOptionService.selectExamOptionById(id));
    }

    /**
     * 新增试题选项
     */
    @PreAuthorize("@ss.hasPermi('exam:option:add')")
    @Log(title = "试题选项", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamOption examOption)
    {
        return toAjax(examOptionService.insertExamOption(examOption));
    }

    /**
     * 修改试题选项
     */
    @PreAuthorize("@ss.hasPermi('exam:option:edit')")
    @Log(title = "试题选项", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamOption examOption)
    {
        return toAjax(examOptionService.updateExamOption(examOption));
    }

    /**
     * 删除试题选项
     */
    @PreAuthorize("@ss.hasPermi('exam:option:remove')")
    @Log(title = "试题选项", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examOptionService.deleteExamOptionByIds(ids));
    }
}
