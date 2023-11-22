import request from '@/utils/request'

// 查询账户消费列表
export function listDetail(query) {
  return request({
    url: '/bookkeepping/detail/list',
    method: 'get',
    params: query
  })
}

// 查询账户消费详细
export function getDetail(id) {
  return request({
    url: '/bookkeepping/detail/' + id,
    method: 'get'
  })
}

// 新增账户消费
export function addDetail(data) {
  return request({
    url: '/bookkeepping/detail',
    method: 'post',
    data: data
  })
}

// 修改账户消费
export function updateDetail(data) {
  return request({
    url: '/bookkeepping/detail',
    method: 'put',
    data: data
  })
}

// 删除账户消费
export function delDetail(id) {
  return request({
    url: '/bookkeepping/detail/' + id,
    method: 'delete'
  })
}

// 导出账户消费
export function exportDetail(query) {
  return request({
    url: '/bookkeepping/detail/export',
    method: 'get',
    params: query
  })
}