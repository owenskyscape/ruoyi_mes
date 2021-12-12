package com.ruoyi.mes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
    * 配棒库表
 * @author DaiChao
 */
@Data
public class MesMatchingpost implements Serializable {
    private static final long serialVersionUID = -6477724873060976273L;
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
    * 配棒日期
    */
    private String matchDate;

    /**
    * 配棒时间
    */
    private String matchTime;

    /**
    * 根数
    */
    private String numbers;

    /**
    * 检棒总长mm
    */
    private Double length;

    /**
    * 有效总长mm
    */
    private Double effectiveLength;

    /**
    * 厚片
    */
    private String thick;

    /**
    * 配棒人员
    */
    private String createUser;

    /**
    * 尺寸范围
    */
    private String sizeScope;
}