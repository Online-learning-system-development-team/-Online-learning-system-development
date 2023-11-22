import request from '@/utils/request'

// 查询美宜佳现有库存列表
export function listInventory(query) {
  return request({
    url: '/meiyijia/inventory/list',
    method: 'get',
    params: query
  })

}