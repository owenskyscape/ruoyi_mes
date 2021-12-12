package com.ruoyi.mes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
    * 清洗库表
 * @author DaiChao
 */
@Data
public class MesCleaning implements Serializable {
    private static final long serialVersionUID = 3268351078685993699L;
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
    * 切片ID
    */
    private Long sliceId;

    /**
    * 脱胶日期
    */
    private Date degummingTime;

    /**
    * 班次
    */
    private String batchNo;

    /**
    * 脱胶机台
    */
    private String degummingMachine;

    /**
    * 脱胶员
    */
    private String degummingUser;

    /**
    * 脱胶剂厂家批次
    */
    private String degummingBatch;

    /**
    * 刀次
    */
    private String knifeNo;

    /**
    * 切片损失mm
    */
    private Double sliceLoss;

    /**
    * 清洗线别
    */
    private String cleaningLine;

    /**
    * 清洗员
    */
    private String cleaningUser;

    /**
    * 进片数
    */
    private Integer inPieceCount;

    /**
    * 出片数
    */
    private Integer outPieceCount;

    /**
    * 清洗剂厂家批次
    */
    private String cleaningBatch;

    /**
    * 次数
    */
    private Integer numbers;

    /**
    * 脱胶损失
    */
    private Double degummingBaloss;
}