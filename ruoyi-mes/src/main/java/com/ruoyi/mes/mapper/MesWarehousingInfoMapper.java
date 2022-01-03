package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.MesWarehousingInfo;

/**
 * 入库信息Mapper接口
 * 
 * @author owen
 * @date 2022-01-03
 */
public interface MesWarehousingInfoMapper 
{
    /**
     * 查询入库信息
     * 
     * @param id 入库信息主键
     * @return 入库信息
     */
    public MesWarehousingInfo selectMesWarehousingInfoById(Long id);

    /**
     * 查询入库信息列表
     * 
     * @param mesWarehousingInfo 入库信息
     * @return 入库信息集合
     */
    public List<MesWarehousingInfo> selectMesWarehousingInfoList(MesWarehousingInfo mesWarehousingInfo);

    /**
     * 新增入库信息
     * 
     * @param mesWarehousingInfo 入库信息
     * @return 结果
     */
    public int insertMesWarehousingInfo(MesWarehousingInfo mesWarehousingInfo);

    /**
     * 修改入库信息
     * 
     * @param mesWarehousingInfo 入库信息
     * @return 结果
     */
    public int updateMesWarehousingInfo(MesWarehousingInfo mesWarehousingInfo);

    /**
     * 删除入库信息
     * 
     * @param id 入库信息主键
     * @return 结果
     */
    public int deleteMesWarehousingInfoById(Long id);

    /**
     * 批量删除入库信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesWarehousingInfoByIds(String[] ids);
}
