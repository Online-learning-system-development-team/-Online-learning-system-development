package com.ruoyi.common.core.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.validation.annotation.Validated;

import javax.validation.Valid;
import java.util.Collection;

/**
 * @version V1.0
 * @Package com.ruoyi.common.core.service
 * @ClassName IBaseService
 * @Description TODO
 **/
@Validated
public interface IBaseService<T> extends IService<T> {

    /**
     * 逻辑删除
     */
    int logicDelete(String ids);

    /**
     * 修改
     */
    Boolean edit(T t);

    /**
     * 新增
     */
    Boolean add(T t);

    /**
     * 批量新增
     */
    Boolean addBatch(Collection<T> entitys);

    /**
     * 修改并校验数据
     */
    <C> Boolean editVerify(@Valid C c);

    /**
     * 新增并校验数据
     */
    <C> Boolean addVerify(@Valid C c);
}
