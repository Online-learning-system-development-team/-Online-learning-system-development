import request from '@/utils/request'

// 查询用户答题列表
export function listAnswer(query) {
    return request({
        url: '/exam/userAnswer/list',
        method: 'get',
        params: query
    })
}

// 查询用户答题详细
export function getAnswer(id) {
    return request({
        url: '/exam/userAnswer/' + id,
        method: 'get'
    })
}

// 新增用户答题
export function addAnswer(data) {
    return request({
        url: '/exam/userAnswer',
        method: 'post',
        data: data
    })
}

// 修改用户答题
export function updateAnswer(data) {
    return request({
        url: '/exam/userAnswer',
        method: 'put',
        data: data
    })
}

// 删除用户答题
export function delAnswer(id) {
    return request({
        url: '/exam/userAnswer/' + id,
        method: 'delete'
    })
}

// 导出用户答题
export function exportAnswer(query) {
    return request({
        url: '/exam/userAnswer/export',
        method: 'get',
        params: query
    })
}

export function addUserAnswer(query) {
    return request({
        url: '/exam/userAnswer/addUserAnswer',
        method: 'POST',
        data: query
    })
}

export function getUserAnswer(query) {
    return request({
        url: '/exam/userAnswer/getUserAnswer',
        method: 'POST',
        data: query
    })
}