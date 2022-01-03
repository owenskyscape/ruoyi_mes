package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesStorageInfoMapper;
import com.ruoyi.mes.domain.MesStorageInfo;
import com.ruoyi.mes.service.IMesStorageInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 库存信息Service业务层处理
 * 
 * @author owen
 * @date 2022-01-03
 */
@Service
public class MesStorageInfoServiceImpl implements IMesStorageInfoService 
{
    @Autowired
    private MesStorageInfoMapper mesStorageInfoMapper;

    /**
     * 查询库存信息
     * 
     * @param id 库存信息主键
     * @return 库存信息
     */
    @Override
    public MesStorageInfo selectMesStorageInfoById(Long id)
    {
        return mesStorageInfoMapper.selectMesStorageInfoById(id);
    }

    /**
     * 查询库存信息列表
     * 
     * @param mesStorageInfo 库存信息
     * @return 库存信息
     */
    @Override
    public List<MesStorageInfo> selectMesStorageInfoList(MesStorageInfo mesStorageInfo)
    {
        return mesStorageInfoMapper.selectMesStorageInfoList(mesStorageInfo);
    }

    /**
     * 新增库存信息
     * 
     * @param mesStorageInfo 库存信息
     * @return 结果
     */
    @Override
    public int insertMesStorageInfo(MesStorageInfo mesStorageInfo)
    {
        return mesStorageInfoMapper.insertMesStorageInfo(mesStorageInfo);
    }

    /**
     * 修改库存信息
     * 
     * @param mesStorageInfo 库存信息
     * @return 结果
     */
    @Override
    public int updateMesStorageInfo(MesStorageInfo mesStorageInfo)
    {
        return mesStorageInfoMapper.updateMesStorageInfo(mesStorageInfo);
    }

    /**
     * 批量删除库存信息
     * 
     * @param ids 需要删除的库存信息主键
     * @return 结果
     */
    @Override
    public int deleteMesStorageInfoByIds(String ids)
    {
        return mesStorageInfoMapper.deleteMesStorageInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除库存信息信息
     * 
     * @param id 库存信息主键
     * @return 结果
     */
    @Override
    public int deleteMesStorageInfoById(Long id)
    {
        return mesStorageInfoMapper.deleteMesStorageInfoById(id);
    }
}
