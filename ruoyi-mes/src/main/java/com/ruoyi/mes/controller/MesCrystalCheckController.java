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
import com.ruoyi.mes.domain.MesCrystalCheck;
import com.ruoyi.mes.service.IMesCrystalCheckService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库存盘点Controller
 * 
 * @author owen
 * @date 2022-01-03
 */
@Controller
@RequestMapping("/mes/mes_crystal_check")
public class MesCrystalCheckController extends BaseController
{
    private String prefix = "mes/mes_crystal_check";

    @Autowired
    private IMesCrystalCheckService mesCrystalCheckService;

    @RequiresPermissions("mes:mes_crystal_check:view")
    @GetMapping()
    public String mes_crystal_check()
    {
        return prefix + "/mes_crystal_check";
    }

    /**
     * 查询库存盘点列表
     */
    @RequiresPermissions("mes:mes_crystal_check:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesCrystalCheck mesCrystalCheck)
    {
        startPage();
        List<MesCrystalCheck> list = mesCrystalCheckService.selectMesCrystalCheckList(mesCrystalCheck);
        return getDataTable(list);
    }

    /**
     * 导出库存盘点列表
     */
    @RequiresPermissions("mes:mes_crystal_check:export")
    @Log(title = "库存盘点", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesCrystalCheck mesCrystalCheck)
    {
        List<MesCrystalCheck> list = mesCrystalCheckService.selectMesCrystalCheckList(mesCrystalCheck);
        ExcelUtil<MesCrystalCheck> util = new ExcelUtil<MesCrystalCheck>(MesCrystalCheck.class);
        return util.exportExcel(list, "库存盘点数据");
    }

    /**
     * 新增库存盘点
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存库存盘点
     */
    @RequiresPermissions("mes:mes_crystal_check:add")
    @Log(title = "库存盘点", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesCrystalCheck mesCrystalCheck)
    {
        return toAjax(mesCrystalCheckService.insertMesCrystalCheck(mesCrystalCheck));
    }

    /**
     * 修改库存盘点
     */
    @RequiresPermissions("mes:mes_crystal_check:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesCrystalCheck mesCrystalCheck = mesCrystalCheckService.selectMesCrystalCheckById(id);
        mmap.put("mesCrystalCheck", mesCrystalCheck);
        return prefix + "/edit";
    }

    /**
     * 修改保存库存盘点
     */
    @RequiresPermissions("mes:mes_crystal_check:edit")
    @Log(title = "库存盘点", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesCrystalCheck mesCrystalCheck)
    {
        return toAjax(mesCrystalCheckService.updateMesCrystalCheck(mesCrystalCheck));
    }

    /**
     * 删除库存盘点
     */
    @RequiresPermissions("mes:mes_crystal_check:remove")
    @Log(title = "库存盘点", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesCrystalCheckService.deleteMesCrystalCheckByIds(ids));
    }
}
