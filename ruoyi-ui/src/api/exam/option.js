import request from '@/utils/request'

// 查询试题选项列表
export function listOption(query) {
  return request({
    url: '/exam/option/list',
    method: 'get',
    params: query
  })
}

// 查询试题选项详细
export function getOption(id) {
  return request({
    url: '/exam/option/' + id,
    method: 'get'
  })
}

// 新增试题选项
export function addOption(data) {
  return request({
    url: '/exam/option',
    method: 'post',
    data: data
  })
}

// 修改试题选项
export function updateOption(data) {
  return request({
    url: '/exam/option',
    method: 'put',
    data: data
  })
}

// 删除试题选项
export function delOption(id) {
  return request({
    url: '/exam/option/' + id,
    method: 'delete'
  })
}

// 导出试题选项
export function exportOption(query) {
  return request({
    url: '/exam/option/export',
    method: 'get',
    params: query
  })
}