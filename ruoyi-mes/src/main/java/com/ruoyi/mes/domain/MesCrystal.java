package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
    * 原始晶棒入库表
 * @author DaiChao
 */
@Data
public class MesCrystal implements Serializable {
    private static final long serialVersionUID = 7724511009233876854L;
    /**
    * 主键
    */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
    * 层数
    */
    private Integer layerNumber;

    /**
    * 晶体编号
    */
    private String code;

    /**
    * 型号
    */
    private String model;

    /**
    * 规格
    */
    private String spec;

    /**
    * 中心电阻率（上）
    */
    private Double upResistivity;

    /**
    * 中心电阻率（下）
    */
    private Double downResistivity;

    /**
    * 表皮电阻（上）
    */
    private Double upResistance;

    /**
    * 表皮电阻（下）
    */
    private Double downResistance;

    /**
    * 直径（最小）
    */
    private Integer minDia;

    /**
    * 直径（最大）
    */
    private Integer maxDia;

    /**
    * 寿命（上）
    */
    private Integer upLife;

    /**
    * 寿命（下）
    */
    private Integer downLife;

    /**
    * 合格长度mm
    */
    private Integer passLength;

    /**
    * 重量kg
    */
    private Double weight;

    /**
    * 边距MIN
    */
    private Double minMargin;

    /**
    * 边距MAX
    */
    private Double maxMargin;

    /**
    * 备注
    */
    private String remark;

    /**
    * 入库等级
    */
    private String inLevel;

    /**
    * 电阻率
    */
    private String resistivity;

    /**
    * 入库日期
    */
    private Date inStoreData;

    /**
    * 炉号
    */
    private Integer heatNumber;

    /**
    * 区域
    */
    private String area;
}