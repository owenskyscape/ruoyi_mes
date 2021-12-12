
package com.ruoyi.common.utils.sql;

import com.google.common.collect.Lists;

import java.util.List;

/**
 * @author DaiChao
 * @version V1.0
 * @title: SqlFilter.java
 * @description: 注解类
 * <p>
 * Copyright(C) 2018-2019    NPlus
 * Company:   DC
 * @date: 15:31 2018/10/16
 * <p>
 * 修改历史:
 * Date                 Author        Version        Description
 * -----------------------------------------------------------------------------------
 * 2018/10/16      DaiChao        1.0            初始化版本
 */
public class SqlFilter {
    public static final String AND = "and";
    public static final String OR = "or";
    public static final String NOT = "not";

    public static final String EQ = "=";
    public static final String GT = ">";
    public static final String GE = ">=";
    public static final String LT = "<";
    public static final String LE = "<=";
    public static final String NE = "<>";
    public static final String BETWEEN = "between";
    public static final String LIKE = "like";
    public static final String IN = "in";
    public static final String ISNULL = "is null";
    public static final String ISNOTNUL = "is not null";
    public static final String DESC = "DESC";
    public static final String ASC = "ASC";

    private static final long serialVersionUID = 2597542579940194909L;

    private List<QueryParam> queryParams;

    private List<SqlOrder> sqlOrders;

    private List<QueryParam> orParams;


    public List<QueryParam> getQueryParams() {
        return queryParams;
    }

    public List<SqlOrder> getSqlOrders() {
        return sqlOrders;
    }

    public List<QueryParam> getOrParams() {
        return orParams;
    }

    /**
     * 添加查询条件
     *
     * @param name
     * @param sqlExpression
     * @param value
     */
    public void addQueryParams(String name, String sqlExpression, Object value) {
        if (null == this.queryParams) {
            this.queryParams = Lists.newArrayListWithExpectedSize(10);
        }
        QueryParam queryParam = getQueryParam(name, sqlExpression, value);
        this.queryParams.add(queryParam);
    }

    private QueryParam getQueryParam(String name, String sqlExpression, Object value) {
        QueryParam queryParam = new QueryParam();
        queryParam.setName(name);
        queryParam.setSqlExpression(sqlExpression);
        if (null != value && value.getClass().isArray()) {
            queryParam.setValue((Object[]) value);
        } else {
            queryParam.setValue(new Object[]{value});
        }
        return queryParam;
    }

    /**
     * 添加查询条件
     *
     * @param name
     * @param sqlExpression
     * @param value
     */
    public void addOrQueryParams(String operation, String name, String sqlExpression, Object value) {
        if (null == this.orParams) {
            this.orParams = Lists.newArrayListWithExpectedSize(10);
        }
        QueryParam queryParam = getQueryParam(name, sqlExpression, value);
        queryParam.setOperation(operation);
        this.orParams.add(queryParam);
    }

    /**
     * 添加排序条件
     *
     * @param name
     * @param orderExpression
     */
    public void addSqlOrder(String name, String orderExpression) {
        if (null == this.sqlOrders) {
            this.sqlOrders = Lists.newArrayListWithExpectedSize(10);
        }
        SqlOrder sqlOrder = new SqlOrder();
        sqlOrder.setName(name);
        sqlOrder.setOrderExpression(orderExpression);
        sqlOrders.add(sqlOrder);
    }

    public SqlFilter() {

    }

    public SqlFilter(List<QueryParam> queryParams, List<SqlOrder> sqlOrders) {
        this.queryParams = queryParams;
        this.sqlOrders = sqlOrders;
    }

    public StringBuilder getWhereHql() {
        StringBuilder whereHql = new StringBuilder(" where 1=1 ");
        for (QueryParam queryParam : queryParams) {
            whereHql.append(" and ").
                    append(queryParam.getName()).
                    append(" ");
            if (SqlFilter.IN.equals(queryParam.getSqlExpression())) {
                whereHql.append(queryParam.getSqlExpression()).
                        append("(:").
                        append(queryParam.getName()).append(")");
            } else {
                whereHql.append(queryParam.getSqlExpression()).
                        append(":").
                        append(queryParam.getName());
            }
        }
        return whereHql;
    }
}
