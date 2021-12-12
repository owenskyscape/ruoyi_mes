package com.ruoyi.mes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 切片库表
 * @author DaiChao
 */
@Data
public class MesSlice implements Serializable {
    private static final long serialVersionUID = -6603158950257308082L;
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
     * 切片日期
     */
    private String date;

    /**
     * 班组
     */
    private String team;

    /**
     * 槽距
     */
    private Double slotPitch;

    /**
     * 理论切片数
     */
    private Integer theoryNumbers;

    /**
     * 开机线量
     */
    private Integer bootDose;

    /**
     * 上棒操作工
     */
    private String operationUser;

    /**
     * 上棒开机时间
     */
    private Date startTime;

    /**
     * 粘棒损失mm
     */
    private Double glueStickLoss;

    /**
     * 主辊时间
     */
    private String mainRollerTime;

    /**
     * 导轮厂家批次
     */
    private String inducerBatch;

    /**
     * 导向轮时间
     */
    private Date guideTime;

    /**
     * 钢线规格
     */
    private String steelWireSpec;

    /**
     * 钢线厂家批次
     */
    private String steelWireBatch;

    /**
     * 钢线编号
     */
    private String steelWireCode;

    /**
     * 刀次
     */
    private Integer knifeNo;

    /**
     * 切割液厂家批次
     */
    private String cuttingFluidBatch;

    /**
     * 切割液用量
     */
    private Integer cuttingFluidDosage;

    /**
     * 断线次数
     */
    private Integer offlineNumbers;

    /**
     * 是否加切
     */
    private Boolean addCutFlag;

    /**
     * 本刀用线量
     */
    private Integer knifeUseDosage;

    /**
     * 下棒操作工
     */
    private String underUser;

    /**
     * 下棒时间
     */
    private Date underTime;

    /**
     * 超时备注
     */
    private String timeoutRemark;

    /**
     * 断线原因
     */
    private String offlineReason;

    /**
     * 断线描述
     */
    private String offlineRemark;
}