package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesCrystalInfoMapper;
import com.ruoyi.mes.domain.MesCrystalInfo;
import com.ruoyi.mes.service.IMesCrystalInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 晶棒信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-24
 */
@Service
public class MesCrystalInfoServiceImpl implements IMesCrystalInfoService 
{
    @Autowired
    private MesCrystalInfoMapper mesCrystalInfoMapper;

    /**
     * 查询晶棒信息
     * 
     * @param id 晶棒信息主键
     * @return 晶棒信息
     */
    @Override
    public MesCrystalInfo selectMesCrystalInfoById(Long id)
    {
        return mesCrystalInfoMapper.selectMesCrystalInfoById(id);
    }

    /**
     * 查询晶棒信息列表
     * 
     * @param mesCrystalInfo 晶棒信息
     * @return 晶棒信息
     */
    @Override
    public List<MesCrystalInfo> selectMesCrystalInfoList(MesCrystalInfo mesCrystalInfo)
    {
        return mesCrystalInfoMapper.selectMesCrystalInfoList(mesCrystalInfo);
    }

    /**
     * 新增晶棒信息
     * 
     * @param mesCrystalInfo 晶棒信息
     * @return 结果
     */
    @Override
    public int insertMesCrystalInfo(MesCrystalInfo mesCrystalInfo)
    {
        return mesCrystalInfoMapper.insertMesCrystalInfo(mesCrystalInfo);
    }

    /**
     * 修改晶棒信息
     * 
     * @param mesCrystalInfo 晶棒信息
     * @return 结果
     */
    @Override
    public int updateMesCrystalInfo(MesCrystalInfo mesCrystalInfo)
    {
        return mesCrystalInfoMapper.updateMesCrystalInfo(mesCrystalInfo);
    }

    /**
     * 批量删除晶棒信息
     * 
     * @param ids 需要删除的晶棒信息主键
     * @return 结果
     */
    @Override
    public int deleteMesCrystalInfoByIds(String ids)
    {
        return mesCrystalInfoMapper.deleteMesCrystalInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除晶棒信息信息
     * 
     * @param id 晶棒信息主键
     * @return 结果
     */
    @Override
    public int deleteMesCrystalInfoById(Long id)
    {
        return mesCrystalInfoMapper.deleteMesCrystalInfoById(id);
    }
}
