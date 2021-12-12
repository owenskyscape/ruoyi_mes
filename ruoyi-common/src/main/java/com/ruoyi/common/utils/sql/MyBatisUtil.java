package com.ruoyi.common.utils.sql;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.common.base.CaseFormat;
import com.ruoyi.common.utils.JsonUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.util.HtmlUtils;

import java.util.ArrayList;
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
@Slf4j
public class MyBatisUtil {

    public static QueryWrapper getQueryWrap(String filter, String sort) {
        try {
            List<QueryParam> queryParams = new ArrayList<>();
            List<SqlOrder> sqlOrders = new ArrayList<>();
            if (StringUtils.isNotBlank(filter)) {
                filter = HtmlUtils.htmlUnescape(filter);
                queryParams = JsonUtils.toList(filter, QueryParam.class);
            }
            if (StringUtils.isNotBlank(sort)) {
                sort = HtmlUtils.htmlUnescape(sort);
                sqlOrders = JsonUtils.toList(sort, SqlOrder.class);
            }
            SqlFilter sqlFilter = new SqlFilter(queryParams, sqlOrders);
            return getQueryWrap(sqlFilter);
        } catch (Exception e) {
            log.error("转换异常");
        }

        return null;
    }


    public static QueryWrapper getQueryWrap(SqlFilter sqlFilter) {
        QueryWrapper<?> queryWrapper = new QueryWrapper<>();
        for (QueryParam queryParam : sqlFilter.getQueryParams()) {
            Object[] values = queryParam.getValue();
            String expression = queryParam.getSqlExpression();
            String field = CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, queryParam.getName());
            switch (expression) {
                case SqlFilter.EQ:
                    queryWrapper = queryWrapper.eq(field, values[0]);
                    break;
                case SqlFilter.LIKE:
                    queryWrapper = queryWrapper.like(field, values[0]);
                    break;
                case SqlFilter.IN:
                    queryWrapper = queryWrapper.in(field, values);
                    break;
                case SqlFilter.GE:
                    queryWrapper = queryWrapper.ge(field, values[0]);
                    break;
                case SqlFilter.GT:
                    queryWrapper = queryWrapper.gt(field, values[0]);
                    break;
                case SqlFilter.LT:
                    queryWrapper = queryWrapper.lt(field, values[0]);
                    break;
                case SqlFilter.LE:
                    queryWrapper = queryWrapper.le(field, values[0]);
                    break;
                case SqlFilter.NE:
                    queryWrapper = queryWrapper.ne(field, values[0]);
                    break;
                case SqlFilter.BETWEEN:
                    queryWrapper = queryWrapper.between(field, values[0], values[1]);
                    break;
                case SqlFilter.ISNULL:
                    queryWrapper = queryWrapper.isNull(field);
                    break;
                case SqlFilter.ISNOTNUL:
                    queryWrapper = queryWrapper.isNotNull(field);
                    break;
                default:
                    throw new RuntimeException("无法解析expression");
            }
        }

        List<SqlOrder> orders = sqlFilter.getSqlOrders();
        if (CollectionUtils.isNotEmpty(orders)) {
            for (SqlOrder sqlOrder : orders) {
                String field = CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, sqlOrder.getName());
                switch (sqlOrder.getOrderExpression()) {
                    case SqlFilter.DESC:
                        queryWrapper = queryWrapper.orderByDesc(field);
                        break;
                    case SqlFilter.ASC:
                        queryWrapper = queryWrapper.orderByAsc(field);
                        break;
                    default:
                        throw new RuntimeException("无法解析expression");
                }
            }
        }

        return queryWrapper;
    }
}
