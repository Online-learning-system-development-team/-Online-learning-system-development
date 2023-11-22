package com.ruoyi.exam.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.exam.domain.ExamPaperDetail;
import com.ruoyi.exam.domain.ExamQuestions;
import com.ruoyi.exam.domain.QuestionCount;
import com.ruoyi.exam.dto.ExamPaperDetailDto;
import com.ruoyi.exam.dto.ExamQuestionsDto;
import com.ruoyi.exam.vo.ExamQuestionShowVo;
import com.ruoyi.exam.vo.ExamQuestionVo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 试题Service接口
 */
public interface IExamQuestionsService
{

    /**
     * 查询试题
     *
     * @param id 试题主键
     * @return 试题
     */
    public ExamQuestions selectExamQuestionsById(Long id);

    /**
     * 查询试题 根据题库和标签 查询不同的题目类型的题目数量
     *
     * @param paperDetail 生成试卷的详情数据
     * @return 不同的题目类型的试题数量
     */
    public ExamPaperDetail selectExamQuestionCountByType(ExamPaperDetailDto.SelectQuestionTypeCount.Input paperDetail);

    /**
     * 查询试题 根据题目类型 题目数量 题库 标签
     *
     * @param examPaperDetail 试题主键
     * @return 试题
     */
    public List<ExamQuestions> selectExamQuestionByLabelsBanks(ExamPaperDetail examPaperDetail);

    /**
     * 根据试题 查询试题的详情，附带的试题的选项信息
     * @param examPaperDetail 试题
     * @return 试题集合
     * @author: TheRaging
     * @date: 2022/1/11
     */
    public TableDataInfo selectExamQuestionAndOptionsByLabelsBanks(ExamQuestions examPaperDetail);

    /**
     * 查询试题列表
     *
     * @param examQuestions 试题
     * @return 试题集合
     */
    public List<ExamQuestions> selectExamQuestionsList(ExamQuestions examQuestions);

    /**
     * 新增试题
     *
     * @param examQuestions 试题
     * @return 结果
     */
    public int insertExamQuestions(ExamQuestions examQuestions);
    /**
     * 新增试题
     *
     * @param examQuestions 试题
     * @return 结果
     */
    public int addExamQuestions(ExamQuestionsDto.Add.Input examQuestions);

    /**
     * 上传文件 批量导入试题
     *
     * @param file 试题
     * @return 结果
     * @throws IOException
     */
    public Map uploadExamQuestions(MultipartFile file) throws IOException;


    /**
     * 修改试题
     *
     * @param examQuestions 试题
     * @return 结果
     */
    public int updateExamQuestions(ExamQuestions examQuestions);

    /**
     * 批量删除试题
     *
     * @param ids 需要删除的试题主键集合
     * @return 结果
     */
    public int deleteExamQuestionsByIds(Long[] ids);

    /**
     * 删除试题信息
     *
     * @param id 试题主键
     * @return 结果
     */
    public int deleteExamQuestionsById(Long id);
}
