package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.MesCrystalCheck;

/**
 * 库存盘点Service接口
 * 
 * @author owen
 * @date 2022-01-03
 */
public interface IMesCrystalCheckService 
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
     * 批量删除库存盘点
     * 
     * @param ids 需要删除的库存盘点主键集合
     * @return 结果
     */
    public int deleteMesCrystalCheckByIds(String ids);

    /**
     * 删除库存盘点信息
     * 
     * @param id 库存盘点主键
     * @return 结果
     */
    public int deleteMesCrystalCheckById(Long id);
}
