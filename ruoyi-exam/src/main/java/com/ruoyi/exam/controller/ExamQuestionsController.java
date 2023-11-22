package com.ruoyi.exam.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.ruoyi.exam.domain.ExamPaperDetail;
import com.ruoyi.exam.dto.ExamPaperDetailDto;
import com.ruoyi.exam.dto.ExamQuestionsDto;
import com.ruoyi.exam.vo.ExamQuestionShowVo;
import com.ruoyi.exam.vo.ExamQuestionVo;
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
import com.ruoyi.exam.domain.ExamQuestions;
import com.ruoyi.exam.service.IExamQuestionsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 试题Controller
 */
@RestController
@RequestMapping("/exam/questions")
public class ExamQuestionsController extends BaseController
{
    @Autowired
    private IExamQuestionsService examQuestionsService;


    /**
     * 查询试题列表
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamQuestions examQuestions)
    {
        startPage();
        List<ExamQuestions> list = examQuestionsService.selectExamQuestionsList(examQuestions);
        return getDataTable(list);
    }







    /**
     * 查询试题列表
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:list')")
    @GetMapping("/listAndOptions")
    public TableDataInfo listAndOptions(ExamQuestions examQuestions)
    {
        startPage();
        return examQuestionsService.selectExamQuestionAndOptionsByLabelsBanks(examQuestions);
    }

    /**
     * 查询试题列表
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:list')")
    @PostMapping("/getCountByType")
    public AjaxResult getCountByType(@RequestBody ExamPaperDetailDto.SelectQuestionTypeCount.Input paperDetail)
    {
        ExamPaperDetail detail = examQuestionsService.selectExamQuestionCountByType(paperDetail);
        return AjaxResult.success(detail);
    }

    /**
     * 导出试题列表
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:export')")
    @Log(title = "试题", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamQuestions examQuestions)
    {
        List<ExamQuestions> list = examQuestionsService.selectExamQuestionsList(examQuestions);
        ExcelUtil<ExamQuestions> util = new ExcelUtil<ExamQuestions>(ExamQuestions.class);
        return util.exportExcel(list, "试题数据");
    }

    /**
     * 获取试题详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examQuestionsService.selectExamQuestionsById(id));
    }

    /**
     * 新增试题
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:add')")
    @Log(title = "试题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamQuestions examQuestions)
    {
        return toAjax(examQuestionsService.insertExamQuestions(examQuestions));
    }

    /***
     * @Summary
     * @Param:
     * @Return:
     * @Author: TheRaging
     * @Date: 2021/12/7 0:08
     * @Description 新增试题
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:add')")
    @Log(title = "试题", businessType = BusinessType.INSERT)
    @PostMapping(value = "/insert")
    public AjaxResult insertBatch(@RequestBody ExamQuestionsDto.Add.Input examQuestions)
    {
        return toAjax(examQuestionsService.addExamQuestions(examQuestions));
    }

    /***
     * @Summary
     * @Param:
     * @Return:
     * @Author: TheRaging
     * @Date: 2021/12/7 0:08
     * @Description 批量新增试题
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:add')")
    @Log(title = "试题", businessType = BusinessType.INSERT)
    @PostMapping(value = "/insertBatch")
    public AjaxResult insert(@RequestBody ExamQuestionsDto.AddBatch.Input examQuestions)
    {
        examQuestions.getList().stream().forEach(item->{
            examQuestionsService.addExamQuestions(item);
        });
        return toAjax(1);
    }


    @Log(title = "试题批量导入", businessType = BusinessType.INSERT)
    @PostMapping(value = "/upload")
    public AjaxResult upload(MultipartFile file) throws IOException {
        return AjaxResult.success(examQuestionsService.uploadExamQuestions(file));
    }


    /**
     * 修改试题
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:edit')")
    @Log(title = "试题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamQuestions examQuestions)
    {
        return toAjax(examQuestionsService.updateExamQuestions(examQuestions));
    }

    /**
     * 删除试题
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:remove')")
    @Log(title = "试题", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examQuestionsService.deleteExamQuestionsByIds(ids));
    }

    /**
     * 删除试题
     */
    @PreAuthorize("@ss.hasPermi('exam:questions:remove')")
    @Log(title = "试题", businessType = BusinessType.DELETE)
    @DeleteMapping("/byId/{id}")
    public AjaxResult removebyId(@PathVariable Long id)
    {
        return toAjax(examQuestionsService.deleteExamQuestionsById(id));
    }

}
