import request from '@/utils/request'

// 查询试卷列表
export function listPaper(query) {
  return request({
    url: '/exam/paper/list',
    method: 'get',
    params: query
  })
}
// 判断查询次数
export function answerFrequency(query) {
  return request({
    url: '/exam/paper/answerFrequency',
    method: 'get',
    params: query
  })
}


// 查询试卷详细
export function getPaper(id) {
  return request({
    url: '/exam/paper/' + id,
    method: 'get'
  })
}

// 根据试卷详情查询题目的数量
export function getCountByType(data) {
  return request({
    url: '/exam/questions/getCountByType',
    method: 'POST',
    data: data
  })
}

// 新增试卷
export function addPaper(data) {
  return request({
    url: '/exam/paper',
    method: 'post',
    data: data
  })
}

// 新增试卷
export function insertPaper(data) {
  return request({
    url: '/exam/paper/insert',
    method: 'post',
    data: data
  })
}

// 修改试卷
export function updatePaper(data) {
  return request({
    url: '/exam/paper',
    method: 'put',
    data: data
  })
}

// 删除试卷
export function delPaper(id) {
  return request({
    url: '/exam/paper/' + id,
    method: 'delete'
  })
}

// 导出试卷
export function exportPaper(query) {
  return request({
    url: '/exam/paper/export',
    method: 'get',
    params: query
  })
}
