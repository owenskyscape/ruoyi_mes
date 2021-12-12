package com.ruoyi.mes.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.mes.domain.MesProductionOrder;

public interface MesProductionOrderMapper extends BaseMapper<MesProductionOrder> {
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
    int insertSelective(MesProductionOrder record);

    /**
     * select by primary key
     *
     * @param id primary key
     * @return object by primary key
     */
    MesProductionOrder selectByPrimaryKey(Long id);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MesProductionOrder record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MesProductionOrder record);
}