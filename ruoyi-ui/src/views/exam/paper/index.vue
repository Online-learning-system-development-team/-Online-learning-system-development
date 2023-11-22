<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="试卷名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入试卷名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="题库ids" prop="questionBankIds">
        <el-input
          v-model="queryParams.questionBankIds"
          placeholder="请输入题库ids"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否发布" prop="isIssue">
        <el-input
          v-model="queryParams.isIssue"
          placeholder="请输入是否发布"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标签ids" prop="labelIds">
        <el-input
          v-model="queryParams.labelIds"
          placeholder="请输入标签ids"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['exam:paper:add']"
          >新增</el-button
        >
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['exam:paper:edit']"-->
<!--          >修改</el-button-->
<!--        >-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['exam:paper:remove']"
          >删除</el-button
        >
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          :loading="exportLoading"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['exam:paper:export']"-->
<!--          >导出</el-button-->
<!--        >-->
<!--      </el-col>-->
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="paperList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键id" align="center" prop="id" /> -->
      <el-table-column label="试卷名称" align="center" prop="name" />
      <el-table-column label="考试时长" align="center" prop="duration">
      </el-table-column>
      <el-table-column label="试卷总分" align="center" prop="totalPoint" />
      <el-table-column label="题库" align="center" prop="questionBankIds" />
      <el-table-column label="题目数量" align="center" prop="questionCount" />
      <el-table-column label="是否发布" align="center" prop="isIssue" />
      <el-table-column label="标签" align="center" prop="labelIds" />
      <el-table-column label="及格线" align="center" prop="passingScore" />
      <el-table-column label="优秀线" align="center" prop="goodScore" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['exam:paper:edit']"-->
<!--            class="right"-->
<!--            >修改</el-button-->
<!--          >-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleEdit(scope.row)"
            v-hasPermi="['exam:paper:remove']"
          >查看</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:paper:remove']"
          >删除</el-button
          >

<!--          <el-popover placement="top-start" width="200" trigger="hover">-->
<!--            <div style="text-align: right; margin: 0">-->
<!--           -->
<!--             -->
<!--              <el-button-->
<!--                size="mini"-->
<!--                type="text"-->
<!--                icon="el-icon-check"-->
<!--                @click="handleExam(scope.row)"-->
<!--                v-hasPermi="['exam:paper:remove']"-->
<!--                >考试</el-button-->
<!--              >-->
<!--            </div>-->
<!--            <el-button-->
<!--              size="mini"-->
<!--              type="text"-->
<!--              icon="el-icon-more"-->
<!--              slot="reference"-->
<!--              >更多</el-button-->
<!--            >-->
<!--          </el-popover>-->
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:paper:remove']"
            >删除</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:paper:remove']"
            >查看</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:paper:remove']"
            >考试</el-button
          > -->
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改试卷对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="60%"
      @close="dialogClose"
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row :gutter="40">
          <el-col :span="span">
            <el-form-item label="试卷名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入试卷名称" />
            </el-form-item>
          </el-col>
          <el-col :span="span">
            <el-form-item label="考试时长" prop="duration">
              <el-input-number
                step-strictly
                v-model="form.duration"
                :step="10"
                controls-position="right"
                :min="30"
                :max="300"
                placeholder="选择考试时长"
              />
            </el-form-item>
          </el-col>
          <el-col :span="span">
            <el-form-item label="试卷总分" prop="totalPoint">
              <el-input-number
                :controls="false"
                @input="
                  (data) => {
                    this.form.passingScore = parseInt(data * 0.6);
                    this.form.goodScore = parseInt(data * 0.8);
                  }
                "
                v-model="form.totalPoint"
                :disabled="true"
                placeholder="请输入试卷总分"
              />
            </el-form-item>
          </el-col>
          <el-col :span="span">
            <el-form-item label="题目数量" prop="questionCount">
              <el-input-number
                :disabled="true"
                :controls="false"
                v-model="form.questionCount"
                placeholder="请输入题目数量"
              />
            </el-form-item>
          </el-col>
          <span v-if="activeName == 'second'">
            <el-col :span="span">
              <el-form-item label="单选题数量" prop="score">
                <el-input-number
                  disabled
                  :controls="false"
                  v-model="form.selectCount"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="单选题分值" prop="score">
                <el-input-number
                  @input="inputDataChange"
                  :controls="false"
                  v-model="form.selectScore"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="多选题数量" prop="score">
                <el-input-number
                  disabled
                  :controls="false"
                  v-model="form.selectsCount"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="多选题分值" prop="score">
                <el-input-number
                  @input="inputDataChange"
                  :controls="false"
                  v-model="form.selectsScore"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="判断题数量" prop="score">
                <el-input-number
                  disabled
                  :controls="false"
                  v-model="form.judgeCount"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="判断题分值" prop="score">
                <el-input-number
                  @input="inputDataChange"
                  :controls="false"
                  v-model="form.judgeScore"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="问答题数量" prop="score">
                <el-input-number
                  disabled
                  :controls="false"
                  v-model="form.answerCount"
                />
              </el-form-item>
            </el-col>
            <el-col :span="span">
              <el-form-item label="问答题分值" prop="score">
                <el-input-number
                  @input="inputDataChange"
                  :controls="false"
                  v-model="form.answerScore"
                />
              </el-form-item>
            </el-col>
          </span>
          <el-col :span="span">
            <el-form-item label="及格线" prop="passingScore">
              <el-input-number
                :controls="false"
                v-model="form.passingScore"
                placeholder="请输入及格线"
              />
            </el-form-item>
          </el-col>
          <el-col :span="span">
            <el-form-item label="优秀线" prop="goodScore">
              <el-input-number
                v-model="form.goodScore"
                :controls="false"
                placeholder="请输入优秀线"
              />
            </el-form-item>
          </el-col>
          <el-col :span="span">
            <el-form-item label="是否发布" prop="isIssue">
              <el-switch
                v-model="isIssue"
                active-color="#13ce66"
                inactive-color="#ff4949"
                active-text="发布"
                inactive-text="未发布"
              >
              </el-switch>
            </el-form-item>
          </el-col>
          <!-- tab标签栏 -->
          <el-col :span="24">
            <el-tabs
              v-model="activeName"
              @tab-click="handleClick"
              type="border-card"
            >
              <el-tab-pane label="模糊配置" name="first">
                <el-row>
                  <el-col :span="24">
                    <el-form :model="vagueForm" label-width="100px">
                      <el-row>
                        <el-col :span="span">
                          <el-form-item label="标签ids" prop="label">
                            <el-select
                              clearable
                              @remove-tag="labetBankChange"
                              @change="labetBankChange"
                              v-model="vagueForm.labelIds"
                              filterable
                              multiple
                              collapse-tags
                              placeholder="请选择标签"
                            >
                              <el-option
                                v-for="item in labelOptions"
                                :key="item.id"
                                :label="item.name"
                                :value="item.id"
                              >
                              </el-option>
                            </el-select>
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="题库ids" prop="bank">
                            <el-select
                              clearable
                              @change="labetBankChange"
                              v-model="vagueForm.questionBankIds"
                              filterable
                              multiple
                              collapse-tags
                              placeholder="请选择题库"
                            >
                              <el-option
                                v-for="item in bankOptions"
                                :key="item.id"
                                :label="item.name"
                                :value="item.id"
                              >
                              </el-option>
                            </el-select>
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="单选题数量" prop="score">
                            <el-tooltip
                              class="item"
                              effect="dark"
                              :content="vagueForm.countType.selectCount + '道'"
                              placement="left-start"
                            >
                              <el-input-number
                                @input="inputDataChange"
                                :controls="false"
                                @remove-tag="labetBankChange"
                                v-model="vagueForm.selectCount"
                                placeholder="请输入单选题数量"
                              />
                            </el-tooltip>
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="单选题分值" prop="score">
                            <el-input-number
                              @input="inputDataChange"
                              :controls="false"
                              v-model="vagueForm.selectScore"
                              placeholder="请输入单选题分值"
                            />
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="多选题数量" prop="score">
                            <el-tooltip
                              class="item"
                              effect="dark"
                              :content="vagueForm.countType.selectsCount + '道'"
                              placement="left-start"
                            >
                              <el-input-number
                                @input="inputDataChange"
                                :controls="false"
                                v-model="vagueForm.selectsCount"
                                placeholder="请输入多选题数量"
                              />
                            </el-tooltip>
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="多选题分值" prop="score">
                            <el-input-number
                              @input="inputDataChange"
                              :controls="false"
                              v-model="vagueForm.selectsScore"
                              placeholder="请输入多选题分值"
                            />
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="判断题数量" prop="score">
                            <el-tooltip
                              class="item"
                              effect="dark"
                              :content="vagueForm.countType.judgeCount + '道'"
                              placement="left-start"
                            >
                              <el-input-number
                                @input="inputDataChange"
                                :controls="false"
                                v-model="vagueForm.judgeCount"
                                placeholder="请输入判断题数量"
                              />
                            </el-tooltip>
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="判断题分值" prop="score">
                            <el-input-number
                              @input="inputDataChange"
                              :controls="false"
                              v-model="vagueForm.judgeScore"
                              placeholder="请输入判断题分值"
                            />
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="问答题数量" prop="score">
                            <el-tooltip
                              class="item"
                              effect="dark"
                              :content="vagueForm.countType.answerCount + '道'"
                              placement="left-start"
                            >
                              <el-input-number
                                @input="inputDataChange"
                                :controls="false"
                                v-model="vagueForm.answerCount"
                                placeholder="请输入问答题数量"
                              />
                            </el-tooltip>
                          </el-form-item>
                        </el-col>
                        <el-col :span="span">
                          <el-form-item label="问答题分值" prop="score">
                            <el-input-number
                              @input="inputDataChange"
                              :controls="false"
                              v-model="vagueForm.answerScore"
                              placeholder="请输入问答题分值"
                            />
                          </el-form-item>
                        </el-col>
                      </el-row>
                    </el-form>
                  </el-col>
                </el-row>
              </el-tab-pane>
              <el-tab-pane label="精准配置" name="second">
                <el-row>
                  <el-col :span="24">
                    <el-button type="primary" @click="addRow"
                      >添加一行</el-button
                    >
                    <el-button @click="removeRow">删除一行</el-button>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="24">
                    <el-form :model="accurateForm">
                      <el-table
                        :fit="false"
                        :data="accurateForm.list"
                        @selection-change="
                          (data) => {
                            this.currentSelectOption = data;
                          }
                        "
                      >
                        <el-table-column
                          type="selection"
                          header-align="center"
                          width="50"
                        >
                        </el-table-column>
                        <el-table-column
                          label="题库"
                          prop="bank"
                          min-width="150px"
                        >
                          <template slot-scope="scope">
                            <el-form-item>
                              <el-select
                                clearable
                                @change="labetBankChange"
                                @remove-tag="labetBankChange"
                                v-model="scope.row.bank"
                                filterable
                                multiple
                                collapse-tags
                                placeholder="请选择题库"
                              >
                                <el-option
                                  v-for="item in bankOptions"
                                  :key="item.id"
                                  :label="item.name"
                                  :value="item.id"
                                >
                                </el-option>
                              </el-select>
                            </el-form-item>
                          </template>
                        </el-table-column>

                        <el-table-column
                          label="标签"
                          header-align="center"
                          prop="label"
                          min-width="150px"
                        >
                          <template slot-scope="scope">
                            <el-form-item>
                              <el-select
                                clearable
                                @change="labetBankChange"
                                @remove-tag="labetBankChange"
                                v-model="scope.row.label"
                                filterable
                                multiple
                                collapse-tags
                                placeholder="请选择标签"
                              >
                                <el-option
                                  v-for="item in labelOptions"
                                  :key="item.id"
                                  :label="item.name"
                                  :value="item.id"
                                >
                                </el-option>
                              </el-select>
                            </el-form-item>
                          </template>
                        </el-table-column>
                        <el-table-column
                          label="单选题数量"
                          prop="label"
                          min-width="100px"
                        >
                          <template slot-scope="scope">
                            <el-form-item prop="score">
                              <el-tooltip
                                class="item"
                                effect="dark"
                                :content="
                                  scope.row.countType.selectCount + '道'
                                "
                                placement="left-start"
                              >
                                <el-input-number
                                  @input="inputDataChange"
                                  :controls="false"
                                  v-model="scope.row.selectCount"
                                  placeholder=""
                                />
                              </el-tooltip>
                            </el-form-item>
                          </template>
                        </el-table-column>

                        <el-table-column
                          label="多选题数量"
                          prop="label"
                          min-width="100px"
                        >
                          <template slot-scope="scope">
                            <el-form-item prop="score">
                              <el-tooltip
                                class="item"
                                effect="dark"
                                :content="
                                  scope.row.countType.selectsCount + '道'
                                "
                                placement="left-start"
                              >
                                <el-input-number
                                  @input="inputDataChange"
                                  :controls="false"
                                  v-model="scope.row.selectsCount"
                                  placeholder=""
                                />
                              </el-tooltip>
                            </el-form-item>
                          </template>
                        </el-table-column>

                        <el-table-column
                          label="判断题数量"
                          prop="label"
                          min-width="100px"
                        >
                          <template slot-scope="scope">
                            <el-form-item prop="score">
                              <el-tooltip
                                class="item"
                                effect="dark"
                                :content="scope.row.countType.judgeCount + '道'"
                                placement="left-start"
                              >
                                <el-input-number
                                  @input="inputDataChange"
                                  :controls="false"
                                  v-model="scope.row.judgeCount"
                                  placeholder=""
                                />
                              </el-tooltip>
                            </el-form-item>
                          </template>
                        </el-table-column>

                        <el-table-column
                          label="问答题数量"
                          prop="label"
                          min-width="100px"
                        >
                          <template slot-scope="scope">
                            <el-form-item prop="score">
                              <el-tooltip
                                class="item"
                                effect="dark"
                                :content="
                                  scope.row.countType.answerCount + '道'
                                "
                                placement="left-start"
                              >
                                <el-input-number
                                  @input="inputDataChange"
                                  :controls="false"
                                  v-model="scope.row.answerCount"
                                  placeholder=""
                                />
                              </el-tooltip>
                            </el-form-item>
                          </template>
                        </el-table-column>
                      </el-table>
                    </el-form>
                  </el-col>
                </el-row>
              </el-tab-pane>
            </el-tabs>
          </el-col>
          <!-- 底部按钮 -->
          <el-col :span="24">
            <el-row style="margin-top: 20px">
              <el-button type="primary" @click="submitForm" :loading="isSubmit">确 定</el-button>
              <el-button @click="cancel">取 消</el-button>
            </el-row>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import {
  listPaper,
  getPaper,
  delPaper,
  addPaper,
  updatePaper,
  exportPaper,
  insertPaper,
  getCountByType,
} from "@/api/exam/paper";
import { listLabel } from "@/api/exam/label";
import { listBank, getBankSelect } from "@/api/exam/bank";
export default {
  name: "Paper",
  data() {
    return {
       // 防止表单重复提交
       isSubmit:false,
      //模糊匹配的form
      vagueForm: {
        labelIds: [],
        questionBankIds: [],
        selectCount: 0,
        countType: {
          selectsCount: 0,
          answerCount: 0,
          judgeCount: 0,
          selectCount: 0,
        },
        selectScore: 0,
        selectsCount: 0,
        selectsScore: 0,
        judgeScore: 0,
        judgeCount: 0,
        answerCount: 0,
        answerScore: 0,
      },
      //精准匹配的列表选中项
      currentSelectOption: [],
      //精准匹配的列表的唯一键
      addIndex: 0,
      //标签列表
      labelOptions: [],
      //题库列表
      bankOptions: [],
      //精准配置的form
      accurateForm: {
        list: [
          {
            countType: {
              selectsCount: 0,
              answerCount: 0,
              judgeCount: 0,
              selectCount: 0,
            },
            bank: "",
            count: "",
            score: "",
            label: "",
            $id: 0,
            selectCount: 0,
            selectsCount: 0,
            judgeCount: 0,
            answerCount: 0,
          },
        ],
      },
      //tab的默认值
      activeName: "first",
      span: 10,
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 试卷表格数据
      paperList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        duration: null,
        totalPoint: null,
        questionBankIds: null,
        questionCount: null,
        isIssue: null,
        labelIds: null,
        passingScore: null,
        goodScore: null,
      },
      // 表单参数
      form: {
        totalPoint: 0,
        duration: 0,
        name: "",
        questionCount: 0,
        isIssue: true,
        selectCount: 0,
        selectScore: 0,
        selectsCount: 0,
        selectsScore: 0,
        judgeScore: 0,
        judgeCount: 0,
        answerCount: 0,
        answerScore: 0,
      },
      isIssue: true,
      // 表单校验
      rules: {},
    };
  },
  created() {
    this.getList();
    this.getLabelList();
    this.getQuestionBankList();
  },
  methods: {
    handleExam(row){
      console.log(row)
      console.log("开始考试")
      this.$tab.openPage("开始考试", "/exam/examination/"+row.id);
    },
    //查看试题详情
    handleEdit(row){

      this.$tab.openPage("试卷详情", "/exam/paperDetail/"+row.id);
    },
    //标签和题库的变化监听事件
    labetBankChange() {
      console.log("触发了");
      if (this.activeName === "first") {
        //模糊匹配
        getCountByType({
          bank: this.vagueForm.questionBankIds,
          label: this.vagueForm.labelIds,
        }).then((res) => {
          this.vagueForm.countType = res.data;
          this.verifyCount();
        });
      } else if (this.activeName === "second") {
        //精准匹配
        this.accurateForm.list.forEach((item, index) => {
          getCountByType({
            bank: item.bank,
            label: item.label,
          }).then((res) => {
            item.countType = res.data;
            this.accurateForm.list[index] = item;
            if (index == this.accurateForm.list.length - 1) {
              this.verifyCount();
            }
          });
        });
      }
    },
    //校验数量是否足够
    verifyCount() {
      let bol = true;
      if (this.activeName == "first") {
        //一次校验
        if (
          this.vagueForm.countType != null &&
          this.vagueForm.countType != ""
        ) {
          if (this.vagueForm.countType.judgeCount < this.vagueForm.judgeCount) {
            this.$message.warning("判断题的数量不足");
            bol = false;
          } else if (
            this.vagueForm.countType.selectCount < this.vagueForm.selectCount
          ) {
            this.$message.warning("单选题的数量不足");
            bol = false;
          } else if (
            this.vagueForm.countType.selectsCount < this.vagueForm.selectsCount
          ) {
            this.$message.warning("多选题的数量不足");
            bol = false;
          } else if (
            this.vagueForm.countType.answerCount < this.vagueForm.answerCount
          ) {
            this.$message.warning("问答题的数量不足");
            bol = false;
          }
        }
      } else if (this.activeName == "second") {
        //精准配置的校验
        this.accurateForm.list.some((item) => {
          if (item.countType != null && item.countType != "") {
            let countType = item.countType;
            if (countType.judgeCount < item.judgeCount) {
              this.$message.warning("判断题的数量不足");
              bol = false;
              return true;
            } else if (countType.selectCount < item.selectCount) {
              this.$message.warning("单选题的数量不足");
              bol = false;
              return true;
            } else if (countType.selectsCount < item.selectsCount) {
              this.$message.warning("多选题的数量不足");
              bol = false;
              return true;
            } else if (countType.answerCount < item.answerCount) {
              this.$message.warning("问答题的数量不足");
              bol = false;
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        });
      }
      return bol;
    },
    //新增的弹窗关闭事件
    dialogClose() {
      //重置模糊匹配的规则
      this.vagueForm = {
        labelIds: [],
        countType: {
          selectsCount: 0,
          answerCount: 0,
          judgeCount: 0,
          selectCount: 0,
        },
        questionBankIds: [],
        selectCount: 0,
        selectScore: 0,
        selectsCount: 0,
        selectsScore: 0,
        judgeScore: 0,
        judgeCount: 0,
        answerCount: 0,
        answerScore: 0,
      };
      //重置精准匹配的规则
      this.accurateForm = {
        list: [
          {
            countType: {
              selectsCount: 0,
              answerCount: 0,
              judgeCount: 0,
              selectCount: 0,
            },
            bank: "",
            count: "",
            score: "",
            label: "",
            $id: 0,
            selectCount: 0,
            selectScore: 0,
            selectsCount: 0,
            selectsScore: 0,
            judgeScore: 0,
            judgeCount: 0,
            answerCount: 0,
            answerScore: 0,
          },
        ],
      };
      this.activeName = "first";
    },
    //分数和题目数量的监听事件
    inputDataChange() {
      let score = 0;
      let count = 0;
      let selectScore = 0;
      let selectCount = 0;
      let selectsScore = 0;
      let selectsCount = 0;
      let judgeScore = 0;
      let judgeCount = 0;
      let answerCount = 0;
      let answerScore = 0;
      this.verifyCount();
      if (this.activeName == "first") {
        //计算总分
        //计算总数量
        score =
          parseInt(this.vagueForm.selectCount) *
            parseInt(this.vagueForm.selectScore) +
          parseInt(this.vagueForm.selectsScore) *
            parseInt(this.vagueForm.selectsCount) +
          parseInt(this.vagueForm.judgeScore) *
            parseInt(this.vagueForm.judgeCount) +
          parseInt(this.vagueForm.answerCount) *
            parseInt(this.vagueForm.answerScore);
        count =
          this.vagueForm.selectCount +
          this.vagueForm.selectsCount +
          this.vagueForm.judgeCount +
          this.vagueForm.answerCount;
        this.form.questionCount = count;
        this.form.totalPoint = score;
      } else if (this.activeName == "second") {
        //计算总分
        //计算总数量
        this.accurateForm.list.forEach((item) => {
          count =
            item.selectCount +
            item.selectsCount +
            item.judgeCount +
            item.answerCount +
            count;
          //计算选择题总数量
          //计算选择题总分数
          selectScore = this.form.selectScore * item.selectCount + selectScore;
          selectsScore =
            this.form.selectsScore * item.selectsCount + selectsScore;
          judgeScore = this.form.judgeScore * item.judgeCount + judgeScore;
          answerScore = this.form.answerScore * item.answerCount + answerScore;
          selectCount = item.selectCount + selectCount;
          selectsCount = item.selectsCount + selectsCount;
          judgeCount = item.judgeCount + judgeCount;
          answerCount = item.answerCount + answerCount;
        });
        this.form.questionCount = count;
        this.form.selectCount = selectCount;
        this.form.selectsCount = selectsCount;
        this.form.judgeCount = judgeCount;
        this.form.answerCount = answerCount;
        score =
          parseInt(this.form.selectCount) * parseInt(this.form.selectScore) +
          parseInt(this.form.selectsScore) * parseInt(this.form.selectsCount) +
          parseInt(this.form.judgeScore) * parseInt(this.form.judgeCount) +
          parseInt(this.form.answerCount) * parseInt(this.form.answerScore);
        this.form.totalPoint = score;
        console.log(score);
      }
    },
    //添加一行
    addRow() {
      this.addIndex = this.addIndex + 1;
      let obj = {
        countType: {
          selectsCount: 0,
          answerCount: 0,
          judgeCount: 0,
          selectCount: 0,
        },
        bank: "",
        count: "",
        score: "",
        label: "",
        $id: this.addIndex,
        selectCount: 0,
        selectScore: 0,
        selectsCount: 0,
        selectsScore: 0,
        judgeScore: 0,
        judgeCount: 0,
        answerCount: 0,
        answerScore: 0,
      };
      this.accurateForm.list.push(obj);
    },
    //移除一行
    removeRow() {
      this.currentSelectOption.forEach((item) => {
        this.accurateForm.list.forEach((obj, index) => {
          if (obj.$id == item.$id) {
            this.accurateForm.list.splice(index, 1);
          }
        });
      });
    },
    /** 查询标签库 */
    getLabelList() {
      listLabel().then((res) => {
        this.labelOptions = res.rows;
        //console.log(res.rows)
      });
    },
    /** 查询题库列表 */
    getQuestionBankList() {
      getBankSelect().then((res) => {
        this.bankOptions = res.rows;
      });
    },
    // tab的数据监听事件
    handleClick(tab, event) {
      //console.log(tab, event);
      this.form.selectScore = 0;
      this.form.selectsScore = 0;
      this.form.answerScore = 0;
      this.form.judgeScore = 0;
    },
    /** 查询试卷列表 */
    getList() {
      this.loading = true;
      listPaper(this.queryParams).then((response) => {
        this.paperList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        duration: null,
        totalPoint: null,
        questionBankIds: null,
        questionCount: null,
        isIssue: null,
        labelIds: null,
        passingScore: null,
        goodScore: null,
        createTime: null,
        createUser: null,
        modifyTime: null,
        modifyUser: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加试卷";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getPaper(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改试卷";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.isSubmit = true;
      if (this.activeName == "first") {
        let ary = [];
        let obj = {
          bank: this.vagueForm.questionBankIds,
          label: this.vagueForm.labelIds,
          selectCount: this.vagueForm.selectCount,
          selectsCount: this.vagueForm.selectsCount,
          judgeCount: this.vagueForm.judgeCount,
          answerCount: this.vagueForm.answerCount,
        };
        this.form.selectScore = this.vagueForm.selectScore;
        this.form.selectsScore = this.vagueForm.selectsScore;
        this.form.judgeScore = this.vagueForm.judgeScore;
        this.form.answerScore = this.vagueForm.answerScore;
        ary.push(obj);
        this.form.list = ary;
      } else if (this.activeName == "second") {
        this.form.list = this.accurateForm.list;
      }
      this.form.isIssue = this.isIssue;
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updatePaper(this.form).then((response) => {
              this.isSubmit = false;
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            insertPaper(this.form).then((response) => {
              this.isSubmit = false;
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除试卷编号为"' + ids + '"的数据项？')
        .then(function () {
          return delPaper(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal
        .confirm("是否确认导出所有试卷数据项？")
        .then(() => {
          this.exportLoading = true;
          return exportPaper(queryParams);
        })
        .then((response) => {
          this.$download.name(response.msg);
          this.exportLoading = false;
        })
        .catch(() => {});
    },
  },
};
</script>
<style>
tbody .el-input-number input {
  width: 60px;
}
.right{
  margin-right: 10px;
}
</style>
