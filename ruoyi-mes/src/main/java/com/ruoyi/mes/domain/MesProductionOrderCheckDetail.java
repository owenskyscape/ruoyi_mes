package com.ruoyi.mes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 捡包明细
 * @author DaiChao
 */
@Data
public class MesProductionOrderCheckDetail implements Serializable {
    private static final long serialVersionUID = 7067819271644472280L;
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
     * 捡包ID
     */
    private Long productionOrderCheckId;

    /**
     * 等级
     */
    private String type;

    /**
     * A片数
     */
    private Integer aNumbers;

    /**
     * 高电阻
     */
    private Integer highResistance;

    /**
     * 低电阻
     */
    private Integer lowResistance;

    /**
     * A尺寸
     */
    private Integer aSize;

    /**
     * "A2轻线痕"
     */
    private String a2Line;

    /**
     * B2崩边
     */
    private String b2Line;

    /**
     * 入刀侧面崩边
     */
    private String knifeSide;

    /**
     * "B3TTV"
     */
    private String b3;

    /**
     * B4脏污
     */
    private String b4;

    /**
     * B5色差
     */
    private String b5;

    /**
     * C1线痕TTV
     */
    private String c1ttv;

    /**
     * C2崩边缺角
     */
    private String c2;

    /**
     * "C7隐裂
     */
    private String c7;

    /**
     * 直流
     */
    private String dc;

    /**
     * 双片
     */
    private String doubleDisc;

    /**
     * 其他
     */
    private String other;
}