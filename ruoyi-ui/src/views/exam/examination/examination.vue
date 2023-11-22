<template>
  <div class="app-container" v-if="state">
    <el-header>
      <div>题目总数：{{ paperData.questionList.length }}</div>
      <el-row>
        <el-col :span="6"><div>考试时长：{{ paperData.duration}}分钟</div> </el-col>
        <el-col :span="6"><div>剩余时长：
        {{duration}}
        </div></el-col>
      </el-row>
    </el-header>
    <el-header>
      <p>题目目录</p>
      <el-row>
        <span v-for="(item, index) in paperData.questionList" :key="index">
          <el-col :span="1">
            <span style="margin-right: 5px">{{ index + 1 }}</span>
<!--            <input @click="checkoutChange" type="checkbox" :value="index" />-->
          </el-col>
        </span>
      </el-row>
    </el-header>
    <el-main>
      <span v-for="(item, index) in paperData.questionList" :key="item.id">
        <div v-show="index == currentIndex">
          <!-- 单选题 -->
          <div v-show="item.questionsType == 'select'">
            <div>
              <p>单选题</p>
              <p>{{ index + 1 }}.{{ item.title }}：</p>
            </div>
            <div>
              <el-radio-group
                v-model="selectRadio"
                style="display: flex; flex-direction: column"
              >
                <el-radio
                  v-for="(option, optionIndex) in item.optionList"
                  :key="optionIndex"
                  :label="option.serialNumber"
                  >{{ option.serialNumber }}:{{
                    option.optionContent
                  }}</el-radio
                >
              </el-radio-group>
            </div>
          </div>
          <!-- 多选题 -->
          <div v-show="item.questionsType == 'selects'">
            <div>
              <p>多选题</p>
              <p>{{ index + 1 }}.{{ item.title }}：</p>
            </div>
            <div>
              <el-checkbox-group
                v-model="selectsRadioList"
                style="display: flex; flex-direction: column"
              >
                <el-checkbox
                  v-for="(option, optionIndex) in item.optionList"
                  :key="optionIndex"
                  :label="option.serialNumber"
                  >{{ option.serialNumber }}:{{
                    option.optionContent
                  }}</el-checkbox
                >
              </el-checkbox-group>
            </div>
          </div>
          <!-- 问答题 -->
            <div v-show="item.questionsType == 'answer'">
            <div>
              <p>问答题</p>
              <p>{{ index + 1 }}.{{ item.title }}：</p>
            </div>
            <div>
              <el-input
  type="textarea"
  :autosize="{ minRows: 2, maxRows: 4}"
  placeholder="请输入内容"
  v-model="answers">
</el-input>


            </div>
          </div>
          <!-- 判断题 -->
        </div>
      </span>
      <el-col :span="8"><div class="grid-content bg-purple"></div></el-col>

    </el-main>
    <el-divider></el-divider>

    <Footer>
      <el-footer>
        <el-button @click="subtract">上一题</el-button>
        <el-button @click="add">下一题</el-button>
        <el-button @click="submit" :loading="isSubmit">提交</el-button>
      </el-footer>
    </Footer>

    <el-dialog
    :close-on-click-modal="false"
    :show-close="false"
    :close-on-press-escape="false"
  :visible.sync="centerDialogVisible"
  width="50%"
  center>
  <span>需要注意的是内容是默认不居中的</span>
  <div style="height:600px">
    <el-row>
      <el-col :span="24">
        <h1>得分：{{userTotalPoint}}</h1>
      </el-col>
    </el-row>
  </div>
  <span slot="footer" class="dialog-footer">
    <el-button @click="userAnswerDetail">查看详情</el-button>
    <el-button type="primary" @click="$tab.closePage(); ">确 定</el-button>
  </span>
</el-dialog>
  </div>
</template>

<script>
import { paperQuestionList,addUserAnswer ,getUserAnswer} from "@/api/exam/examination";

export default {
  name: "Examination",
  data() {
    return {
      isSubmit:false,
      answers:"",
      state: false,
      currentIndex: 0, //当前题目
      selectRadio: [], //单选题的选项
      selectsRadioList: [], //多选题的选项
      paperData: {}, //试卷数据
      checkQuestionList: [1], //当前已做的题目
      paperId: null,//试卷id
      taskId: null,//任务id
      duration:null,//考试时长倒计时
      startTime: null,//开始时间
      endTime: null, //结束时间
      centerDialogVisible:false,
      userTotalPoint:null,
      userAnswerId:null
    };
  },
  created() {
    this.getRouterData();
  },
  methods: {
    userAnswerDetail(){
this.$tab.openPage("答题详情", "/exam/userPaper/"+this.userAnswerId);
    },
    //倒计时
    countDown(){
      setInterval(()=>{
        let time = Date.parse(new Date())
         if(this.endTime>time){
           //正常执行
           let obj = this.getTimeNumber(this.endTime-time)
           this.duration = obj.hour+":"+obj.minutes+":"+obj.seconds
         }
      },1000)
    },
    //提交试卷
    submit() {
      this.isSubmit = true;
      addUserAnswer(this.submitDataInit()).then((res) => {
        // console.log(res.data)
         this.userAnswerId = res.data
         this.centerDialogVisible = true
         this.isSubmit = false;
         //this.getUser(res.data)
        //  if(res.data == this.paperData.questionList){
        //    this.$modal.msgSuccess("提交成功");
        //  }else {
        //    this.$modal.msgError("提交失败");
        //  }
      });
    },
    //提交前的数据初始化
    submitDataInit() {
      //用于修复提交的时候 当前页面数据未加载进来的bug
      let question = this.paperData.questionList[this.currentIndex];
      if (question.questionsType == "selects") {
        question.selectsRadioList = this.selectsRadioList;
      } else if (question.questionsType == "select") {
        question.selectRadio = this.selectRadio;
      }else if (question.questionsType == "answer") {
        question.answers = this.answers;
      }
      //整理数据
      let ary = this.paperData.questionList.map((item) => {
        if (item.questionsType == "select") {
          if (item.selectRadio != null) {
            item.isCorrect =
              item.selectRadio === item.selectAnswer ? true : false;
          } else {
            item.isCorrect = false;
          }
        } else if (item.questionsType == "selects") {
          if (item.selectsRadioList != null) {
            //先对答案做排序处理
            let str = item.selectAnswer.split(",").sort().toString();
            //判断答案是否正确
            item.isCorrect =
              item.selectsRadioList.sort().toString() === str ? true : false;
          } else {
            item.isCorrect = false;
          }
        } else if (item.questionsType == "answer") {
          if (item.selectsRadioList != null) {
            //判断答案是否正确
            item.isCorrect =
              item.answer === item.answers ? true : false;
          } else {
            item.isCorrect = false;
          }
        }
        return item;
      });

      //统计分值
      let score = ary.map(obj=>{if(obj.isCorrect){return parseInt(obj.score)}else {return 0}}).reduce((pre ,cur )=>pre+cur)

      //设置数据
      let param = {
        examinationPaperId: parseInt(this.paperId) ,
        startTime:this.startTime,
        endTime:new Date(),
        totalPoints:score,
        taskId: parseInt(this.taskId),
        optionList:[],
      }
      param.optionList = ary.map(item=>{
        let obj = {
          examinationPaperQuestionsId:item.id,
          questionsType:item.questionsType,
          questionsAnswer:item.selectAnswer,
          isCorrect:item.isCorrect,
        }
        if(item.questionsType == "select"){
          obj.userAnswer = item.selectRadio
        }else if(item.questionsType == "selects"){
          obj.userAnswer = item.selectsRadioList != null ?item.selectsRadioList.sort().toString():""
        }else if(item.questionsType == "answer"){
          obj.userAnswer = item.answers != null ?item.answers:""
          obj.questionsAnswer = item.answer
        }
        return obj
      })
      //console.log(ary,score,this.paperData,param)
      this.userTotalPoint = param.totalPoints
      return param
    },
    //上一题
    subtract() {
      if (this.currentIndex > 0) {
        //储存上一题的选中值
        let question = this.paperData.questionList[this.currentIndex];
        let up = this.paperData.questionList[this.currentIndex - 1];
        //获取当前题目，记性答案的储存更新
        if (question.questionsType == "selects") {
          question.selectsRadioList = this.selectsRadioList;
        } else if (question.questionsType == "select") {
          question.selectRadio = this.selectRadio;
        } else if(question.questionsType == "answer"){
         question.answers = this.answers;
        }
        //获取上一道题 进行答案的渲染
        if (up.questionsType == "selects") {
          this.selectsRadioList =
            up.selectsRadioList == undefined ? [] : up.selectsRadioList;
        } else if (up.questionsType == "select") {
          this.selectRadio =
            up.selectRadio == undefined ? null : up.selectRadio;
        } else if(question.questionsType == "answer"){
           this.answers =
           up.answers == undefined ? null : up.answers;
        }
        //切换当前题目的下标
        this.currentIndex = this.currentIndex - 1;
      }
    },
    //下一题的按钮
    add() {
      if (this.currentIndex < this.paperData.questionList.length - 1) {
        //储存当前题目的值 更新答案
        let question = this.paperData.questionList[this.currentIndex];
        let down = this.paperData.questionList[this.currentIndex + 1];
        if (question.questionsType == "selects") {
          question.selectsRadioList = this.selectsRadioList;
        } else if (question.questionsType == "select") {
          question.selectRadio = this.selectRadio;
        } else if(question.questionsType == "answer"){
          question.answers = this.answers;
        }
        //获取下一道题目的答案，进行渲染
        if (down.questionsType == "selects") {
          this.selectsRadioList =
            down.selectsRadioList == undefined ? [] : down.selectsRadioList;
        } else if (down.questionsType == "select") {
          this.selectRadio =
            down.selectRadio == undefined ? null : down.selectRadio;
        } else if(question.questionsType == "answer"){
           this.answers =
           down.answers == undefined ? null : down.answers;
        }
        //切换当前题目的下标
        this.currentIndex = this.currentIndex + 1;
      }
    },
    //切换题目的按钮
    checkoutChange(data) {
      data.target.checked = true;
    },
    //获取初始化的数据
    getRouterData() {
      this.taskId = this.$route.params.taskId
      this.paperId = this.$route.params.paperId;
      paperQuestionList({ paperId: this.$route.params.paperId }).then((res) => {
        this.paperData = res.data;
        this.state = true;
        this.startTime = new Date()
        this.startDate = Date.parse(new Date())
        this.endTime = this.startDate + 60 * res.data.duration*1000;//加考试时长的时间戳 考试时长单位为分钟
        //var dataDefPar = new Date(parseInt(this.endTime));//转换为时间
        //console.log(dataDefPar.getFullYear() + '-' + (dataDefPar.getMonth() + 1) + '-' + (dataDefPar.getDate())+" "+dataDefPar.getHours()+":"+dataDefPar.getMinutes()+":"+dataDefPar.getSeconds())
        this.countDown()
      });
    },
    // 计算时间
 getTimeNumber (number) {
   var hour = Math.floor(number / 3600/1000), //小时
         minutes = Math.floor((number - hour * 3600) / 60/1000),
         seconds = Math.floor(number - (hour * 3600 + minutes * 60)*1000)/1000;
         return {
             hour: hour,
             minutes: minutes,
             seconds: seconds
        }
}
  },
};
</script>
<style>
.el-radio {
  margin-top: 15px;
}
.el-checkbox {
  margin-top: 15px;
}
</style>
