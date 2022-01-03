package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesExwarehousingInfoMapper;
import com.ruoyi.mes.domain.MesExwarehousingInfo;
import com.ruoyi.mes.service.IMesExwarehousingInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 出库信息Service业务层处理
 * 
 * @author owen
 * @date 2022-01-03
 */
@Service
public class MesExwarehousingInfoServiceImpl implements IMesExwarehousingInfoService 
{
    @Autowired
    private MesExwarehousingInfoMapper mesExwarehousingInfoMapper;

    /**
     * 查询出库信息
     * 
     * @param id 出库信息主键
     * @return 出库信息
     */
    @Override
    public MesExwarehousingInfo selectMesExwarehousingInfoById(Long id)
    {
        return mesExwarehousingInfoMapper.selectMesExwarehousingInfoById(id);
    }

    /**
     * 查询出库信息列表
     * 
     * @param mesExwarehousingInfo 出库信息
     * @return 出库信息
     */
    @Override
    public List<MesExwarehousingInfo> selectMesExwarehousingInfoList(MesExwarehousingInfo mesExwarehousingInfo)
    {
        return mesExwarehousingInfoMapper.selectMesExwarehousingInfoList(mesExwarehousingInfo);
    }

    /**
     * 新增出库信息
     * 
     * @param mesExwarehousingInfo 出库信息
     * @return 结果
     */
    @Override
    public int insertMesExwarehousingInfo(MesExwarehousingInfo mesExwarehousingInfo)
    {
        return mesExwarehousingInfoMapper.insertMesExwarehousingInfo(mesExwarehousingInfo);
    }

    /**
     * 修改出库信息
     * 
     * @param mesExwarehousingInfo 出库信息
     * @return 结果
     */
    @Override
    public int updateMesExwarehousingInfo(MesExwarehousingInfo mesExwarehousingInfo)
    {
        return mesExwarehousingInfoMapper.updateMesExwarehousingInfo(mesExwarehousingInfo);
    }

    /**
     * 批量删除出库信息
     * 
     * @param ids 需要删除的出库信息主键
     * @return 结果
     */
    @Override
    public int deleteMesExwarehousingInfoByIds(String ids)
    {
        return mesExwarehousingInfoMapper.deleteMesExwarehousingInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除出库信息信息
     * 
     * @param id 出库信息主键
     * @return 结果
     */
    @Override
    public int deleteMesExwarehousingInfoById(Long id)
    {
        return mesExwarehousingInfoMapper.deleteMesExwarehousingInfoById(id);
    }
}
