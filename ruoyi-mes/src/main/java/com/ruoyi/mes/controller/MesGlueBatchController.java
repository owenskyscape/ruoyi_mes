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
import com.ruoyi.mes.domain.MesGlueBatch;
import com.ruoyi.mes.service.IMesGlueBatchService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 胶水批次Controller
 * 
 * @author owen
 * @date 2021-12-27
 */
@Controller
@RequestMapping("/mes/glue_batch")
public class MesGlueBatchController extends BaseController
{
    private String prefix = "mes/glue_batch";

    @Autowired
    private IMesGlueBatchService mesGlueBatchService;

    @RequiresPermissions("mes:glue_batch:view")
    @GetMapping()
    public String glue_batch()
    {
        return prefix + "/glue_batch";
    }

    /**
     * 查询胶水批次列表
     */
    @RequiresPermissions("mes:glue_batch:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesGlueBatch mesGlueBatch)
    {
        startPage();
        List<MesGlueBatch> list = mesGlueBatchService.selectMesGlueBatchList(mesGlueBatch);
        return getDataTable(list);
    }

    /**
     * 导出胶水批次列表
     */
    @RequiresPermissions("mes:glue_batch:export")
    @Log(title = "胶水批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesGlueBatch mesGlueBatch)
    {
        List<MesGlueBatch> list = mesGlueBatchService.selectMesGlueBatchList(mesGlueBatch);
        ExcelUtil<MesGlueBatch> util = new ExcelUtil<MesGlueBatch>(MesGlueBatch.class);
        return util.exportExcel(list, "胶水批次数据");
    }

    /**
     * 新增胶水批次
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存胶水批次
     */
    @RequiresPermissions("mes:glue_batch:add")
    @Log(title = "胶水批次", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesGlueBatch mesGlueBatch)
    {
        return toAjax(mesGlueBatchService.insertMesGlueBatch(mesGlueBatch));
    }

    /**
     * 修改胶水批次
     */
    @RequiresPermissions("mes:glue_batch:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesGlueBatch mesGlueBatch = mesGlueBatchService.selectMesGlueBatchById(id);
        mmap.put("mesGlueBatch", mesGlueBatch);
        return prefix + "/edit";
    }

    /**
     * 修改保存胶水批次
     */
    @RequiresPermissions("mes:glue_batch:edit")
    @Log(title = "胶水批次", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesGlueBatch mesGlueBatch)
    {
        return toAjax(mesGlueBatchService.updateMesGlueBatch(mesGlueBatch));
    }

    /**
     * 删除胶水批次
     */
    @RequiresPermissions("mes:glue_batch:remove")
    @Log(title = "胶水批次", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesGlueBatchService.deleteMesGlueBatchByIds(ids));
    }
}
