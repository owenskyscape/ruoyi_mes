/**
 * @Version V1.0
 * @Title: MesProductionOrderController.java
 * @Description:
 * @Author: DaiChao
 * <p>
 * Copyright(C) 2018-2019  NPlus
 * Company:   无锡核心信息科技有限公司
 * @Date: 2021/12/12 15:39
 * <p>
 * 修改历史:
 * Date                 Author        Version        Discription
 * -----------------------------------------------------------------------------------
 * 2021/12/12           DaiChao      1.0            初始化版本
 */
package com.ruoyi.web.controller.mes;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.BeanUtil;
import com.ruoyi.common.utils.sql.MyBatisUtil;
import com.ruoyi.mes.domain.MesProductionOrder;
import com.ruoyi.mes.service.MesProductionOrderServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/mes")
@Api(value = "生产指令")
public class MesProductionOrderController {

    @Autowired
    private MesProductionOrderServiceImpl mesProductionOrderServiceImpl;

    /**
     * 分页查询
     *
     * @return
     */
    @ApiOperation(value = "分页查询")
    @GetMapping("/production/order/")
    public AjaxResult findPage(@RequestParam(value = "filter", required = false, defaultValue = "") String filter, @RequestParam(value = "sort", required = false, defaultValue = "") String sort, @RequestParam(value = "page", required = false, defaultValue = "1") int page, @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {

        QueryWrapper<MesProductionOrder> queryWrapper = MyBatisUtil.getQueryWrap(filter, sort);

        IPage<MesProductionOrder> pageData = new Page<>(page, pageSize);
        pageData = mesProductionOrderServiceImpl.page(pageData, queryWrapper);
        return AjaxResult.success(pageData);
    }

    /**
     * 保存
     *
     * @return
     */
    @ApiOperation(value = "保存")
    @PostMapping(value = "/production/order/")
    public AjaxResult save(@RequestBody MesProductionOrder mesProductionOrder) {
        mesProductionOrderServiceImpl.save(mesProductionOrder);
        return AjaxResult.success(mesProductionOrder);
    }

    /**
     * 单一查询
     *
     * @return
     */
    @ApiOperation(value = "单一查询")
    @GetMapping(value = "/production/order/{orderId}")
    public AjaxResult getById(@PathVariable(value = "orderId") Long id) {
        MesProductionOrder mesProductionOrder = mesProductionOrderServiceImpl.getById(id);
        return AjaxResult.success(mesProductionOrder);
    }

    /**
     * 更新
     *
     * @return
     */
    @ApiOperation(value = "更新")
    @PutMapping(value = "/production/order/{orderId}")
    public AjaxResult getById(@PathVariable(value = "orderId") Long id,
                              @RequestBody MesProductionOrder mesProductionOrder) {
        MesProductionOrder old = mesProductionOrderServiceImpl.getById(id);
        BeanUtil.copy(old, mesProductionOrder, null);
        mesProductionOrderServiceImpl.updateById(old);
        return AjaxResult.success(mesProductionOrder);
    }

    /**
     * 单一查询
     *
     * @return
     */
    @ApiOperation(value = "删除")
    @DeleteMapping(value = "/production/order/{orderId}")
    public AjaxResult deleteById(@PathVariable(value = "orderId") Long id) {
        mesProductionOrderServiceImpl.removeById(id);
        return AjaxResult.success(id);
    }

}