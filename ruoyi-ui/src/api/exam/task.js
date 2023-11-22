import request from '@/utils/request'

// 查询考试任务列表
export function listTask(query) {
  return request({
    url: '/exam/task/list',
    method: 'get',
    params: query
  })
}

// 查询考试任务详细
export function getTask(id) {
  return request({
    url: '/exam/task/' + id,
    method: 'get'
  })
}

// 新增考试任务
export function addTask(data) {
  return request({
    url: '/exam/task',
    method: 'post',
    data: data
  })
}

// 修改考试任务
export function updateTask(data) {
  return request({
    url: '/exam/task',
    method: 'put',
    data: data
  })
}

// 删除考试任务
export function delTask(id) {
  return request({
    url: '/exam/task/' + id,
    method: 'delete'
  })
}

// 导出考试任务
export function exportTask(query) {
  return request({
    url: '/exam/task/export',
    method: 'get',
    params: query
  })
}