import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listLabel(query) {
  return request({
    url: '/bookkeepping/label/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getLabel(id) {
  return request({
    url: '/bookkeepping/label/' + id,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addLabel(data) {
  return request({
    url: '/bookkeepping/label',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateLabel(data) {
  return request({
    url: '/bookkeepping/label',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delLabel(id) {
  return request({
    url: '/bookkeepping/label/' + id,
    method: 'delete'
  })
}

// 导出【请填写功能名称】
export function exportLabel(query) {
  return request({
    url: '/bookkeepping/label/export',
    method: 'get',
    params: query
  })
}