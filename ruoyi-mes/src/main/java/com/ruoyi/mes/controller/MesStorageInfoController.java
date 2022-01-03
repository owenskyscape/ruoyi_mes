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
import com.ruoyi.mes.domain.MesStorageInfo;
import com.ruoyi.mes.service.IMesStorageInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库存信息Controller
 * 
 * @author owen
 * @date 2022-01-03
 */
@Controller
@RequestMapping("/mes/mes_storage_info")
public class MesStorageInfoController extends BaseController
{
    private String prefix = "mes/mes_storage_info";

    @Autowired
    private IMesStorageInfoService mesStorageInfoService;

    @RequiresPermissions("mes:mes_storage_info:view")
    @GetMapping()
    public String mes_storage_info()
    {
        return prefix + "/mes_storage_info";
    }

    /**
     * 查询库存信息列表
     */
    @RequiresPermissions("mes:mes_storage_info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesStorageInfo mesStorageInfo)
    {
        startPage();
        List<MesStorageInfo> list = mesStorageInfoService.selectMesStorageInfoList(mesStorageInfo);
        return getDataTable(list);
    }

    /**
     * 导出库存信息列表
     */
    @RequiresPermissions("mes:mes_storage_info:export")
    @Log(title = "库存信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesStorageInfo mesStorageInfo)
    {
        List<MesStorageInfo> list = mesStorageInfoService.selectMesStorageInfoList(mesStorageInfo);
        ExcelUtil<MesStorageInfo> util = new ExcelUtil<MesStorageInfo>(MesStorageInfo.class);
        return util.exportExcel(list, "库存信息数据");
    }

    /**
     * 新增库存信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存库存信息
     */
    @RequiresPermissions("mes:mes_storage_info:add")
    @Log(title = "库存信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesStorageInfo mesStorageInfo)
    {
        return toAjax(mesStorageInfoService.insertMesStorageInfo(mesStorageInfo));
    }

    /**
     * 修改库存信息
     */
    @RequiresPermissions("mes:mes_storage_info:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesStorageInfo mesStorageInfo = mesStorageInfoService.selectMesStorageInfoById(id);
        mmap.put("mesStorageInfo", mesStorageInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存库存信息
     */
    @RequiresPermissions("mes:mes_storage_info:edit")
    @Log(title = "库存信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesStorageInfo mesStorageInfo)
    {
        return toAjax(mesStorageInfoService.updateMesStorageInfo(mesStorageInfo));
    }

    /**
     * 删除库存信息
     */
    @RequiresPermissions("mes:mes_storage_info:remove")
    @Log(title = "库存信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesStorageInfoService.deleteMesStorageInfoByIds(ids));
    }
}
