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
import com.ruoyi.mes.domain.MesWarehousingInfo;
import com.ruoyi.mes.service.IMesWarehousingInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 入库信息Controller
 * 
 * @author owen
 * @date 2022-01-03
 */
@Controller
@RequestMapping("/mes/mes_warehousing_info")
public class MesWarehousingInfoController extends BaseController
{
    private String prefix = "mes/mes_warehousing_info";

    @Autowired
    private IMesWarehousingInfoService mesWarehousingInfoService;

    @RequiresPermissions("mes:mes_warehousing_info:view")
    @GetMapping()
    public String mes_warehousing_info()
    {
        return prefix + "/mes_warehousing_info";
    }

    /**
     * 查询入库信息列表
     */
    @RequiresPermissions("mes:mes_warehousing_info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesWarehousingInfo mesWarehousingInfo)
    {
        startPage();
        List<MesWarehousingInfo> list = mesWarehousingInfoService.selectMesWarehousingInfoList(mesWarehousingInfo);
        return getDataTable(list);
    }

    /**
     * 导出入库信息列表
     */
    @RequiresPermissions("mes:mes_warehousing_info:export")
    @Log(title = "入库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesWarehousingInfo mesWarehousingInfo)
    {
        List<MesWarehousingInfo> list = mesWarehousingInfoService.selectMesWarehousingInfoList(mesWarehousingInfo);
        ExcelUtil<MesWarehousingInfo> util = new ExcelUtil<MesWarehousingInfo>(MesWarehousingInfo.class);
        return util.exportExcel(list, "入库信息数据");
    }

    /**
     * 新增入库信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存入库信息
     */
    @RequiresPermissions("mes:mes_warehousing_info:add")
    @Log(title = "入库信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesWarehousingInfo mesWarehousingInfo)
    {
        return toAjax(mesWarehousingInfoService.insertMesWarehousingInfo(mesWarehousingInfo));
    }

    /**
     * 修改入库信息
     */
    @RequiresPermissions("mes:mes_warehousing_info:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesWarehousingInfo mesWarehousingInfo = mesWarehousingInfoService.selectMesWarehousingInfoById(id);
        mmap.put("mesWarehousingInfo", mesWarehousingInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存入库信息
     */
    @RequiresPermissions("mes:mes_warehousing_info:edit")
    @Log(title = "入库信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesWarehousingInfo mesWarehousingInfo)
    {
        return toAjax(mesWarehousingInfoService.updateMesWarehousingInfo(mesWarehousingInfo));
    }

    /**
     * 删除入库信息
     */
    @RequiresPermissions("mes:mes_warehousing_info:remove")
    @Log(title = "入库信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesWarehousingInfoService.deleteMesWarehousingInfoByIds(ids));
    }
}
