package com.ruoyi.mes.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.mes.domain.MesMatchingpost;
import com.ruoyi.mes.mapper.MesMatchingpostMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DaiChao
 */
@Service
public class MesMatchingpostServiceImpl extends ServiceImpl<MesMatchingpostMapper, MesMatchingpost> implements IService<MesMatchingpost> {

    @Resource
    private MesMatchingpostMapper mesMatchingpostMapper;


    public int deleteByPrimaryKey(Long id) {
        return mesMatchingpostMapper.deleteByPrimaryKey(id);
    }


    public int insertSelective(MesMatchingpost record) {
        return mesMatchingpostMapper.insertSelective(record);
    }


    public MesMatchingpost selectByPrimaryKey(Long id) {
        return mesMatchingpostMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(MesMatchingpost record) {
        return mesMatchingpostMapper.updateByPrimaryKeySelective(record);
    }


    public int updateByPrimaryKey(MesMatchingpost record) {
        return mesMatchingpostMapper.updateByPrimaryKey(record);
    }

}
