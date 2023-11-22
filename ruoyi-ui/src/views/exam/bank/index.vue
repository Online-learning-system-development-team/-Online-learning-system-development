<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="题库名字" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入题库名字"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
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
          v-hasPermi="['exam:bank:add']"
        >新增</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['exam:bank:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['exam:bank:remove']"
        >删除</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          :loading="exportLoading"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['exam:bank:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-upload2"-->
<!--          size="mini"-->
<!--          :loading="exportLoading"-->
<!--          @click="uploadOpen = true"-->
<!--          >导入</el-button-->
<!--        >-->
<!--      </el-col>-->
<!--       <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-upload2"-->
<!--          size="mini"-->
<!--          :loading="exportLoading"-->
<!--          @click="ceshi"-->
<!--          >测试</el-button-->
<!--        >-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bankList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键id" align="center" prop="id" /> -->
      <el-table-column label="题库名字" align="center" prop="name" />
      <el-table-column label="单选题数量" align="center" prop="selectCount" />
       <el-table-column label="多选题数量" align="center" prop="selectsCount" />
       <el-table-column label="问答题数量" align="center" prop="answerCount" />
       <el-table-column label="判断题数量" align="center" prop="verdictCount" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['exam:bank:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:bank:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改题库对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="题库名字" prop="name">
          <el-input v-model="form.name" placeholder="请输入题库名字" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm"  :loading="isSubmit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

     <el-dialog
      title="批量导入"
      :visible.sync="uploadOpen"
      width="500px"
      append-to-body
    >
      <el-form  :inline="true" label-width="68px">

        <el-upload
          class="upload-demo"
          :action="uploadFileUrl"
          :limit="1"
          accept="txt"
          :on-exceed="handleExceed"
          :on-remove="handleRemove"
          :on-success="uploadSuccess"
          :file-list="fileList"
          :headers="headers"
        >
          <el-button size="small" type="primary">点击上传</el-button>
          <div slot="tip" class="el-upload__tip">
            只能上传txt文件，且不超过2M
          </div>
        </el-upload>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="uploadClick">确 定</el-button>
        <el-button @click="uploadOpen = false">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import axios from 'axios';
import { listBank, getBank, delBank, addBank, updateBank, exportBank ,listCount,dowload,getStr} from "@/api/exam/bank";
import { getToken } from "@/utils/auth";
export default {
  name: "Bank",
  data() {
    return {
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
      // 题库表格数据
      bankList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        createUser: null,
        modifyUser: null,
        modifyTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      //临时使用 导入的参数
      uploadOpen:false,
       uploadFileUrl: process.env.VUE_APP_BASE_API + "/exam/bank/upload",
             headers: {
        Authorization: "Bearer " + getToken(),
      },
      fileList: [],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    ceshi(){
       // dowload("0824fecf-f1d1-444c-bf30-72820a68adee_题库数据.xlsx").then(res=>{console.log(res)})
      //dowload("ModelData_1655717035335.csv").then(res=>{console.log(res)})

           const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有题库数据项？').then(() => {
        this.exportLoading = true;
        return getStr();
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    },
       //上传的文件移除事件
    handleRemove(file, fileList) {
      deleteFile({name:file.response.data.fileName.replace("profile","")}).then(res=>{console.log('object :>> ', res);})
    },
    //上传成功后的回调事件
    uploadSuccess(data) {
      console.log(data);
      this.file = data.data
    },
        //上传的前置事件
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
      );
    },
    /** 查询题库列表 */
    getList() {
      this.loading = true;
      listCount(this.queryParams).then(response => {
        this.bankList = response.rows;
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
        createUser: null,
        createTime: null,
        modifyUser: null,
        modifyTime: null
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加题库";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getBank(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改题库";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.isSubmit = true;
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBank(this.form).then(response => {
              this.isSubmit = false;
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBank(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除题库编号为"' + ids + '"的数据项？').then(function() {
        return delBank(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有题库数据项？').then(() => {
        this.exportLoading = true;
        return exportBank(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
