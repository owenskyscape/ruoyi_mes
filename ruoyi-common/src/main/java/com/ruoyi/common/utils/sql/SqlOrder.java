package com.ruoyi.common.utils.sql;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: DaiChao
 * Created by DaiChao on 2018/10/17.
 * Created with IntelliJ IDEA.
 * Date: 2018/10/17
 * Time: 23:45
 * ClassName: SqlOrder
 * Description:
 */
@Data
public class SqlOrder implements Serializable {

    private static final long serialVersionUID = -513338656135916167L;

    private String name;

    private String orderExpression;
}
