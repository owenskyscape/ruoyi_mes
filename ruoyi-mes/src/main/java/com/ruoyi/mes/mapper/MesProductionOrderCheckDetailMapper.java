package com.ruoyi.mes.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.mes.domain.MesProductionOrderCheckDetail;

public interface MesProductionOrderCheckDetailMapper extends BaseMapper<MesProductionOrderCheckDetail> {
    /**
     * delete by primary key
     *
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long id);

    /**
     * insert record to table selective
     *
     * @param record the record
     * @return insert count
     */
    int insertSelective(MesProductionOrderCheckDetail record);

    /**
     * select by primary key
     *
     * @param id primary key
     * @return object by primary key
     */
    MesProductionOrderCheckDetail selectByPrimaryKey(Long id);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MesProductionOrderCheckDetail record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MesProductionOrderCheckDetail record);
}