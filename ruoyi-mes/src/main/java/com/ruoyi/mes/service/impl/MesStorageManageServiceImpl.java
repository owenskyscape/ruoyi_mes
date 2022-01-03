package com.ruoyi.mes.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.mes.domain.MesStorageManage;
import com.ruoyi.mes.mapper.MesStorageManageMapper;
import com.ruoyi.mes.service.IMesStorageManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 库位管理Service业务层处理
 * 
 * @author owen
 * @date 2021-12-27
 */
@Service
public class MesStorageManageServiceImpl implements IMesStorageManageService 
{
    @Autowired
    private MesStorageManageMapper mesStorageManageMapper;

    /**
     * 查询库位管理
     * 
     * @param id 库位管理主键
     * @return 库位管理
     */
    @Override
    public MesStorageManage selectMesStorageManageById(Long id)
    {
        return mesStorageManageMapper.selectMesStorageManageById(id);
    }

    /**
     * 查询库位管理列表
     * 
     * @param mesStorageManage 库位管理
     * @return 库位管理
     */
    @Override
    public List<MesStorageManage> selectMesStorageManageList(MesStorageManage mesStorageManage)
    {
        return mesStorageManageMapper.selectMesStorageManageList(mesStorageManage);
    }

    /**
     * 新增库位管理
     * 
     * @param mesStorageManage 库位管理
     * @return 结果
     */
    @Override
    public int insertMesStorageManage(MesStorageManage mesStorageManage)
    {
        return mesStorageManageMapper.insertMesStorageManage(mesStorageManage);
    }

    /**
     * 修改库位管理
     * 
     * @param mesStorageManage 库位管理
     * @return 结果
     */
    @Override
    public int updateMesStorageManage(MesStorageManage mesStorageManage)
    {
        return mesStorageManageMapper.updateMesStorageManage(mesStorageManage);
    }

    /**
     * 批量删除库位管理
     * 
     * @param ids 需要删除的库位管理主键
     * @return 结果
     */
    @Override
    public int deleteMesStorageManageByIds(String ids)
    {
        return mesStorageManageMapper.deleteMesStorageManageByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除库位管理信息
     * 
     * @param id 库位管理主键
     * @return 结果
     */
    @Override
    public int deleteMesStorageManageById(Long id)
    {
        return mesStorageManageMapper.deleteMesStorageManageById(id);
    }
}
