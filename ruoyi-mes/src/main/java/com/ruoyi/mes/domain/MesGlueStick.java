package com.ruoyi.mes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 粘棒库表
 * @author DaiChao
 */
@Data
public class MesGlueStick implements Serializable {
    private static final long serialVersionUID = -9191054785590405147L;
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 晶棒ID
     */
    private Long productionOrderId;

    /**
     * 粘棒日期
     */
    private String glueStickDate;

    /**
     * 班组
     */
    private String team;

    /**
     * 粘棒人员
     */
    private String person;

    /**
     * 粘胶时间
     */
    private String viscoseTime;

    /**
     * 水煮胶厂家批次
     */
    private String boiledGlueBatchNo;

    /**
     * 粘棒胶厂家批次
     */
    private String viscoseBatchNo;

    /**
     * 粘棒板厂家批次
     */
    private String glueStickBatchNo;

    /**
     * 水煮胶用量
     */
    private String boiledGlueDosage;

    /**
     * A粘棒胶用量
     */
    private String aDosage;

    /**
     * B粘棒胶用量
     */
    private String bDosage;

    /**
     * 粘棒板长度mm
     */
    private Double length;

    /**
     * 粘棒板材质
     */
    private String material;

    /**
     * 晶托编号
     */
    private String trayBatchNo;
}