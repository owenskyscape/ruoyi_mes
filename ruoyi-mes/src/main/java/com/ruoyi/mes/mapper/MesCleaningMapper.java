package com.ruoyi.mes.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.mes.domain.MesCleaning;

public interface MesCleaningMapper extends BaseMapper<MesCleaning> {
    /**
     * delete by primary key
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long id);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MesCleaning record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MesCleaning selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MesCleaning record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MesCleaning record);
}