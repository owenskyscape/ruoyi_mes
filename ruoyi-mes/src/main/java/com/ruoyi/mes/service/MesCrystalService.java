package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesCrystal;
import com.ruoyi.mes.mapper.MesCrystalMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MesCrystalService extends ServiceImpl<MesCrystalMapper, MesCrystal> implements IService<MesCrystal> {

    @Resource
    private MesCrystalMapper mesCrystalMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesCrystalMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesCrystal record) {
        return mesCrystalMapper.insertSelective(record);
    }


    public MesCrystal selectByPrimaryKey(Long id) {
        return mesCrystalMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesCrystal record) {
        return mesCrystalMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesCrystal record) {
        return mesCrystalMapper.updateByPrimaryKey(record);
    }

}
