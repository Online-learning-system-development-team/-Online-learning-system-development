<template>
  <div class="app-container" v-if="state">
    <el-header>
      <div>题目总数：{{ paperData.questionList.length }}</div>
      <el-row>
        <el-col :span="6"
          ><div>考试时长：{{ paperData.duration }}分钟</div>
        </el-col>
      </el-row>
    </el-header>
<!--    <el-header>-->
<!--      <el-row>-->
<!--        <span v-for="(item, index) in paperData.questionList" :key="index">-->
<!--          <el-col :span="1">-->
<!--            <span style="margin-right: 5px">{{ index + 1 }}</span>-->
<!--            <input @click="checkoutChange" type="checkbox" :value="index" />-->
<!--          </el-col>-->
<!--        </span>-->
<!--      </el-row>-->
<!--    </el-header>-->
    <el-main>
      <el-footer>
        <el-button @click="subtract">上一题</el-button>
        <el-button @click="add">下一题</el-button>
      </el-footer>
      <span v-for="(item, index) in paperData.questionList" :key="item.id">
        <div v-show="index == currentIndex">
          <!-- 单选题 -->
          <div v-show="item.questionsType == 'select'">
            <div>
              <p>单选题</p>
              <p>{{ index + 1 }}.{{ item.title }}：</p>
            </div>
            <div>
              <el-radio-group disabled
                v-model="selectRadio"
                @change="radioChange(item)"
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
              <el-checkbox-group  disabled
                v-model="selectsRadioList"
                style="display: flex; flex-direction: column"
                @change="checkboxChange(item)"
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
              <el-input readonly
  type="textarea"
  :autosize="{ minRows: 2, maxRows: 4}"
  placeholder="请输入内容"
  v-model="answers">
</el-input>


            </div>
          </div>

          <el-row>
            <el-col :span="5" class="iscorrent">
              <p v-if="item.isCorrect == 0">
                错误<i class="el-icon-close"></i>
              </p>
              <p v-if="item.isCorrect == 1">
                正确<i class="el-icon-check"></i>
              </p>
            </el-col>
            <el-col :span="19" class="answer">
              <p>正确答案</p>
              <p v-if="item.questionsType == 'select'||item.questionsType == 'selects'">
                {{
                  item.selectAnswer
                    .split(",")
                    .sort()
                    .toString()
                    .replaceAll(",", " ")
                }}
              </p>
              <el-input readonly="" v-else-if="item.questionsType == 'answer'"
  type="textarea"
  :autosize="{ minRows: 2, maxRows: 4}"
  v-model="item.answer">
</el-input>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="15">
              <el-form ref="form" :model="item" label-width="120px">
                <el-form-item label="试题解析：">
                <el-input
                  type="textarea"
                  :autosize="{ minRows: 4, maxRows: 8}"
                  placeholder="请输入内容"
                  v-model="item.analysis"
                >
                </el-input>
              </el-form-item>
              <el-form-item>
    <el-button type="primary" @click="onSubmit(item)">更新解析</el-button>
  </el-form-item>
              </el-form>
            </el-col>
          </el-row>
        </div>
      </span>
    </el-main>
  </div>
</template>

<script>
import {
  getUserAnswer,
} from "@/api/exam/answer";

import {
  updateQuestions,
} from "@/api/exam/questions";

export default {
  name: "userPaper",
  data() {
    return {
      answers:"",
      state: false,
      currentIndex: 0, //当前题目
      selectRadio: [], //单选题的选项
      selectsRadioList: [], //多选题的选项
      paperData: {}, //试卷数据
      answerId: null,
    };
  },
  created() {
    this.getUser();
  },
  methods: {
    onSubmit(data) {
      console.log(data.questionsId)
      let param  = {
        id:data.questionsId,
        analysis:data.analysis
      }
      updateQuestions(param).then(res=>{
        console.log(res)
        this.$modal.msgSuccess("更新成功");
      })
    },
    radioChange(data) {
      this.$modal.msgError("不能修改");
      this.selectRadio = data.userAnswer;
    },
    checkboxChange(data) {
      this.$modal.msgError("不能修改");
      this.selectsRadioList = data.userAnswer.split(",");
    },
    getUser() {
      this.answerId = this.$route.params.answerId;
      getUserAnswer(this.answerId).then((res) => {
        console.log(res);
        this.paperData = res.data;
        this.state = true;
        if (res.data.questionList[0].questionsType == "select") {
          this.selectRadio = res.data.questionList[0].userAnswer;
        } else if (res.data.questionList[0].questionsType == "selects") {
          this.selectsRadioList =
            res.data.questionList[0].userAnswer.split(",");
        }else if (res.data.questionList[0].questionsType == "answer") {
           this.answers = res.data.questionList[0].userAnswer;
        }
      });
    },

    //上一题
    subtract() {
      if (this.currentIndex > 0) {
        //储存上一题的选中值
        let up = this.paperData.questionList[this.currentIndex - 1];
        //获取上一道题 进行答案的渲染
        if (up.questionsType == "selects") {
          this.selectsRadioList = this.selectsRadioList =
            up.userAnswer != null ? up.userAnswer.split(",") : [];
        } else if (up.questionsType == "select") {
            this.selectRadio = up.userAnswer;
        } else if (up.questionsType == "answer") {
          this.answers = up.userAnswer;
        }
        //切换当前题目的下标
        this.currentIndex = this.currentIndex - 1;
      }
    },
    //下一题的按钮
    add() {
      if (this.currentIndex < this.paperData.questionList.length - 1) {
        let down = this.paperData.questionList[this.currentIndex + 1];
        //获取下一道题目的答案，进行渲染
        if (down.questionsType == "selects") {
          this.selectsRadioList = this.selectsRadioList =
            down.userAnswer != null ? down.userAnswer.split(",") : [];
        } else if (down.questionsType == "select") {
          this.selectRadio = down.userAnswer;
        } else if (down.questionsType == "answer") {
          this.answers = down.userAnswer;
        }
        //切换当前题目的下标
        this.currentIndex = this.currentIndex + 1;
      }
    },
    //切换题目的按钮
    checkoutChange(data) {
      data.target.checked = true;
    },
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
.iscorrent p {
  font-size: 20px;
  color: red;
  letter-spacing: 10px;
  font-weight: 700;
}
.answer p {
  font-size: 20px;
  letter-spacing: 10px;
  font-weight: 700;
}
</style>
