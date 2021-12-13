package com.ruoyi.mes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 生产指令
 */
@Data
public class MesProductionOrder implements Serializable {
    private static final long serialVersionUID = 7479301661712999122L;
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 晶棒ID
     */
    private Long crystalId;

    /**
     * 晶棒批次
     */
    private String crystalBatch;

    /**
     * 晶棒规格
     */
    private String crystalSpec;

    /**
     * 电阻率Ω㎝
     */
    private String resistivity;

    /**
     * 边长mm
     */
    private Double sideLength;

    /**
     * 片厚μm
     */
    private Double sliceThickNess;

    /**
     * 订单批次
     */
    private String orderBatch;

    /**
     * 规格代码
     */
    private String specCode;

    /**
     * 实验发起
     */
    private String experiments;

    /**
     * 实验发起
     */
    private String typeExperiments;

    /**
     * 实验名称
     */
    private String nameExperiments;

    /**
     * 备注
     */
    private String productionRemarks;
}