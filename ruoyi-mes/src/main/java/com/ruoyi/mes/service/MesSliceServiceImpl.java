package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesSlice;
import com.ruoyi.mes.mapper.MesSliceMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DaiChao
 */
@Service
public class MesSliceServiceImpl extends ServiceImpl<MesSliceMapper, MesSlice> implements IService<MesSlice> {

    @Resource
    private MesSliceMapper mesSliceMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesSliceMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesSlice record) {
        return mesSliceMapper.insertSelective(record);
    }


    public MesSlice selectByPrimaryKey(Long id) {
        return mesSliceMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesSlice record) {
        return mesSliceMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesSlice record) {
        return mesSliceMapper.updateByPrimaryKey(record);
    }

}
