/**
 * @title: BeanUtil.java
 * @description: 注解类
 * @author DaiChao
 * <p>
 * Copyright(C) 2018-2019    NPlus
 * Company:   DC
 * @version V1.0
 * @date: 9:32 2019/4/25
 * <p>
 * 修改历史:
 * Date          Author        Version        Description
 * -----------------------------------------------------------------------------------
 * 2019/4/25       DaiChao        1.0            初始化版本
 */
package com.ruoyi.common.utils;

import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
public class BeanUtil {
    /**
     *  source 复制给 target
     *
     * @param target    老对象
     * @param source    新对象
     * @param ignores 忽略字段
     */
    public static void copy(Object target, Object source, List<String> ignores) {
        Class<?> type = target.getClass();
        Class<?> type2 = source.getClass();
        List<Field> fields = new ArrayList<Field>();

        for (Class<?> clazz = target.getClass(); clazz != Object.class; clazz = clazz
                .getSuperclass()) {
            Collections.addAll(fields, clazz.getDeclaredFields());
        }

        String fname = null;
        Method getMethod = null;
        Method setMethod = null;
        Object value = null;
        for (Field field : fields) {
            try {
                fname = field.getName();
                if (ignores != null && ignores.contains(fname)) {
                    continue;
                }

                getMethod = type2.getMethod(
                        "get" + fname.substring(0, 1).toUpperCase()
                                + fname.substring(1));
                if (getMethod != null) {
                    value = getMethod.invoke(source);
                }

                if (value != null) {
                    setMethod = type.getMethod(
                            "set" + fname.substring(0, 1).toUpperCase()
                                    + fname.substring(1), field
                                    .getType());
                    setMethod.invoke(target, new Object[]{value});
                }
            } catch (NoSuchMethodException | IllegalAccessException | SecurityException | IllegalArgumentException | InvocationTargetException e) {
                log.warn(e.getLocalizedMessage());
            }
        }
    }
}
