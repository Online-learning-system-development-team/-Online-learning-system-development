<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="题目" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入题目"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="题目类型" prop="type">
        <el-select
          v-model="queryParams.type"
          placeholder="请选择题目类型"
          clearable
          size="small"
        >
          <el-option label="请选择题目类型" value="" />
        </el-select>
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
          v-hasPermi="['exam:questions:add']"
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
<!--          v-hasPermi="['exam:questions:edit']"-->
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
          v-hasPermi="['exam:questions:remove']"
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
<!--          v-hasPermi="['exam:questions:export']"-->
<!--          >导出</el-button-->
<!--        >-->
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
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="questionsList"
      @selection-change="handleSelectionChange"
    >

<!-- <el-table-column   prop="optionVoList" type="expand">
      <template slot-scope="props">
         <div v-for="(item,index) in props.row.optionVoList" :key="index">
             <p>{{item.optionContent}}</p>
         </div>
      </template>
    </el-table-column> -->


      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键id" align="center" prop="id" /> -->
      <el-table-column label="题目" :show-overflow-tooltip="true" align="center" prop="name" />
      <el-table-column label="题目类型" align="center" prop="type">
        <template slot-scope="scope">
        <el-tag
        effect="dark"
          type="danger"
          disable-transitions>{{scope.row.type}}</el-tag>
      </template>
      </el-table-column>
       <el-table-column label="试题解析" :show-overflow-tooltip="true" align="center" prop="analysis" />
<!--      <el-table-column label="是否启用" align="center" prop="isEnable" /> -->
      <el-table-column
      prop="labels"
      label="标签"
      width="100"
      filter-placement="bottom-end">
      <template slot-scope="scope">
        <el-tag
         size="mini"
         effect="dark"
          type="success"
          disable-transitions>{{show_format(scope.row.labels)}}</el-tag>
      </template>
    </el-table-column>
    <el-table-column
      prop="banks"
      label="题库"
      width="100"
      filter-placement="bottom-end">
      <template slot-scope="scope">
        <el-tag v-if="scope.row.banks!=null"
        size="mini"
        effect="dark"
          type="warning"
          disable-transitions>{{show_format(scope.row.banks)}}</el-tag>
      </template>
    </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit" class="right"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['exam:questions:edit']"
            >详情</el-button
          >
          <el-popover placement="top-start" width="200" trigger="hover">
            <div style="text-align: right; margin: 0">
              <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="showLabel(scope.row)"
            v-hasPermi="['exam:questions:edit']"
            >修改标签绑定</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="showBank(scope.row)"
            v-hasPermi="['exam:questions:edit']"
            >修改题库绑定</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="remove(scope.row)"
            v-hasPermi="['exam:questions:remove']"
            >删除</el-button
          >
            </div>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-more"
              slot="reference"
              >更多</el-button
            >
          </el-popover>
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

    <!-- 添加或修改试题对话框 -->
    <el-dialog class="diaolog" :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="题目" prop="name">
          <el-input
            v-model="form.name"
            type="textarea"
            placeholder="请输入题目"
            :disabled="isUpdate==true"
          />
        </el-form-item>
        <el-form-item v-if="isUpdate==false" label="标签" prop="labels">
          <el-select
            v-model="form.labels"
            multiple
            filterable
            remote
            allow-create
            reserve-keyword
            placeholder="请输入关键词"
            :remote-method="remoteMethod"
            :loading="false"
          >
            <el-option
              v-for="item in labels"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="isUpdate==false" label="题库" prop="banks">
          <el-select
            v-model="form.banks"
            multiple
            filterable
            remote
            reserve-keyword
            placeholder="请输入关键词"
            :remote-method="remoteMethodBanks"
            :loading="false"
          >
            <el-option
              v-for="item in banks"
              :key="item.id"
              :label="item.name"
              :value="item.id"
              :disabled="isUpdate==true"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="题目类型" prop="type">
          <el-select
            v-model="form.type"
            @change="(item) => (this.currentQuestionTye = item)"
            placeholder="请选择题目类型"
            :disabled="isUpdate==true"
          >
            <el-option
              v-for="item in dict.type.question_type"
              :key="item.value"
              :label="item.label"
              :value="item.value"
              :disabled="isUpdate==true"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          v-show="currentQuestionTye == 'answer'"
          label="答案"
          prop="answer"
        >
          <el-input
            v-model="form.answer"
            type="textarea"
            placeholder="请输入问答题答案"
          />
        </el-form-item>
        <el-form-item
          v-show="currentQuestionTye == 'verdict'"
          label="答案"
          prop="judgeAnswer"
          :disabled="isUpdate==true"
        >
          <el-switch
            v-model="judgeAnswer"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-text="正确"
            inactive-text="错误"
            :disabled="isUpdate==true"
          >
          </el-switch>
        </el-form-item>
        <el-form-item
          v-show="
            currentQuestionTye == 'select' || currentQuestionTye == 'selects'
          "
          label="答案"
          prop="selectAnswer"
        >
          <!-- <el-input
            v-model="form.selectAnswer"
            placeholder="请输入单选题或者多选题答案"
          /> -->
          <el-select
            v-show="currentQuestionTye == 'select'"
            v-model="form.selectAnswer"
            placeholder="请选择单选题答案"
            :disabled="isUpdate==true"
          >
            <el-option
              v-for="item in formlist.list"
              :key="item.$id"
              :label="item.option"
              :value="item.$id"
            >
            </el-option>
          </el-select>
          <el-select
            v-show="currentQuestionTye == 'selects'"
            multiple
            v-model="form.selectAnswers"
            placeholder="请选择多选题答案"
            :disabled="isUpdate==true"
          >
            <el-option
              v-for="item in formlist.list"
              :key="item.$id"
              :label="item.option"
              :value="item.$id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-row
          v-show="
            currentQuestionTye == 'select' || currentQuestionTye == 'selects'
          "
          style="margin-top: 10px; margin-bottom: 10px"
        >
          <el-button :disabled="isUpdate==true" @click="addRow">添加一行</el-button>
          <el-button :disabled="isUpdate==true" @click="removeRow">删除一行</el-button>
        </el-row>
        <el-form-item
          v-show="
            currentQuestionTye == 'select' || currentQuestionTye == 'selects'
          "
          label="题目选项"
          :disabled="isUpdate==true"
        >
          <el-form :model="formlist" label-position="top">
            <el-table
              ref="tableOptions"
              :data="formlist.list"
              @selection-change="
                (data) => {
                  this.currentSelectOption = data;
                }
              "
            >
              <el-table-column type="selection" width="50"> </el-table-column>
              <el-table-column prop="option" width="60"> </el-table-column>
              <el-table-column prop="name">
                <template slot-scope="scope">
                  <el-form-item>
                    <el-input
                      v-model="scope.row.name"
                      type="textarea"
                      placeholder="请输入题目选项"
                      :disabled="isUpdate==true"
                    ></el-input>
                  </el-form-item>
                </template>
              </el-table-column>
            </el-table>
          </el-form>
        </el-form-item>
        <el-form-item label="试题解析" prop="analysis">
          <el-input
            v-model="form.analysis"
            type="textarea"
            placeholder="请输入试题解析"
            :disabled="isUpdate==true"
          />
        </el-form-item>
<!--        <el-form-item label="是否启用" prop="isEnable">-->
<!--          <el-switch-->
<!--            v-model="isEnable"-->
<!--            active-color="#13ce66"-->
<!--            inactive-color="#ff4949"-->
<!--            active-text="启用"-->
<!--            inactive-text="未启用"-->
<!--          >-->
<!--          </el-switch>-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button v-show="isUpdate==false" type="primary" @click="submitForm" :loading="isSubmit">确 定</el-button>
<!--        <el-button v-show="isUpdate==true" type="primary" @click="submitFormUpdate" >修 改</el-button>-->
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 导入的对话框 -->
    <el-dialog
      title="批量导入"
      :visible.sync="uploadOpen"
      width="500px"
      append-to-body
    >
      <el-form :model="uploadForm" :inline="true" label-width="68px">
        <el-form-item label="标签" prop="labels">
          <el-select
            v-model="uploadForm.labels"
            multiple
            filterable
            remote
            reserve-keyword
            placeholder="请输入关键词"
            :remote-method="remoteMethod"
            :loading="false"
          >
            <el-option
              v-for="item in labels"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="题库" prop="banks">
          <el-select
            v-model="uploadForm.banks"
            multiple
            filterable
            remote
            reserve-keyword
            placeholder="请输入关键词"
            :remote-method="remoteMethodBanks"
            :loading="false"
          >
            <el-option
              v-for="item in banks"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
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

    <!-- 修改 绑定 的题库的 -->
    <el-dialog  title="题库详情" :visible.sync="isBank" width="500px" append-to-body>
      <el-table :data="QuestionBankList" >
      <!-- <el-table-column label="主键id" align="center" prop="id" /> -->
      <el-table-column label="题库" align="center" prop="name" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
          >解绑</el-button>
        </template>
      </el-table-column>
    </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="isBank = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 修改 绑定 的题库的 -->
    <el-dialog  title="标签详情" :visible.sync="isLabel" width="500px" append-to-body>
      <el-table :data="QuestionLabelList" >
      <!-- <el-table-column label="主键id" align="center" prop="id" /> -->
      <el-table-column label="标签" align="center" prop="name" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
          >解绑</el-button>
        </template>
      </el-table-column>
    </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="isLabel = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
const formTemplate = {
  name: "", //题目
  labels: [], //标签
  banks: [], //题库
  type: "", //试题类型
  answer: "", //问答题答案
  judgeAnswer: "", //判断题答案
  selectAnswer: "", //单选题答案
  selectAnswers: [], //多选题答案
  analysis: "", //试题的解析
  isEnable: "", //是否启用
  list: [], //多选题或者单选题的选项
};
import {
  listQuestions,
  getQuestions,
  delQuestions,
  insertQuestions,
  addQuestions,
  updateQuestions,
  exportQuestions,
  deleteFile,
  delQuestionByid,
  insertBtachQuestions,
  listAndOptions,
  listQuestionsVo
} from "@/api/exam/questions";
import { listLabel,listLabelByQuestionId } from "@/api/exam/label";
import { listBank,listBankByQuestionId,getBankSelect } from "@/api/exam/bank";
export default {
  dicts: ["question_type"],
  name: "Questions",
  data() {
    return {
      // 防止表单重复提交
      isSubmit:false,
      isUpdate:true,//用来判断是新增还是修改
      QuestionLabelList:[],//这个是试题的绑定的标签的列表
      isLabel: false,
      QuestionBankList:[],//这个是试题的绑定的题库的列表
      isBank:false,
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/exam/questions/upload",
      file:{fileName:"",str:""},
      uploadForm: {
        labels: [], //标签
        banks: [], //题库
      },
      headers: {
        Authorization: "Bearer " + getToken(),
      },
      fileList: [],
      uploadOpen: false,
      // 表单参数
      form: { ...formTemplate },
      formlist: { list: [{ $id: 0, name: "", option: "A" }] },
      isEnable: true,
      judgeAnswer: true,
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
      // 试题表格数据
      questionsList: [],
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null, //题目
        type: null, //题目类型
      },
      // 表单校验
      rules: {},
      //标签列表
      labelList: [],
      //标签的下拉框的搜索列表
      labels: [],
      //题库列表
      banks: [],
      //弹窗的标题
      title:"新增试题",
      //题库的下拉框的搜索列表
      bankList: [],
      //当前选中的题目类型
      currentQuestionTye: "",
      //当前选中的单选题或者多选题的
      currentSelectOption: "",
      currentIndex: 1,
    };
  },
  created() {
    this.getQuestionBankList();
    this.getList();

  },
  methods: {


    //题库的格式化
    show_format(bank){
      if(bank!=null){
          bank=bank.substring(0,bank.length-1)
      }
      return bank
    },

    submitFormUpdate(){
      //修改的方法
       this.$message('修改功能暂时待完善');
    },
    showLabel(row){
      listLabelByQuestionId(row.id).then(res=>{

        this.QuestionLabelList = res.rows
         this.isLabel = true
      })
    },
    showBank(row){
      listBankByQuestionId(row.id).then(res=>{

        this.QuestionBankList = res.rows
         this.isBank = true
      })
    },
    uploadClick() {
      let list = this.uploadSuccessDataInit(this.file.str)
       //console.log(list);
      if(list instanceof Array){
         let params={list :list}
      insertBtachQuestions(params).then(res=>{
        console.log(res)
        this.$modal.msgSuccess("导入成功");
      })
      }else {
        this.$modal.alertError(list);
      }
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
    uploadSuccessDataInit(data) {
    //console.log(data)
    let uploadDataList = []
    let list = []
    let ary = data.split("单选")
    //console.log(ary);
    ary.filter(item=>{
     let arys = item.split("多选")
     list = list.concat(arys)
    })
    //console.log(list);
    let result = null
    list.forEach((item,index)=>{
     let obj = {list:[]}
     let s = item.indexOf(".")
     let a = item.indexOf("：")
     obj.isEnable = true
     obj.name = item.substring(s+1,a)
     let b = item.indexOf("A .")
     if(b<0){
       b=item.indexOf("A.")
     }
     if(a<0||a>b){
      a = item.indexOf(":")
      obj.name = item.substring(s+1,a)
     }
     let answer = item.substring(a,b).replace(/[:,：]/,"").trim()
     if(answer.length>8){
       //中止添加数据
       result ="题目的答案解析失败，请检查，题目如下："+item
       return true
     }
     if(answer.length>1){
      //多选题
      obj.type = "selects"
      obj.selectAnswers =  answer.split("")
     }else{
      //单选题
      obj.type = "select"
      obj.selectAnswer =  answer
     }
     //console.log(answers);
     let c = item.indexOf("B .")
     if(c<0){
       c=item.indexOf("B.")
     }
     obj.list.push({option:"A",name:item.substring(b,c).replace("A .","").replace("A.","")})
     let d = item.indexOf("C .")
     if(d<0){
       d=item.indexOf("C.")
     }
     obj.list.push({option:"B",name:item.substring(c,d).replace("B .","").replace("B.","")})
     let e = item.indexOf("D .")
     if(e<0){
       e=item.indexOf("D.")
     }
     obj.list.push({option:"C",name:item.substring(d,e).replace("C .","").replace("C.","")})
     let f = item.indexOf("E .")
     if(f<0){
       f=item.indexOf("E.")
     }
     if(f>0){
      obj.list.push({option:"D",name:item.substring(e,f).replace("D .","").replace("D.","")})
      obj.list.push({option:"E",name:item.substring(f,item.length).replace("E .","").replace("E.","")})
     }else {
      obj.list.push({option:"D",name:item.substring(e,item.length).replace("D .","").replace("D.","")})
     }
     if(index!=0){
       obj.labels = this.uploadForm.labels
       obj.banks = this.uploadForm.banks
       uploadDataList.push(obj)
     }
    })

    //判断是否有解析错误
    if(result!=null){
      console.log(result)
      return result
    }
    //去重
    let json = {}
    let res = []
    for(var i = 0;i<uploadDataList.length;i++){
      let obj = uploadDataList[i]
      if(!json[obj.name]){
        res.push(obj)
        json[obj.name]=1
      }
    }
    json = {}
    return res
    },
    //上传的前置事件
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
      );
    },
    //多选或者单选的题目选项添加一行
    addRow() {
      let list = this.formlist.list;
      if (list.length == 6) {
        this.$message.error("最多只能添加7个选项");
      } else {
        let obj = { name: "", option: "", $id: this.currentIndex };
        this.currentIndex = this.currentIndex + 1;
        list.push({ name: "", option: "", $id: this.currentIndex });
        this.optionInit();
      }
    },
    //多选单选的题目选项的移除一行
    removeRow() {
      this.currentSelectOption.forEach((element) => {
        this.formlist.list.forEach((item,index) => {
          if (item.$id == element.$id) {
            this.formlist.list.splice(index, 1);
          }
        });
      });
      //
      this.optionInit();
    },
    //选项的ABCD数据初始化
    optionInit() {
      this.formlist.list = this.formlist.list.map((item, index) => {
        switch (index) {
          case 0:
            item.option = "A";
            break;
          case 1:
            item.option = "B";
            break;
          case 2:
            item.option = "C";
            break;
          case 3:
            item.option = "D";
            break;
          case 4:
            item.option = "E";
            break;
          case 5:
            item.option = "F";
            break;
          case 6:
            item.option = "G";
            break;
        }
        return item;
      });
      //console.log(this.formlist.list);
    },
    //题库的搜索监听
    remoteMethodBanks(query) {
      //console.log(query)
      let ary = this.bankList.filter((item) => {
        //console.log(item.name.indexOf(query))
        if (item.name.indexOf(query) >= 0) {
          return item;
        }
      });
      //console.log(this.labelList)
      this.banks = ary;
    },
    //标签的搜索监听
    remoteMethod(query) {
      //console.log(query)
      let ary = this.labelList.filter((item) => {
        //console.log(item.name.indexOf(query))
        if (item.name.indexOf(query) >= 0) {
          return item;
        }
      });
      //console.log(this.labelList)
      this.labels = ary;
    },
    /** 查询标签库 */
    getLabelList() {
      listLabel().then((res) => {
        this.labelList = res.rows;
        this.labels = res.rows;
        //console.log(res.rows)
      });
    },
    /** 查询题库列表 */
    getQuestionBankList() {
      getBankSelect().then((res) => {
        this.bankList = res.rows;
        this.banks = res.rows;
      });
    },
    /** 查询试题列表 */
    getList() {
      this.loading = true;
      this.queryParams.orderByColumn = "id"
      this.queryParams.isAsc = "desc"
      listAndOptions(this.queryParams).then((response) => {
        this.questionsList = response.rows.map(item=>{
          if(item.type=="answer"){
            item.type = "问答题"
          }else if(item.type=="verdict"){
item.type = "判断题"
          }else if(item.type=="selects"){
item.type = "多选题"
          }else if(item.type=="select"){
item.type = "单选题"
          }
          return item
        });
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
        ...formTemplate,
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
      this.getLabelList();
      this.getQuestionBankList();
      this.reset();
      this.isUpdate=false
      this.open = true;
      this.title = "添加试题";
      this.form = { ...formTemplate };
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.isUpdate = true
      console.log(row)
      const id = row.id || this.ids;
      getQuestions(id).then((response) => {
        console.log(response.data)
        //回显设置form的数据
        this.form = response.data;
        //设置单选题的答案选项
        this.form.selectAnswer = parseInt(response.data.selectAnswer)
        //设置 单选题或者多选题的题目选项信息
        this.formlist.list = row.optionVoList.map(item=>{
           return { $id: item.id, name: item.optionContent, option: null }
        })
        //格式化设置选项的option
        this.optionInit()
        //回显设置题目的类型
        this.currentQuestionTye = response.data.type
        //打开显示弹窗
        this.open = true;
        this.title = "试题详情"
        //设置选项的选中
        this.$nextTick(() => {
          this.formlist.list.forEach(item=>{
          //console.log(item.$id==this.form.selectAnswer)
          if(item.$id==this.form.selectAnswer){
             //console.log(this.$refs)
             this.$refs.tableOptions.toggleRowSelection(item);
          }
        })
      })
      });
    },
    //新增数据提交前的初始化
    submitFormInit() {
      //判断是否有需要新添加的标签
      let lableList = this.form.labels
      this.form.newLabelList = lableList.filter(item=>typeof(item) === 'string')
      this.form.labels = lableList.filter(item=>typeof(item) === 'number')
      //根据题目类型判断，清空其他的答案数据
      if (this.currentQuestionTye == "selects") {
        // 多选题
        this.form.answer = null;
        this.form.judgeAnswer = null;
        this.judgeAnswer = true;
        this.form.list = this.formlist.list;
        this.form.selectAnswer = null;
        console.log(this.form);
        let strs = [];
        this.form.list.forEach((item) => {
          this.form.selectAnswers.forEach((obj, index) => {
            if (item.$id == obj) {
              strs.push(item.option);
            }
          });
        });
        this.form.selectAnswers = strs;
        //this.form.selectAnswer = this.form.selectAnswers
      } else if (this.currentQuestionTye == "select") {
        //单选题
        this.form.answer = null;
        this.form.judgeAnswer = null;
        this.judgeAnswer = true;
        this.form.list = this.formlist.list;
        this.form.selectAnswers = [];
        this.form.list.some((item) => {
          if (item.$id == this.form.selectAnswer) {
            this.form.selectAnswer = item.option;
            return true;
          } else {
            return false;
          }
        });
      } else if (this.currentQuestionTye == "verdict") {
        //判断题答案
        this.form.answer = null;
        this.form.selectAnswer = null;
        this.form.selectAnswers = null;
        this.form.judgeAnswer = this.judgeAnswer;
        this.form.list = [];
        this.formlist.list = [{ $id: 0, name: "", option: "A" }];
      } else if (this.currentQuestionTye == "answer") {
        //问答题答案
        this.form.judgeAnswer = true;
        this.judgeAnswer = null;
        this.form.selectAnswer = null;
        this.form.selectAnswers = null;
        this.form.list = [];
        this.formlist.list = [{ $id: 0, name: "", option: "A" }];
      } else {
        this.form.answer = null;
        this.form.judgeAnswer = null;
        this.judgeAnswer = null;
        this.form.selectAnswer = null;
        this.form.selectAnswers = null;
        this.form.list = [];
        this.formlist.list = [];
      }
      //是否启用
      this.form.isEnable = this.isEnable;
      console.log(this.form);
    },
    /** 提交按钮 */
    submitForm() {
      this.isSubmit = true;
      this.submitFormInit();
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateQuestions(this.form).then((response) => {
              this.isSubmit = false;
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            insertQuestions(this.form).then((response) => {
              this.isSubmit = false;
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
              //清除表单已选数据
              this.form = { ...formTemplate };
              this.formlist = { list: [{ $id: 0, name: "", option: "A" }] };
              this.isEnable = true;
              this.judgeAnswer = true;
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除试题编号为"' + ids + '"的数据项？')
        .then(function () {
          return delQuestions(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },

    remove(row){
      delQuestionByid(row.id).then(res=>{
        console.log(res)
        this.getList();
          this.$modal.msgSuccess("删除成功");
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal
        .confirm("是否确认导出所有试题数据项？")
        .then(() => {
          this.exportLoading = true;
          return exportQuestions(queryParams);
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
.diaolog .el-table .el-table__header-wrapper thead th,
.diaolog .el-table .el-table__fixed-header-wrapper thead th {
  display: none;
}
.right{
  margin-right: 10px;
}
 .demo-table-expand {
    font-size: 0;
  }
  .demo-table-expand label {
    width: 90px;
    color: #99a9bf;
  }
  .demo-table-expand .el-form-item {
    margin-right: 0;
    margin-bottom: 0;
    width: 50%;
  }
</style>
