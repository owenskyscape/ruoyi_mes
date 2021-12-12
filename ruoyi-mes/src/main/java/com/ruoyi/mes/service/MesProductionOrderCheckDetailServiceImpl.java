package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesProductionOrderCheckDetail;
import com.ruoyi.mes.mapper.MesProductionOrderCheckDetailMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DaiChao
 */
@Service
public class MesProductionOrderCheckDetailServiceImpl extends
        ServiceImpl<MesProductionOrderCheckDetailMapper, MesProductionOrderCheckDetail>
        implements IService<MesProductionOrderCheckDetail> {

    @Resource
    private MesProductionOrderCheckDetailMapper mesProductionOrderCheckDetailMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesProductionOrderCheckDetailMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesProductionOrderCheckDetail record) {
        return mesProductionOrderCheckDetailMapper.insertSelective(record);
    }


    public MesProductionOrderCheckDetail selectByPrimaryKey(Long id) {
        return mesProductionOrderCheckDetailMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesProductionOrderCheckDetail record) {
        return mesProductionOrderCheckDetailMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesProductionOrderCheckDetail record) {
        return mesProductionOrderCheckDetailMapper.updateByPrimaryKey(record);
    }

}
