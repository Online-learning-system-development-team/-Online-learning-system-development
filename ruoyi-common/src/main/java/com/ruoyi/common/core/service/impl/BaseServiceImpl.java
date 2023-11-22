package com.ruoyi.common.core.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.IBaseEntity;
import com.ruoyi.common.core.service.IBaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
/**
 * @version V1.0
 * @Package com.ruoyi.common.core.service.impl
 * @ClassName BaseServiceImpl
 * @Description  Service公共层
 **/
@Slf4j
@Validated
public class BaseServiceImpl<M extends BaseMapper<T>, T extends IBaseEntity> extends ServiceImpl<M, T> implements IBaseService<T> {

    /**
     * 获取当前登入用户
     */
    public static String getUsername() {
        try {
            RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) attributes;
            HttpSession session = servletRequestAttributes.getRequest().getSession();
            return String.valueOf(session.getAttribute("displayName").toString());
        } catch (Exception e) {
            log.info("为获取到对应的操作用户,此处预留系统名称");
            return "system";
        }
    }

    /**
     * 得到泛型类T
     */
    private Class<T> getMyClass() {
        Type type = getClass().getGenericSuperclass();
        // 判断 是否泛型
        if (type instanceof ParameterizedType) {
            Type[] typeArray = ((ParameterizedType) type).getActualTypeArguments();
            return (Class) typeArray[1];
        } else {
            throw new RuntimeException("没有找到泛型,请检查代码");
        }
    }

    /**
     * 逻辑删除(支持批量删除)
     */
    @Override
    public int logicDelete(String ids) {
        Class<T> clazz = getMyClass();
        Field[] fields = clazz.getDeclaredFields();
        List<Field> isDeleted = Arrays.stream(fields).filter(item -> "isDeleted".equals(item.getName())).collect(Collectors.toList());
        if (isDeleted.size() == 0) {
            throw new RuntimeException("该实体类不存在逻辑删除字段");
        }
        String[] split = ids.split(",");
        UpdateWrapper<T> updateWrapper = new UpdateWrapper<T>();
        updateWrapper.set("is_deleted", true);
        updateWrapper.set("modify_user", getUsername());
        updateWrapper.set("modify_time", new Date());
        updateWrapper.in("id", split);
        this.update(updateWrapper);
        return split.length;
    }

    /**
     * 修改
     */
    @Override
    public Boolean edit(T entity) {
        String username = getUsername();
        entity.setModifyUser(username);
        entity.setModifyTime(new Date());
        return this.updateById(entity);
    }

    /**
     * 新增
     */
    @Override
    public Boolean add(T entity) {
        String username = getUsername();
        entity.setCreateUser(username);
        entity.setCreateTime(new Date());
        entity.setModifyUser(username);
        entity.setModifyTime(new Date());
        return this.save(entity);
    }


    /**
     * 批量新增
     */
    @Override
    public Boolean addBatch(Collection<T> entitys) {
        for (T entity : entitys) {
            String username = getUsername();
            entity.setCreateUser(username);
            entity.setCreateTime(new Date());
            entity.setModifyUser(username);
            entity.setModifyTime(new Date());
        }
        return this.saveBatch(entitys);
    }


    /**
     * 修改并校验数据
     */
    @Override
    public <C> Boolean editVerify(@Valid C c) {
        Class<T> clazz = getMyClass();
        String username = getUsername();
        try {
            T entity = clazz.newInstance();
            BeanUtils.copyProperties(c, entity);
            entity.setModifyUser(username);
            entity.setModifyTime(new Date());
            return this.updateById(entity);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 新增并校验数据
     */
    @Override
    public <C> Boolean addVerify(@Valid C c) {
        Class<T> clazz = getMyClass();
        String username = getUsername();
        try {
            T entity = clazz.newInstance();
            BeanUtils.copyProperties(c, entity);
            entity.setCreateUser(username);
            entity.setCreateTime(new Date());
            entity.setModifyUser(username);
            entity.setModifyTime(new Date());
            return this.save(entity);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }
}
