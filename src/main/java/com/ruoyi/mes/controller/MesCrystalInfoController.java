package com.ruoyi.mes.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.mes.domain.MesCrystalInfo;
import com.ruoyi.mes.service.IMesCrystalInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 晶棒信息Controller
 * 
 * @author ruoyi
 * @date 2021-12-24
 */
@Controller
@RequestMapping("/mes/mes_crystal_info")
public class MesCrystalInfoController extends BaseController
{
    private String prefix = "mes/mes_crystal_info";

    @Autowired
    private IMesCrystalInfoService mesCrystalInfoService;

    @RequiresPermissions("mes:mes_crystal_info:view")
    @GetMapping()
    public String mes_crystal_info()
    {
        return prefix + "/mes_crystal_info";
    }

    /**
     * 查询晶棒信息列表
     */
    @RequiresPermissions("mes:mes_crystal_info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesCrystalInfo mesCrystalInfo)
    {
        startPage();
        List<MesCrystalInfo> list = mesCrystalInfoService.selectMesCrystalInfoList(mesCrystalInfo);
        return getDataTable(list);
    }

    /**
     * 导出晶棒信息列表
     */
    @RequiresPermissions("mes:mes_crystal_info:export")
    @Log(title = "晶棒信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesCrystalInfo mesCrystalInfo)
    {
        List<MesCrystalInfo> list = mesCrystalInfoService.selectMesCrystalInfoList(mesCrystalInfo);
        ExcelUtil<MesCrystalInfo> util = new ExcelUtil<MesCrystalInfo>(MesCrystalInfo.class);
        return util.exportExcel(list, "晶棒信息数据");
    }

    /**
     * 新增晶棒信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存晶棒信息
     */
    @RequiresPermissions("mes:mes_crystal_info:add")
    @Log(title = "晶棒信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesCrystalInfo mesCrystalInfo)
    {
        return toAjax(mesCrystalInfoService.insertMesCrystalInfo(mesCrystalInfo));
    }

    /**
     * 修改晶棒信息
     */
    @RequiresPermissions("mes:mes_crystal_info:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesCrystalInfo mesCrystalInfo = mesCrystalInfoService.selectMesCrystalInfoById(id);
        mmap.put("mesCrystalInfo", mesCrystalInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存晶棒信息
     */
    @RequiresPermissions("mes:mes_crystal_info:edit")
    @Log(title = "晶棒信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesCrystalInfo mesCrystalInfo)
    {
        return toAjax(mesCrystalInfoService.updateMesCrystalInfo(mesCrystalInfo));
    }

    /**
     * 删除晶棒信息
     */
    @RequiresPermissions("mes:mes_crystal_info:remove")
    @Log(title = "晶棒信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesCrystalInfoService.deleteMesCrystalInfoByIds(ids));
    }
}
