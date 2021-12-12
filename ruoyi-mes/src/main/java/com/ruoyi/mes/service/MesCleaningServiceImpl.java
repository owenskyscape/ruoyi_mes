package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesCleaning;
import com.ruoyi.mes.mapper.MesCleaningMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DaiChao
 */
@Service
public class MesCleaningServiceImpl extends ServiceImpl<MesCleaningMapper, MesCleaning> implements IService<MesCleaning> {

    @Resource
    private MesCleaningMapper mesCleaningMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesCleaningMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesCleaning record) {
        return mesCleaningMapper.insertSelective(record);
    }


    public MesCleaning selectByPrimaryKey(Long id) {
        return mesCleaningMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesCleaning record) {
        return mesCleaningMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesCleaning record) {
        return mesCleaningMapper.updateByPrimaryKey(record);
    }

}
