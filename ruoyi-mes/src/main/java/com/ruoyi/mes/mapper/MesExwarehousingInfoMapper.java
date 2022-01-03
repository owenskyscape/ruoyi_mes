package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.MesExwarehousingInfo;

/**
 * 出库信息Mapper接口
 * 
 * @author owen
 * @date 2022-01-03
 */
public interface MesExwarehousingInfoMapper 
{
    /**
     * 查询出库信息
     * 
     * @param id 出库信息主键
     * @return 出库信息
     */
    public MesExwarehousingInfo selectMesExwarehousingInfoById(Long id);

    /**
     * 查询出库信息列表
     * 
     * @param mesExwarehousingInfo 出库信息
     * @return 出库信息集合
     */
    public List<MesExwarehousingInfo> selectMesExwarehousingInfoList(MesExwarehousingInfo mesExwarehousingInfo);

    /**
     * 新增出库信息
     * 
     * @param mesExwarehousingInfo 出库信息
     * @return 结果
     */
    public int insertMesExwarehousingInfo(MesExwarehousingInfo mesExwarehousingInfo);

    /**
     * 修改出库信息
     * 
     * @param mesExwarehousingInfo 出库信息
     * @return 结果
     */
    public int updateMesExwarehousingInfo(MesExwarehousingInfo mesExwarehousingInfo);

    /**
     * 删除出库信息
     * 
     * @param id 出库信息主键
     * @return 结果
     */
    public int deleteMesExwarehousingInfoById(Long id);

    /**
     * 批量删除出库信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesExwarehousingInfoByIds(String[] ids);
}
