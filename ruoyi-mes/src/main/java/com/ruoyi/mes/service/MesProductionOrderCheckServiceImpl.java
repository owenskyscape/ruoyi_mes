package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesProductionOrderCheck;
import com.ruoyi.mes.mapper.MesProductionOrderCheckMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DaiChao
 */
@Service
public class MesProductionOrderCheckServiceImpl extends ServiceImpl<MesProductionOrderCheckMapper, MesProductionOrderCheck> implements IService<MesProductionOrderCheck> {

    @Resource
    private MesProductionOrderCheckMapper mesProductionOrderCheckMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesProductionOrderCheckMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesProductionOrderCheck record) {
        return mesProductionOrderCheckMapper.insertSelective(record);
    }


    public MesProductionOrderCheck selectByPrimaryKey(Long id) {
        return mesProductionOrderCheckMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesProductionOrderCheck record) {
        return mesProductionOrderCheckMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesProductionOrderCheck record) {
        return mesProductionOrderCheckMapper.updateByPrimaryKey(record);
    }

}
