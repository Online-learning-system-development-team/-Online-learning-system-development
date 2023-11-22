import request from '@/utils/request'

// 查询标签列表
export function listLabel(query) {
  return request({
    url: '/exam/label/list',
    method: 'get',
    params: query
  })
}

// 查询标签列表
export function listLabelByQuestionId(questionId) {
  return request({
    url: '/exam/label/listByQuestionId/'+questionId,
    method: 'get'
  })
}

// 查询标签详细
export function getLabel(id) {
  return request({
    url: '/exam/label/' + id,
    method: 'get'
  })
}

// 新增标签
export function addLabel(data) {
  return request({
    url: '/exam/label',
    method: 'post',
    data: data
  })
}

// 修改标签
export function updateLabel(data) {
  return request({
    url: '/exam/label',
    method: 'put',
    data: data
  })
}

// 删除标签
export function delLabel(id) {
  return request({
    url: '/exam/label/' + id,
    method: 'delete'
  })
}

// 导出标签
export function exportLabel(query) {
  return request({
    url: '/exam/label/export',
    method: 'get',
    params: query
  })
}