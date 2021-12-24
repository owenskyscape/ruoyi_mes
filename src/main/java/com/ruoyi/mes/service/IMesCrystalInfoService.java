package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.MesCrystalInfo;

/**
 * 晶棒信息Service接口
 * 
 * @author ruoyi
 * @date 2021-12-24
 */
public interface IMesCrystalInfoService 
{
    /**
     * 查询晶棒信息
     * 
     * @param id 晶棒信息主键
     * @return 晶棒信息
     */
    public MesCrystalInfo selectMesCrystalInfoById(Long id);

    /**
     * 查询晶棒信息列表
     * 
     * @param mesCrystalInfo 晶棒信息
     * @return 晶棒信息集合
     */
    public List<MesCrystalInfo> selectMesCrystalInfoList(MesCrystalInfo mesCrystalInfo);

    /**
     * 新增晶棒信息
     * 
     * @param mesCrystalInfo 晶棒信息
     * @return 结果
     */
    public int insertMesCrystalInfo(MesCrystalInfo mesCrystalInfo);

    /**
     * 修改晶棒信息
     * 
     * @param mesCrystalInfo 晶棒信息
     * @return 结果
     */
    public int updateMesCrystalInfo(MesCrystalInfo mesCrystalInfo);

    /**
     * 批量删除晶棒信息
     * 
     * @param ids 需要删除的晶棒信息主键集合
     * @return 结果
     */
    public int deleteMesCrystalInfoByIds(String ids);

    /**
     * 删除晶棒信息信息
     * 
     * @param id 晶棒信息主键
     * @return 结果
     */
    public int deleteMesCrystalInfoById(Long id);
}
