package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesBoardBatchMapper;
import com.ruoyi.mes.domain.MesBoardBatch;
import com.ruoyi.mes.service.IMesBoardBatchService;
import com.ruoyi.common.core.text.Convert;

/**
 * 板材批次Service业务层处理
 * 
 * @author owen
 * @date 2021-12-27
 */
@Service
public class MesBoardBatchServiceImpl implements IMesBoardBatchService 
{
    @Autowired
    private MesBoardBatchMapper mesBoardBatchMapper;

    /**
     * 查询板材批次
     * 
     * @param id 板材批次主键
     * @return 板材批次
     */
    @Override
    public MesBoardBatch selectMesBoardBatchById(Long id)
    {
        return mesBoardBatchMapper.selectMesBoardBatchById(id);
    }

    /**
     * 查询板材批次列表
     * 
     * @param mesBoardBatch 板材批次
     * @return 板材批次
     */
    @Override
    public List<MesBoardBatch> selectMesBoardBatchList(MesBoardBatch mesBoardBatch)
    {
        return mesBoardBatchMapper.selectMesBoardBatchList(mesBoardBatch);
    }

    /**
     * 新增板材批次
     * 
     * @param mesBoardBatch 板材批次
     * @return 结果
     */
    @Override
    public int insertMesBoardBatch(MesBoardBatch mesBoardBatch)
    {
        return mesBoardBatchMapper.insertMesBoardBatch(mesBoardBatch);
    }

    /**
     * 修改板材批次
     * 
     * @param mesBoardBatch 板材批次
     * @return 结果
     */
    @Override
    public int updateMesBoardBatch(MesBoardBatch mesBoardBatch)
    {
        return mesBoardBatchMapper.updateMesBoardBatch(mesBoardBatch);
    }

    /**
     * 批量删除板材批次
     * 
     * @param ids 需要删除的板材批次主键
     * @return 结果
     */
    @Override
    public int deleteMesBoardBatchByIds(String ids)
    {
        return mesBoardBatchMapper.deleteMesBoardBatchByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除板材批次信息
     * 
     * @param id 板材批次主键
     * @return 结果
     */
    @Override
    public int deleteMesBoardBatchById(Long id)
    {
        return mesBoardBatchMapper.deleteMesBoardBatchById(id);
    }
}
