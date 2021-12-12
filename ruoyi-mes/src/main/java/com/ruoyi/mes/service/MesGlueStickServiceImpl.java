package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesGlueStick;
import com.ruoyi.mes.mapper.MesGlueStickMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DaiChao
 */
@Service
public class MesGlueStickServiceImpl extends ServiceImpl<MesGlueStickMapper, MesGlueStick> implements IService<MesGlueStick> {

    @Resource
    private MesGlueStickMapper mesGlueStickMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesGlueStickMapper.deleteByPrimaryKey(id);
    }


    public int insert(MesGlueStick record) {
        return mesGlueStickMapper.insert(record);
    }


    public int insertSelective(MesGlueStick record) {
        return mesGlueStickMapper.insertSelective(record);
    }


    public MesGlueStick selectByPrimaryKey(Long id) {
        return mesGlueStickMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesGlueStick record) {
        return mesGlueStickMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesGlueStick record) {
        return mesGlueStickMapper.updateByPrimaryKey(record);
    }

}
