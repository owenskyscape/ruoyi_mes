package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.MesGlueBatch;

/**
 * 胶水批次Mapper接口
 * 
 * @author owen
 * @date 2021-12-27
 */
public interface MesGlueBatchMapper 
{
    /**
     * 查询胶水批次
     * 
     * @param id 胶水批次主键
     * @return 胶水批次
     */
    public MesGlueBatch selectMesGlueBatchById(Long id);

    /**
     * 查询胶水批次列表
     * 
     * @param mesGlueBatch 胶水批次
     * @return 胶水批次集合
     */
    public List<MesGlueBatch> selectMesGlueBatchList(MesGlueBatch mesGlueBatch);

    /**
     * 新增胶水批次
     * 
     * @param mesGlueBatch 胶水批次
     * @return 结果
     */
    public int insertMesGlueBatch(MesGlueBatch mesGlueBatch);

    /**
     * 修改胶水批次
     * 
     * @param mesGlueBatch 胶水批次
     * @return 结果
     */
    public int updateMesGlueBatch(MesGlueBatch mesGlueBatch);

    /**
     * 删除胶水批次
     * 
     * @param id 胶水批次主键
     * @return 结果
     */
    public int deleteMesGlueBatchById(Long id);

    /**
     * 批量删除胶水批次
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesGlueBatchByIds(String[] ids);
}
