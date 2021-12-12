package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
    * 捡包表
 * @author DaiChao
 */
@Data
public class MesProductionOrderCheck implements Serializable {
    private static final long serialVersionUID = 2714401392530122093L;
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
    * 检验日期
    */
    private Date checkDate;

    /**
    * 班组
    */
    private String batch;

    /**
    * 机台
    */
    private String machine;

    /**
    * 接收片数
    */
    private String receiveNumbers;

    /**
    * 上料员
    */
    private String operationUser;

    /**
    * 清洗损失
    */
    private Integer cleaningLoss;

    /**
    * 分选员
    */
    private String sortingUser;

    /**
    * 机选损失
    */
    private String machineLoss;

    /**
    * 打包人员
    */
    private String packageUser;

    /**
    * QC
    */
    private String qc;

    /**
    * 异常项目
    */
    private String errorProject;

    /**
    * 硅片位置（单片）
    */
    private String waferLocation;

    /**
    * 晶棒位置（单刀）
    */
    private String crystalLocation;

    /**
    * 异常描述备注：
    */
    private String remark;
}