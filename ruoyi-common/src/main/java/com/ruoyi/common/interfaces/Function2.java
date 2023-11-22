package com.ruoyi.common.interfaces;

/**
 * @description:
 */
@FunctionalInterface
public interface Function2 <A, B, R>  {

    public R apply (A a, B b,R r );

}
