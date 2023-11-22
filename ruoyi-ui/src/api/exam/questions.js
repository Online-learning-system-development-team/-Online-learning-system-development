import request from '@/utils/request'

// 查询试题列表
export function listQuestions(query) {
    return request({
        url: '/exam/questions/list',
        method: 'get',
        params: query
    })
}



// 查询试题列表
export function listAndOptions(query) {
  return request({
    url: '/exam/questions/listAndOptions',
    method: 'get',
    params: query
  })
}

// 查询试题详细
export function getQuestions(id) {
    return request({
        url: '/exam/questions/' + id,
        method: 'get'
    })
}

// 新增试题
export function addQuestions(data) {
    return request({
        url: '/exam/questions',
        method: 'post',
        data: data
    })
}
// 添加试题
export function insertQuestions(data) {
    return request({
        url: '/exam/questions/insert',
        method: 'post',
        data: data
    })
}

// 批量导入试题
export function insertBtachQuestions(data) {
    return request({
        url: '/exam/questions/insertBatch',
        method: 'post',
        data: data
    })
}


// 修改试题
export function updateQuestions(data) {
    return request({
        url: '/exam/questions',
        method: 'put',
        data: data
    })
}

// 删除试题
export function delQuestions(id) {
    return request({
        url: '/exam/questions/' + id,
        method: 'delete'
    })
}


// 删除试题
export function delQuestionByid(id) {
    return request({
        url: '/exam/questions/byId/' + id,
        method: 'delete'
    })
}

// 导出试题
export function exportQuestions(query) {
    return request({
        url: '/exam/questions/export',
        method: 'get',
        params: query
    })
}

// 删除文件
export function deleteFile(query) {
    return request({
        url: '/common/delete',
        method: 'get',
        params: query
    })
}