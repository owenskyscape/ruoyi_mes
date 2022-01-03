package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.MesWarehousingInfo;

/**
 * 入库信息Service接口
 * 
 * @author owen
 * @date 2022-01-03
 */
public interface IMesWarehousingInfoService 
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
     * 批量删除入库信息
     * 
     * @param ids 需要删除的入库信息主键集合
     * @return 结果
     */
    public int deleteMesWarehousingInfoByIds(String ids);

    /**
     * 删除入库信息信息
     * 
     * @param id 入库信息主键
     * @return 结果
     */
    public int deleteMesWarehousingInfoById(Long id);
}
