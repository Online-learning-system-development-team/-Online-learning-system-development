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
import com.ruoyi.exam.domain.ExamTask;
import com.ruoyi.exam.service.IExamTaskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 考试任务Controller
 */
@RestController
@RequestMapping("/exam/task")
public class ExamTaskController extends BaseController
{
    @Autowired
    private IExamTaskService examTaskService;

    /**
     * 查询考试任务列表
     */
    @PreAuthorize("@ss.hasPermi('exam:task:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamTask examTask)
    {
        startPage();
        List<ExamTask> list = examTaskService.selectExamTaskList(examTask);
        return getDataTable(list);
    }


    /**
     * 获取考试任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:task:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examTaskService.selectExamTaskById(id));
    }

    /**
     * 新增考试任务
     */
    @PreAuthorize("@ss.hasPermi('exam:task:add')")
    @Log(title = "考试任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamTask examTask)
    {
        return toAjax(examTaskService.insertExamTask(examTask));
    }

    /**
     * 修改考试任务
     */
    @PreAuthorize("@ss.hasPermi('exam:task:edit')")
    @Log(title = "考试任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamTask examTask)
    {
        return toAjax(examTaskService.updateExamTask(examTask));
    }

    /**
     * 删除考试任务
     */
    @PreAuthorize("@ss.hasPermi('exam:task:remove')")
    @Log(title = "考试任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) throws Exception {
        return toAjax(examTaskService.deleteExamTaskByIds(ids));
    }
}
