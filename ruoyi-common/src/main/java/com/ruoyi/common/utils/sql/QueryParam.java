package com.ruoyi.common.utils.sql;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: DaiChao
 * Created by DaiChao on 2018/10/17.
 * Created with IntelliJ IDEA.
 * Date: 2018/10/17
 * Time: 23:37
 * ClassName: QueryParam
 * Description:
 */
@Data
public class QueryParam implements Serializable {
    private static final long serialVersionUID = -1611739016075825896L;

    /**
     * 实体类属性名
     */
    private String name;

    /**
     * SQL表达式
     */
    private String sqlExpression;
    /**
     * 值
     */
    private Object[] value;

    /**
     * and or
     */
    private String operation;
}
