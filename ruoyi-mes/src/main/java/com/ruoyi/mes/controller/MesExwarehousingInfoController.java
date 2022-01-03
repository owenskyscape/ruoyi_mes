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
import com.ruoyi.mes.domain.MesExwarehousingInfo;
import com.ruoyi.mes.service.IMesExwarehousingInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 出库信息Controller
 * 
 * @author owen
 * @date 2022-01-03
 */
@Controller
@RequestMapping("/mes/mes_exwarehousing_info")
public class MesExwarehousingInfoController extends BaseController
{
    private String prefix = "mes/mes_exwarehousing_info";

    @Autowired
    private IMesExwarehousingInfoService mesExwarehousingInfoService;

    @RequiresPermissions("mes:mes_exwarehousing_info:view")
    @GetMapping()
    public String mes_exwarehousing_info()
    {
        return prefix + "/mes_exwarehousing_info";
    }

    /**
     * 查询出库信息列表
     */
    @RequiresPermissions("mes:mes_exwarehousing_info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesExwarehousingInfo mesExwarehousingInfo)
    {
        startPage();
        List<MesExwarehousingInfo> list = mesExwarehousingInfoService.selectMesExwarehousingInfoList(mesExwarehousingInfo);
        return getDataTable(list);
    }

    /**
     * 导出出库信息列表
     */
    @RequiresPermissions("mes:mes_exwarehousing_info:export")
    @Log(title = "出库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesExwarehousingInfo mesExwarehousingInfo)
    {
        List<MesExwarehousingInfo> list = mesExwarehousingInfoService.selectMesExwarehousingInfoList(mesExwarehousingInfo);
        ExcelUtil<MesExwarehousingInfo> util = new ExcelUtil<MesExwarehousingInfo>(MesExwarehousingInfo.class);
        return util.exportExcel(list, "出库信息数据");
    }

    /**
     * 新增出库信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存出库信息
     */
    @RequiresPermissions("mes:mes_exwarehousing_info:add")
    @Log(title = "出库信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesExwarehousingInfo mesExwarehousingInfo)
    {
        return toAjax(mesExwarehousingInfoService.insertMesExwarehousingInfo(mesExwarehousingInfo));
    }

    /**
     * 修改出库信息
     */
    @RequiresPermissions("mes:mes_exwarehousing_info:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesExwarehousingInfo mesExwarehousingInfo = mesExwarehousingInfoService.selectMesExwarehousingInfoById(id);
        mmap.put("mesExwarehousingInfo", mesExwarehousingInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存出库信息
     */
    @RequiresPermissions("mes:mes_exwarehousing_info:edit")
    @Log(title = "出库信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesExwarehousingInfo mesExwarehousingInfo)
    {
        return toAjax(mesExwarehousingInfoService.updateMesExwarehousingInfo(mesExwarehousingInfo));
    }

    /**
     * 删除出库信息
     */
    @RequiresPermissions("mes:mes_exwarehousing_info:remove")
    @Log(title = "出库信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesExwarehousingInfoService.deleteMesExwarehousingInfoByIds(ids));
    }
}
