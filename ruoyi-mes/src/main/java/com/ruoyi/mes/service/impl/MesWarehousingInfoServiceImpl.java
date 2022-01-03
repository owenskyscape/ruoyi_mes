package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesWarehousingInfoMapper;
import com.ruoyi.mes.domain.MesWarehousingInfo;
import com.ruoyi.mes.service.IMesWarehousingInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 入库信息Service业务层处理
 * 
 * @author owen
 * @date 2022-01-03
 */
@Service
public class MesWarehousingInfoServiceImpl implements IMesWarehousingInfoService 
{
    @Autowired
    private MesWarehousingInfoMapper mesWarehousingInfoMapper;

    /**
     * 查询入库信息
     * 
     * @param id 入库信息主键
     * @return 入库信息
     */
    @Override
    public MesWarehousingInfo selectMesWarehousingInfoById(Long id)
    {
        return mesWarehousingInfoMapper.selectMesWarehousingInfoById(id);
    }

    /**
     * 查询入库信息列表
     * 
     * @param mesWarehousingInfo 入库信息
     * @return 入库信息
     */
    @Override
    public List<MesWarehousingInfo> selectMesWarehousingInfoList(MesWarehousingInfo mesWarehousingInfo)
    {
        return mesWarehousingInfoMapper.selectMesWarehousingInfoList(mesWarehousingInfo);
    }

    /**
     * 新增入库信息
     * 
     * @param mesWarehousingInfo 入库信息
     * @return 结果
     */
    @Override
    public int insertMesWarehousingInfo(MesWarehousingInfo mesWarehousingInfo)
    {
        return mesWarehousingInfoMapper.insertMesWarehousingInfo(mesWarehousingInfo);
    }

    /**
     * 修改入库信息
     * 
     * @param mesWarehousingInfo 入库信息
     * @return 结果
     */
    @Override
    public int updateMesWarehousingInfo(MesWarehousingInfo mesWarehousingInfo)
    {
        return mesWarehousingInfoMapper.updateMesWarehousingInfo(mesWarehousingInfo);
    }

    /**
     * 批量删除入库信息
     * 
     * @param ids 需要删除的入库信息主键
     * @return 结果
     */
    @Override
    public int deleteMesWarehousingInfoByIds(String ids)
    {
        return mesWarehousingInfoMapper.deleteMesWarehousingInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除入库信息信息
     * 
     * @param id 入库信息主键
     * @return 结果
     */
    @Override
    public int deleteMesWarehousingInfoById(Long id)
    {
        return mesWarehousingInfoMapper.deleteMesWarehousingInfoById(id);
    }
}
