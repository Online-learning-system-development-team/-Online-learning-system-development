package com.ruoyi.exam.controller;

import java.util.List;

import com.ruoyi.exam.dto.ExamPaperDto;
import com.ruoyi.exam.dto.ExamUserAnswerDto;
import com.ruoyi.exam.service.IExamPaperQuestionsService;
import com.ruoyi.exam.service.IExamUserAnswerService;
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
import com.ruoyi.exam.domain.ExamPaper;
import com.ruoyi.exam.service.IExamPaperService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 试卷Controller
 */
@RestController
@RequestMapping("/exam/paper")
public class ExamPaperController extends BaseController
{
    @Autowired
    private IExamPaperService examPaperService;

    @Autowired
    private IExamPaperQuestionsService paperQuestionsService;

    @Autowired
    private IExamUserAnswerService iExamUserAnswerService;

    /**
     * 查询试卷列表
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamPaper examPaper)
    {
        startPage();
        List<ExamPaper> list = examPaperService.selectExamPaperList(examPaper);
        return getDataTable(list);
    }

    /**
     * 查询试卷 开始考试的试卷
     */
    @GetMapping("/paperQuestionList")
    public AjaxResult selectPaperQuestionByPaperList(Long paperId)
    {
        startPage();
        return AjaxResult.success(paperQuestionsService.selectPaperQuestionByPaperList(paperId));
    }


    /**
     * 判断查询次数
     * @param userId
     * @param taskId
     * @return
     */
    @GetMapping("/answerFrequency")
    public AjaxResult answerFrequency(Long userId,Long taskId){
        if (!iExamUserAnswerService.answerFrequency(userId,taskId)) {
            return AjaxResult.error("已完成答题，无需重复答题");
        }
        return AjaxResult.success();
    }



    /**
     * 导出试卷列表
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:export')")
    @Log(title = "试卷", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamPaper examPaper)
    {
        List<ExamPaper> list = examPaperService.selectExamPaperList(examPaper);
        ExcelUtil<ExamPaper> util = new ExcelUtil<ExamPaper>(ExamPaper.class);
        return util.exportExcel(list, "试卷数据");
    }

    /**
     * 获取试卷详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examPaperService.selectExamPaperById(id));
    }

    /**
     * 新增试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:add')")
    @Log(title = "试卷", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamPaper examPaper)
    {
        return toAjax(examPaperService.insertExamPaper(examPaper));
    }

    /**
     * 新增试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:add')")
    @Log(title = "试卷", businessType = BusinessType.INSERT)
    @PostMapping(value = "/insert")
    public AjaxResult insert(@RequestBody ExamPaperDto.Add.Input examPaper)
    {
        examPaper.setCreateUser(getUsername());
        return toAjax(examPaperService.addExamPaper(examPaper));
    }

    /**
     * 修改试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:edit')")
    @Log(title = "试卷", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamPaper examPaper)
    {
        return toAjax(examPaperService.updateExamPaper(examPaper));
    }

    /**
     * 删除试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:remove')")
    @Log(title = "试卷", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) throws Exception {
        return toAjax(examPaperService.deleteExamPaperByIds(ids));
    }
}
