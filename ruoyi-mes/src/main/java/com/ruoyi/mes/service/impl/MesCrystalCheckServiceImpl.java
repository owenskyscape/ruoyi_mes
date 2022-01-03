package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.MesCrystalCheckMapper;
import com.ruoyi.mes.domain.MesCrystalCheck;
import com.ruoyi.mes.service.IMesCrystalCheckService;
import com.ruoyi.common.core.text.Convert;

/**
 * 库存盘点Service业务层处理
 * 
 * @author owen
 * @date 2022-01-03
 */
@Service
public class MesCrystalCheckServiceImpl implements IMesCrystalCheckService 
{
    @Autowired
    private MesCrystalCheckMapper mesCrystalCheckMapper;

    /**
     * 查询库存盘点
     * 
     * @param id 库存盘点主键
     * @return 库存盘点
     */
    @Override
    public MesCrystalCheck selectMesCrystalCheckById(Long id)
    {
        return mesCrystalCheckMapper.selectMesCrystalCheckById(id);
    }

    /**
     * 查询库存盘点列表
     * 
     * @param mesCrystalCheck 库存盘点
     * @return 库存盘点
     */
    @Override
    public List<MesCrystalCheck> selectMesCrystalCheckList(MesCrystalCheck mesCrystalCheck)
    {
        return mesCrystalCheckMapper.selectMesCrystalCheckList(mesCrystalCheck);
    }

    /**
     * 新增库存盘点
     * 
     * @param mesCrystalCheck 库存盘点
     * @return 结果
     */
    @Override
    public int insertMesCrystalCheck(MesCrystalCheck mesCrystalCheck)
    {
        return mesCrystalCheckMapper.insertMesCrystalCheck(mesCrystalCheck);
    }

    /**
     * 修改库存盘点
     * 
     * @param mesCrystalCheck 库存盘点
     * @return 结果
     */
    @Override
    public int updateMesCrystalCheck(MesCrystalCheck mesCrystalCheck)
    {
        return mesCrystalCheckMapper.updateMesCrystalCheck(mesCrystalCheck);
    }

    /**
     * 批量删除库存盘点
     * 
     * @param ids 需要删除的库存盘点主键
     * @return 结果
     */
    @Override
    public int deleteMesCrystalCheckByIds(String ids)
    {
        return mesCrystalCheckMapper.deleteMesCrystalCheckByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除库存盘点信息
     * 
     * @param id 库存盘点主键
     * @return 结果
     */
    @Override
    public int deleteMesCrystalCheckById(Long id)
    {
        return mesCrystalCheckMapper.deleteMesCrystalCheckById(id);
    }
}
