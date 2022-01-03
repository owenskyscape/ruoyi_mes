package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.MesStorageInfo;

/**
 * 库存信息Mapper接口
 * 
 * @author owen
 * @date 2022-01-03
 */
public interface MesStorageInfoMapper 
{
    /**
     * 查询库存信息
     * 
     * @param id 库存信息主键
     * @return 库存信息
     */
    public MesStorageInfo selectMesStorageInfoById(Long id);

    /**
     * 查询库存信息列表
     * 
     * @param mesStorageInfo 库存信息
     * @return 库存信息集合
     */
    public List<MesStorageInfo> selectMesStorageInfoList(MesStorageInfo mesStorageInfo);

    /**
     * 新增库存信息
     * 
     * @param mesStorageInfo 库存信息
     * @return 结果
     */
    public int insertMesStorageInfo(MesStorageInfo mesStorageInfo);

    /**
     * 修改库存信息
     * 
     * @param mesStorageInfo 库存信息
     * @return 结果
     */
    public int updateMesStorageInfo(MesStorageInfo mesStorageInfo);

    /**
     * 删除库存信息
     * 
     * @param id 库存信息主键
     * @return 结果
     */
    public int deleteMesStorageInfoById(Long id);

    /**
     * 批量删除库存信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesStorageInfoByIds(String[] ids);
}
