package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.MesBoardBatch;

/**
 * 板材批次Mapper接口
 * 
 * @author owen
 * @date 2021-12-27
 */
public interface MesBoardBatchMapper 
{
    /**
     * 查询板材批次
     * 
     * @param id 板材批次主键
     * @return 板材批次
     */
    public MesBoardBatch selectMesBoardBatchById(Long id);

    /**
     * 查询板材批次列表
     * 
     * @param mesBoardBatch 板材批次
     * @return 板材批次集合
     */
    public List<MesBoardBatch> selectMesBoardBatchList(MesBoardBatch mesBoardBatch);

    /**
     * 新增板材批次
     * 
     * @param mesBoardBatch 板材批次
     * @return 结果
     */
    public int insertMesBoardBatch(MesBoardBatch mesBoardBatch);

    /**
     * 修改板材批次
     * 
     * @param mesBoardBatch 板材批次
     * @return 结果
     */
    public int updateMesBoardBatch(MesBoardBatch mesBoardBatch);

    /**
     * 删除板材批次
     * 
     * @param id 板材批次主键
     * @return 结果
     */
    public int deleteMesBoardBatchById(Long id);

    /**
     * 批量删除板材批次
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesBoardBatchByIds(String[] ids);
}
