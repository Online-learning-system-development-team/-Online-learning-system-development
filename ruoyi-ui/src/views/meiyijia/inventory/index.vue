<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类" prop="bigType">
        <el-select v-model="queryParams.bigType" placeholder="请选择分类" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="类别" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择类别" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="商品代码" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入商品代码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品条码" prop="barCode">
        <el-input
          v-model="queryParams.barCode"
          placeholder="请输入商品条码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品单位" prop="unit">
        <el-input
          v-model="queryParams.unit"
          placeholder="请输入商品单位"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="批发价" prop="wholesalePrice">
        <el-input
          v-model="queryParams.wholesalePrice"
          placeholder="请输入批发价"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="建议零售价" prop="msrpPrice">
        <el-input
          v-model="queryParams.msrpPrice"
          placeholder="请输入建议零售价"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="门店零售价" prop="retailPrive">
        <el-input
          v-model="queryParams.retailPrive"
          placeholder="请输入门店零售价"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库存数量" prop="count">
        <el-input
          v-model="queryParams.count"
          placeholder="请输入库存数量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="保质期" prop="qualityTerm">
        <el-input
          v-model="queryParams.qualityTerm"
          placeholder="请输入保质期"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库时间" prop="warehousingTime">
        <el-date-picker clearable size="small"
          v-model="queryParams.warehousingTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择入库时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="入表时间" prop="crtTime">
        <el-date-picker clearable size="small"
          v-model="queryParams.crtTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择入表时间">
        </el-date-picker>
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
          v-hasPermi="['exam:inventory:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['exam:inventory:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['exam:inventory:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['exam:inventory:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-upload2"
          size="mini"
          :loading="exportLoading"
          @click="uploadOpen = true"
          v-hasPermi="['exam:inventory:export']"
        >导入</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="inventoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="分类" align="center" prop="bigType" />
      <el-table-column label="类别" align="center" prop="type" />
      <el-table-column label="商品代码" align="center" prop="code" />
      <el-table-column label="商品条码" align="center" prop="barCode" />
      <el-table-column label="商品名称和规格" align="center" prop="nameSpecification" />
      <el-table-column label="商品单位" align="center" prop="unit" />
      <el-table-column label="批发价" align="center" prop="wholesalePrice" />
      <el-table-column label="建议零售价" align="center" prop="msrpPrice" />
      <el-table-column label="门店零售价" align="center" prop="retailPrive" />
      <el-table-column label="库存数量" align="center" prop="count" />
      <el-table-column label="保质期" align="center" prop="qualityTerm" />
      <el-table-column label="入库时间" align="center" prop="warehousingTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.warehousingTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入表时间" align="center" prop="crtTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.crtTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['exam:inventory:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['exam:inventory:remove']"
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

    <!-- 添加或修改美宜佳现有库存对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="主键版本号" prop="id">
          <el-input v-model="form.id" placeholder="请输入主键版本号" />
        </el-form-item>
        <el-form-item label="分类" prop="bigType">
          <el-select v-model="form.bigType" placeholder="请选择分类">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="类别" prop="type">
          <el-select v-model="form.type" placeholder="请选择类别">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="商品代码" prop="code">
          <el-input v-model="form.code" placeholder="请输入商品代码" />
        </el-form-item>
        <el-form-item label="商品条码" prop="barCode">
          <el-input v-model="form.barCode" placeholder="请输入商品条码" />
        </el-form-item>
        <el-form-item label="商品名称和规格" prop="nameSpecification">
          <el-input v-model="form.nameSpecification" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="商品单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入商品单位" />
        </el-form-item>
        <el-form-item label="批发价" prop="wholesalePrice">
          <el-input v-model="form.wholesalePrice" placeholder="请输入批发价" />
        </el-form-item>
        <el-form-item label="建议零售价" prop="msrpPrice">
          <el-input v-model="form.msrpPrice" placeholder="请输入建议零售价" />
        </el-form-item>
        <el-form-item label="门店零售价" prop="retailPrive">
          <el-input v-model="form.retailPrive" placeholder="请输入门店零售价" />
        </el-form-item>
        <el-form-item label="库存数量" prop="count">
          <el-input v-model="form.count" placeholder="请输入库存数量" />
        </el-form-item>
        <el-form-item label="保质期" prop="qualityTerm">
          <el-input v-model="form.qualityTerm" placeholder="请输入保质期" />
        </el-form-item>
        <el-form-item label="入库时间" prop="warehousingTime">
          <el-date-picker clearable size="small"
            v-model="form.warehousingTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择入库时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="入表时间" prop="crtTime">
          <el-date-picker clearable size="small"
            v-model="form.crtTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择入表时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 导入的对话框 -->
    <el-dialog
      title="批量导入"
      :visible.sync="uploadOpen"
      width="500px"
      append-to-body
      :before-close="uploadClose"
    >
      <el-form  :inline="true" label-width="68px">
      
        <el-upload
        ref="upload"
          class="upload-demo"
          :action="uploadFileUrl"
          :limit="1"
          :on-exceed="handleExceed"
          :on-remove="handleRemove"
          :on-success="uploadSuccess"
          :file-list="fileList"
          :headers="headers"
          :auto-upload="false"
        >

          <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
          <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
          <div slot="tip" class="el-upload__tip">
            只能上传xls,csv,xlsx文件，且不超过50M
          </div>
        </el-upload>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="uploadClose()">确 定</el-button>
        <el-button @click="uploadClose()">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {listInventory} from "@/api/meiyijia/inventory";
import { getToken } from "@/utils/auth";
export default {
  name: "Inventory",
  data() {
    return {
      // 导入的遮罩层
      uploadOpen:false,
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
      // 美宜佳现有库存表格数据
      inventoryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        bigType: null,
        type: null,
        code: null,
        barCode: null,
        nameSpecification: null,
        unit: null,
        wholesalePrice: null,
        msrpPrice: null,
        retailPrive: null,
        count: null,
        qualityTerm: null,
        warehousingTime: null,
        crtTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      // 导入上传文件需要使用到的参数
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/meiyijia/inventory/upload", 
      headers: {
        Authorization: "Bearer " + getToken(),
      },
      //文件列表
      fileList: [],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    uploadClose(){
      this.uploadOpen = false
      this.fileList = []
    },
    // 手动上传的提交
    submitUpload() {
        this.$refs.upload.submit();
      },
    //上传的文件移除事件
    handleRemove(file, fileList) {
      deleteFile({name:file.response.data.fileName.replace("profile","")}).then(res=>{console.log('object :>> ', res);})
    },
    //上传成功后的回调事件
    uploadSuccess(data) {
      console.log(data);
      if(data.code===200){
        this.$message.warning("导入成功");
        this.uploadClose()
      }
    },
        //上传的前置事件
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
      );
    },

    /** 查询美宜佳现有库存列表 */
    getList() {
      this.loading = true;
      listInventory(this.queryParams).then(response => {
        this.inventoryList = response.rows;
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
        bigType: null,
        type: null,
        code: null,
        barCode: null,
        nameSpecification: null,
        unit: null,
        wholesalePrice: null,
        msrpPrice: null,
        retailPrive: null,
        count: null,
        qualityTerm: null,
        warehousingTime: null,
        crtTime: null
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
      this.title = "添加美宜佳现有库存";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInventory(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改美宜佳现有库存";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateInventory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInventory(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除美宜佳现有库存编号为"' + ids + '"的数据项？').then(function() {
        return delInventory(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有美宜佳现有库存数据项？').then(() => {
        this.exportLoading = true;
        return exportInventory(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
