package com.ruoyi.framework.aspectj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.annotation.LogAop;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysOperLog;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * @description: 对于每个标注了@LOGAOP注解的方法的切面
 */
@Aspect
@Component
@Slf4j
public class MthodAop {

    @Before(value = "@annotation(methodLog)")
    public void beforeLogMethod(JoinPoint joinPoint , LogAop methodLog)  {
        log.info("---------------Method Start："+joinPoint.getSignature().getDeclaringTypeName()+"."+joinPoint.getSignature().getName()+"-------------------");

        //日志记录
        log.info(methodLog.toString());

        log.info("Method Args："+ JSONObject.toJSONString(joinPoint.getArgs()));


        //执行原来的方法
        String key = joinPoint.getSignature().toString();
    }

    @AfterReturning(value = "@annotation(methodLog)",returning = "ret")
    public void afterLogMethod(JoinPoint joinPoint , LogAop methodLog,Object ret)  {

        //日志记录
        log.info("---------------------Method End："+joinPoint.getSignature().getDeclaringTypeName()+"."+joinPoint.getSignature().getName()+"--------------------");
        log.info("Method Return Type:" + ret.getClass());
        log.info("Method Return Value:" + ret);
    }



}
