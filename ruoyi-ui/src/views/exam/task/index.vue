<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="任务名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入任务名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="试卷id" prop="examinationPaperId">
        <el-input
          v-model="queryParams.examinationPaperId"
          placeholder="请输入试卷id"
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
          v-hasPermi="['exam:task:add']"
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
<!--          v-hasPermi="['exam:task:edit']"-->
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
          v-hasPermi="['exam:task:remove']"
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
<!--          v-hasPermi="['exam:task:export']"-->
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
      :data="taskList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键id" align="center" prop="id" /> -->
      <el-table-column label="任务名称" align="center" prop="name" />
      <el-table-column
        label="任务开始时间"
        align="center"
        prop="startTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="任务结束时间"
        align="center"
        prop="endTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="试卷"
        align="center"
        prop="examinationPaperId"
      />
<!--      <el-table-column label="任务状态" align="center" prop="state" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-switch-->
<!--  v-model="scope.row.state"-->
<!--  active-color="#13ce66"-->
<!--  inactive-color="#ff4949">-->
<!--</el-switch>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="总共的可答题次数" align="center" prop="count" />
      <el-table-column
        label="操作"
        align="center"
        width="180px"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.count!==0"
            size="mini"
            type="text"
            @click="startExam(scope)"
            :style="{ display: visibleLine }"
            >开始考试</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['exam:task:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:task:remove']"
            >删除</el-button
          >
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

    <!-- 添加或修改考试任务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px">
        <el-form-item label="任务名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入任务名称" />
        </el-form-item>
        <el-form-item label="任务开始时间" prop="startTime">
          <el-date-picker
            clearable
            size="small"
            v-model="form.startTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择任务开始时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="任务结束时间" prop="endTime">
          <el-date-picker
            clearable
            size="small"
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择任务结束时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="试卷id" prop="examinationPaperId">
          <el-select
            filterable
            v-model="form.examinationPaperId"
            placeholder="请选择试卷"
          >
            <el-option
              v-for="item in paperOption"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="任务状态" prop="state">
          <el-switch
            v-model="form.state"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-text="启用"
            inactive-text="未启用"
          >
          </el-switch>
        </el-form-item>
        <el-form-item label="答题次数" prop="count">
          <el-input-number
            :min="1"
            :max="99"
            :controls="false"
            v-model="form.count"
            placeholder="请输入答题次数"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm" :loading="isSubmit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listTask,
  getTask,
  delTask,
  addTask,
  updateTask,
  exportTask,
} from "@/api/exam/task";
import {answerFrequency, listPaper} from "@/api/exam/paper";
import {getInfo} from "@/api/login";
export default {
  name: "Task",
  data() {
    return {
      //开始考试隐藏
      visibleLine:'none',
       // 防止表单重复提交
       isSubmit:false,
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
      // 考试任务表格数据
      taskList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        startTime: null,
        endTime: null,
        examinationPaperId: null,
        state: null,
        createUser: null,
        modifyUser: null,
        modifyTime: null,
        count: null,
      },
      // 表单参数
      form: { state: true },
      // 表单校验
      rules: {
        examinationPaperId: [
          { required: true, message: "试卷id不能为空", trigger: "blur" },
        ],
      },
      //
      paperOption: [],
    };
  },
  created() {
    this.isTeacher();
    this.getList();
  },
  methods: {
    //判断开始考试按钮
    isTeacher(){
      //获取用户信息
      getInfo().then((res) => {
        console.log(res.user.roles)
        res.user.roles.forEach(value => {
          if (value.roleId === 101) {
            this.visibleLine=' '
          }
        });
      });


    },

    /** 开始考试的按钮 */
    async startExam(scope){
      //获取用户信息
      const rep1=await getInfo();
      //判断考试情况
      const query={
        userId:rep1.user.userId,
        taskId:scope.row.id

      }
      const response = await answerFrequency(query);
      if (response.code!==200){
        return;
      }
      //跳转考试
      await this.$tab.openPage("开始考试", "/exam/examination/" + scope.row.examinationPaperId + "/" + scope.row.id);
    },
    /** 获取所有的试卷 */
    getPaperOption() {
      listPaper().then((res) => {
        if (res.rows.length > 0) {
          this.paperOption = res.rows.map((item) => {
            let obj = {
              label: item.name,
              value: item.id,
            };
            return obj;
          });
        }
      });
    },
    /** 查询考试任务列表 */
    getList() {
      this.loading = true;
      listTask(this.queryParams).then((response) => {
        this.taskList = response.rows;
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
        startTime: null,
        endTime: null,
        examinationPaperId: null,
        state: true,
        createUser: null,
        createTime: null,
        modifyUser: null,
        modifyTime: null,
        count: null,
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
      this.getPaperOption();
      this.open = true;
      this.title = "添加考试任务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getTask(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改考试任务";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.isSubmit = true;
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateTask(this.form).then((response) => {
              this.isSubmit = false;
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTask(this.form).then((response) => {
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
        .confirm('是否确认删除考试任务编号为"' + ids + '"的数据项？')
        .then(function () {
          return delTask(ids);
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
        .confirm("是否确认导出所有考试任务数据项？")
        .then(() => {
          this.exportLoading = true;
          return exportTask(queryParams);
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
