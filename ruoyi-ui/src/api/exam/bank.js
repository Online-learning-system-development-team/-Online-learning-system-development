import request from '@/utils/request'

// 查询题库列表
export function listBank(query) {
  return request({
    url: '/exam/bank/list',
    method: 'get',
    params: query
  })
}

//下载文件
export function dowload(fileName ) {
  return request({
    url: '/common/download?fileName='+fileName+"&delete=false",
    method: 'get',
    responseType: 'blob',
  })
}


export function listCount(query) {
  return request({
    url: '/exam/bank/listCount',
    method: 'get',
    params: query
  })
}

// 根据那个题目的ID 查询题库列表
export function listBankByQuestionId(questionId) {
  return request({
    url: '/exam/bank/listByQuestionId/'+questionId,
    method: 'get',
  })
}

// 查询题库详细
export function getBank(id) {
  return request({
    url: '/exam/bank/' + id,
    method: 'get'
  })
}


// 查询题库  下拉框
export function getBankSelect() {
  return request({
    url: '/exam/bank/listByRole',
    method: 'get'
  })
}

// 新增题库
export function addBank(data) {
  return request({
    url: '/exam/bank',
    method: 'post',
    data: data
  })
}

// 修改题库
export function updateBank(data) {
  return request({
    url: '/exam/bank',
    method: 'put',
    data: data
  })
}

// 删除题库
export function delBank(id) {
  return request({
    url: '/exam/bank/' + id,
    method: 'delete'
  })
}

// 导出题库
export function exportBank(query) {
  return request({
    url: '/exam/bank/export',
    method: 'get',
    params: query
  })
}


// 导出题库
export function getStr(query) {
  return request({
    url: '/exam/bank/getstr',
    method: 'get',
    params: query
  })
}