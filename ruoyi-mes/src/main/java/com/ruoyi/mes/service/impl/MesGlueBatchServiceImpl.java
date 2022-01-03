package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesGlueBatchMapper;
import com.ruoyi.mes.domain.MesGlueBatch;
import com.ruoyi.mes.service.IMesGlueBatchService;
import com.ruoyi.common.core.text.Convert;

/**
 * 胶水批次Service业务层处理
 * 
 * @author owen
 * @date 2021-12-27
 */
@Service
public class MesGlueBatchServiceImpl implements IMesGlueBatchService 
{
    @Autowired
    private MesGlueBatchMapper mesGlueBatchMapper;

    /**
     * 查询胶水批次
     * 
     * @param id 胶水批次主键
     * @return 胶水批次
     */
    @Override
    public MesGlueBatch selectMesGlueBatchById(Long id)
    {
        return mesGlueBatchMapper.selectMesGlueBatchById(id);
    }

    /**
     * 查询胶水批次列表
     * 
     * @param mesGlueBatch 胶水批次
     * @return 胶水批次
     */
    @Override
    public List<MesGlueBatch> selectMesGlueBatchList(MesGlueBatch mesGlueBatch)
    {
        return mesGlueBatchMapper.selectMesGlueBatchList(mesGlueBatch);
    }

    /**
     * 新增胶水批次
     * 
     * @param mesGlueBatch 胶水批次
     * @return 结果
     */
    @Override
    public int insertMesGlueBatch(MesGlueBatch mesGlueBatch)
    {
        return mesGlueBatchMapper.insertMesGlueBatch(mesGlueBatch);
    }

    /**
     * 修改胶水批次
     * 
     * @param mesGlueBatch 胶水批次
     * @return 结果
     */
    @Override
    public int updateMesGlueBatch(MesGlueBatch mesGlueBatch)
    {
        return mesGlueBatchMapper.updateMesGlueBatch(mesGlueBatch);
    }

    /**
     * 批量删除胶水批次
     * 
     * @param ids 需要删除的胶水批次主键
     * @return 结果
     */
    @Override
    public int deleteMesGlueBatchByIds(String ids)
    {
        return mesGlueBatchMapper.deleteMesGlueBatchByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除胶水批次信息
     * 
     * @param id 胶水批次主键
     * @return 结果
     */
    @Override
    public int deleteMesGlueBatchById(Long id)
    {
        return mesGlueBatchMapper.deleteMesGlueBatchById(id);
    }
}
