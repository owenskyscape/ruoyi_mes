package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.MesCrystalCheck;

/**
 * 库存盘点Mapper接口
 * 
 * @author owen
 * @date 2022-01-03
 */
public interface MesCrystalCheckMapper 
{
    /**
     * 查询库存盘点
     * 
     * @param id 库存盘点主键
     * @return 库存盘点
     */
    public MesCrystalCheck selectMesCrystalCheckById(Long id);

    /**
     * 查询库存盘点列表
     * 
     * @param mesCrystalCheck 库存盘点
     * @return 库存盘点集合
     */
    public List<MesCrystalCheck> selectMesCrystalCheckList(MesCrystalCheck mesCrystalCheck);

    /**
     * 新增库存盘点
     * 
     * @param mesCrystalCheck 库存盘点
     * @return 结果
     */
    public int insertMesCrystalCheck(MesCrystalCheck mesCrystalCheck);

    /**
     * 修改库存盘点
     * 
     * @param mesCrystalCheck 库存盘点
     * @return 结果
     */
    public int updateMesCrystalCheck(MesCrystalCheck mesCrystalCheck);

    /**
     * 删除库存盘点
     * 
     * @param id 库存盘点主键
     * @return 结果
     */
    public int deleteMesCrystalCheckById(Long id);

    /**
     * 批量删除库存盘点
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMesCrystalCheckByIds(String[] ids);
}
