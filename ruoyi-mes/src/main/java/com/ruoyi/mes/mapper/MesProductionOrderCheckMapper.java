package com.ruoyi.mes.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.mes.domain.MesProductionOrderCheck;

public interface MesProductionOrderCheckMapper extends BaseMapper<MesProductionOrderCheck> {
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
    int insertSelective(MesProductionOrderCheck record);

    /**
     * select by primary key
     *
     * @param id primary key
     * @return object by primary key
     */
    MesProductionOrderCheck selectByPrimaryKey(Long id);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MesProductionOrderCheck record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MesProductionOrderCheck record);
}