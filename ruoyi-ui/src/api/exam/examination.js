import request from '@/utils/request'

// 查询考试试卷的信息
export function paperQuestionList(query) {
    return request({
        url: '/exam/paper/paperQuestionList',
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