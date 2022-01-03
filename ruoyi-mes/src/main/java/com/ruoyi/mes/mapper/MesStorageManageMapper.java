package com.ruoyi.mes.mapper;

import com.ruoyi.mes.domain.MesStorageManage;

import java.util.List;

/**
 * 库位管理Mapper接口
 * 
 * @author owen
 * @date 2021-12-27
 */
public interface MesStorageManageMapper 
{
    /**
     * 查询库位管理
     * 
     * @param id 库位管理主键
     * @return 库位管理
     */
    public MesStorageManage selectMesStorageManageById(Long id);

    /**
     * 查询库位管理列表
     * 
     * @param mesStorageManage 库位管理
     * @return 库位管理集合
     */
    public List<MesStorageManage> selectMesStorageManageList(MesStorageManage mesStorageManage);

    /**
     * 新增库位管理
     * 
     * @param mesStorageManage 库位管理
     * @return 结果
     */
    public int insertMesStorageManage(MesStorageManage mesStorageManage);

    /**
     * 修改库位管理
     * 
     * @param mesStorageManage 库位管理
     * @return 结果
     */
    public int updateMesStorageManage(MesStorageManage mesStorageManage);

    /**
     * 删除库位管理
     * 
     * @param id 库位管理主键
     * @return 结果
     */
    public int deleteMesStorageManageById(Long id);

    /**
     * 批量删除库位管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesStorageManageByIds(String[] ids);
}
