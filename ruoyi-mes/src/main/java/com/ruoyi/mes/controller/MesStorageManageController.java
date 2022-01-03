package com.ruoyi.mes.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.mes.domain.MesStorageManage;
import com.ruoyi.mes.service.IMesStorageManageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 库位管理Controller
 * 
 * @author owen
 * @date 2021-12-27
 */
@Controller
@RequestMapping("/mes/manage")
public class MesStorageManageController extends BaseController
{
    private String prefix = "mes/manage";

    @Autowired
    private IMesStorageManageService mesStorageManageService;

    @RequiresPermissions("mes:manage:view")
    @GetMapping()
    public String manage()
    {
        return prefix + "/manage";
    }

    /**
     * 查询库位管理列表
     */
    @RequiresPermissions("mes:manage:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesStorageManage mesStorageManage)
    {
        startPage();
        List<MesStorageManage> list = mesStorageManageService.selectMesStorageManageList(mesStorageManage);
        return getDataTable(list);
    }

    /**
     * 导出库位管理列表
     */
    @RequiresPermissions("mes:manage:export")
    @Log(title = "库位管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesStorageManage mesStorageManage)
    {
        List<MesStorageManage> list = mesStorageManageService.selectMesStorageManageList(mesStorageManage);
        ExcelUtil<MesStorageManage> util = new ExcelUtil<MesStorageManage>(MesStorageManage.class);
        return util.exportExcel(list, "库位管理数据");
    }

    /**
     * 新增库位管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存库位管理
     */
    @RequiresPermissions("mes:manage:add")
    @Log(title = "库位管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesStorageManage mesStorageManage)
    {
        return toAjax(mesStorageManageService.insertMesStorageManage(mesStorageManage));
    }

    /**
     * 修改库位管理
     */
    @RequiresPermissions("mes:manage:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesStorageManage mesStorageManage = mesStorageManageService.selectMesStorageManageById(id);
        mmap.put("mesStorageManage", mesStorageManage);
        return prefix + "/edit";
    }

    /**
     * 修改保存库位管理
     */
    @RequiresPermissions("mes:manage:edit")
    @Log(title = "库位管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesStorageManage mesStorageManage)
    {
        return toAjax(mesStorageManageService.updateMesStorageManage(mesStorageManage));
    }

    /**
     * 删除库位管理
     */
    @RequiresPermissions("mes:manage:remove")
    @Log(title = "库位管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesStorageManageService.deleteMesStorageManageByIds(ids));
    }
}
