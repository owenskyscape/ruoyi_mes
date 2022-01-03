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
import com.ruoyi.mes.domain.MesBoardBatch;
import com.ruoyi.mes.service.IMesBoardBatchService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 板材批次Controller
 * 
 * @author owen
 * @date 2021-12-27
 */
@Controller
@RequestMapping("/mes/board_batch")
public class MesBoardBatchController extends BaseController
{
    private String prefix = "mes/board_batch";

    @Autowired
    private IMesBoardBatchService mesBoardBatchService;

    @RequiresPermissions("mes:board_batch:view")
    @GetMapping()
    public String board_batch()
    {
        return prefix + "/board_batch";
    }

    /**
     * 查询板材批次列表
     */
    @RequiresPermissions("mes:board_batch:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MesBoardBatch mesBoardBatch)
    {
        startPage();
        List<MesBoardBatch> list = mesBoardBatchService.selectMesBoardBatchList(mesBoardBatch);
        return getDataTable(list);
    }

    /**
     * 导出板材批次列表
     */
    @RequiresPermissions("mes:board_batch:export")
    @Log(title = "板材批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MesBoardBatch mesBoardBatch)
    {
        List<MesBoardBatch> list = mesBoardBatchService.selectMesBoardBatchList(mesBoardBatch);
        ExcelUtil<MesBoardBatch> util = new ExcelUtil<MesBoardBatch>(MesBoardBatch.class);
        return util.exportExcel(list, "板材批次数据");
    }

    /**
     * 新增板材批次
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存板材批次
     */
    @RequiresPermissions("mes:board_batch:add")
    @Log(title = "板材批次", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MesBoardBatch mesBoardBatch)
    {
        return toAjax(mesBoardBatchService.insertMesBoardBatch(mesBoardBatch));
    }

    /**
     * 修改板材批次
     */
    @RequiresPermissions("mes:board_batch:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MesBoardBatch mesBoardBatch = mesBoardBatchService.selectMesBoardBatchById(id);
        mmap.put("mesBoardBatch", mesBoardBatch);
        return prefix + "/edit";
    }

    /**
     * 修改保存板材批次
     */
    @RequiresPermissions("mes:board_batch:edit")
    @Log(title = "板材批次", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MesBoardBatch mesBoardBatch)
    {
        return toAjax(mesBoardBatchService.updateMesBoardBatch(mesBoardBatch));
    }

    /**
     * 删除板材批次
     */
    @RequiresPermissions("mes:board_batch:remove")
    @Log(title = "板材批次", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mesBoardBatchService.deleteMesBoardBatchByIds(ids));
    }
}
