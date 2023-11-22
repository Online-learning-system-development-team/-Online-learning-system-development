package com.ruoyi.common.core.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * @version V1.0
 * @Package com.ruoyi.common.core.domain
 * @ClassName IBaseEntity
 * @Description TODO
 * @Author 王振鹏
 * @date 2021/11/26 22:48
 **/



        import com.baomidou.mybatisplus.annotation.IdType;
        import com.baomidou.mybatisplus.annotation.TableId;
        import com.fasterxml.jackson.annotation.JsonFormat;
        import org.springframework.format.annotation.DateTimeFormat;

        import java.io.Serializable;
        import java.util.Date;


public class IBaseEntity implements Serializable {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private String id;
    /**
     * 创建人
     */
    private String createUser;
    /**
     * 创建时间
     */
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;
    /**
     * 更新人
     */
    private String modifyUser;
    /**
     * 更新时间
     */
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date modifyTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCreateUser() {
        return createUser;
    }

    public IBaseEntity setCreateUser(String createUser) {
        this.createUser = createUser;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public IBaseEntity setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public String getModifyUser() {
        return modifyUser;
    }

    public IBaseEntity setModifyUser(String modifyUser) {
        this.modifyUser = modifyUser;
        return this;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public IBaseEntity setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
        return this;
    }
}

