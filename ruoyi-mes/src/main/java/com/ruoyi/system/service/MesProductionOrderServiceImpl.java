/**
 * @Version V1.0
 * @Title: MesProductionOrderServiceImpl.java
 * @Description:
 * @Author: DaiChao
 * <p>
 * Copyright(C) 2018-2019  NPlus
 * Company:   无锡核心信息科技有限公司
 * @Date: 2021/12/12 15:34
 * <p>
 * 修改历史:
 * Date                 Author        Version        Discription
 * -----------------------------------------------------------------------------------
 * 2021/12/12           DaiChao      1.0            初始化版本
 */
package com.ruoyi.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.system.domain.MesProductionOrder;
import com.ruoyi.system.mapper.MesProductionOrderMapper;
import org.springframework.stereotype.Service;

@Service
public class MesProductionOrderServiceImpl extends ServiceImpl<MesProductionOrderMapper, MesProductionOrder> implements IService<MesProductionOrder> {
}