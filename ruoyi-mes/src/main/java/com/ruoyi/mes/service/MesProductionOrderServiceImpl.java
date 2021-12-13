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
package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesProductionOrder;
import com.ruoyi.mes.mapper.MesProductionOrderMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MesProductionOrderServiceImpl extends ServiceImpl<MesProductionOrderMapper, MesProductionOrder> implements IService<MesProductionOrder> {
    @Resource
    private MesProductionOrderMapper mesProductionOrderMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesProductionOrderMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesProductionOrder record) {
        return mesProductionOrderMapper.insertSelective(record);
    }


    public MesProductionOrder selectByPrimaryKey(Long id) {
        return mesProductionOrderMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesProductionOrder record) {
        return mesProductionOrderMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesProductionOrder record) {
        return mesProductionOrderMapper.updateByPrimaryKey(record);
    }


}