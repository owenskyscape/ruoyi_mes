package com.ruoyi.mes.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出库信息对象 mes_exwarehousing_info
 * 
 * @author owen
 * @date 2022-01-03
 */
public class MesExwarehousingInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 晶棒编号 */
    @Excel(name = "晶棒编号")
    private String crystalCode;

    /** 规格 */
    @Excel(name = "规格")
    private String spec;

    /** 尺寸 */
    @Excel(name = "尺寸")
    private String type;

    /** 长度 */
    @Excel(name = "长度")
    private BigDecimal length;

    /** 片厚 */
    @Excel(name = "片厚")
    private String thicknessSplice;

    /** 切片机型 */
    @Excel(name = "切片机型")
    private String slicerModel;

    /** 库位号 */
    @Excel(name = "库位号")
    private String storageLocation;

    /** 出库时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出库时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date exwarehousingTime;

    /** 采集规格 */
    private String spec1;

    /** 采集类型 */
    private String type1;

    /** 采集长度 */
    private Long length1;

    /** 采集片厚 */
    private String thicknessSplice1;

    /** 采集切片机型 */
    private String slicerModel1;

    /** 采集库位 */
    private String storageLocation1;

    /** 采集晶棒编号 */
    private String code;

    /** 采集型号 */
    private String model;

    /** 采集是否拼棒 */
    private String isConnectible;

    /** 采集拼棒数 */
    private Long connectibleCount;

    /** 采集拼棒类型 */
    private String connectionType;

    /** 采集进线时间 */
    private Date workingTime;

    /** 采集流转状态 */
    private String transmittingState;

    /** 采集库存状态 */
    private Long storageState;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCrystalCode(String crystalCode) 
    {
        this.crystalCode = crystalCode;
    }

    public String getCrystalCode() 
    {
        return crystalCode;
    }
    public void setSpec(String spec) 
    {
        this.spec = spec;
    }

    public String getSpec() 
    {
        return spec;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setLength(BigDecimal length) 
    {
        this.length = length;
    }

    public BigDecimal getLength() 
    {
        return length;
    }
    public void setThicknessSplice(String thicknessSplice) 
    {
        this.thicknessSplice = thicknessSplice;
    }

    public String getThicknessSplice() 
    {
        return thicknessSplice;
    }
    public void setSlicerModel(String slicerModel) 
    {
        this.slicerModel = slicerModel;
    }

    public String getSlicerModel() 
    {
        return slicerModel;
    }
    public void setStorageLocation(String storageLocation) 
    {
        this.storageLocation = storageLocation;
    }

    public String getStorageLocation() 
    {
        return storageLocation;
    }
    public void setExwarehousingTime(Date exwarehousingTime) 
    {
        this.exwarehousingTime = exwarehousingTime;
    }

    public Date getExwarehousingTime() 
    {
        return exwarehousingTime;
    }
    public void setSpec1(String spec1) 
    {
        this.spec1 = spec1;
    }

    public String getSpec1() 
    {
        return spec1;
    }
    public void setType1(String type1) 
    {
        this.type1 = type1;
    }

    public String getType1() 
    {
        return type1;
    }
    public void setLength1(Long length1) 
    {
        this.length1 = length1;
    }

    public Long getLength1() 
    {
        return length1;
    }
    public void setThicknessSplice1(String thicknessSplice1) 
    {
        this.thicknessSplice1 = thicknessSplice1;
    }

    public String getThicknessSplice1() 
    {
        return thicknessSplice1;
    }
    public void setSlicerModel1(String slicerModel1) 
    {
        this.slicerModel1 = slicerModel1;
    }

    public String getSlicerModel1() 
    {
        return slicerModel1;
    }
    public void setStorageLocation1(String storageLocation1) 
    {
        this.storageLocation1 = storageLocation1;
    }

    public String getStorageLocation1() 
    {
        return storageLocation1;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setModel(String model) 
    {
        this.model = model;
    }

    public String getModel() 
    {
        return model;
    }
    public void setIsConnectible(String isConnectible) 
    {
        this.isConnectible = isConnectible;
    }

    public String getIsConnectible() 
    {
        return isConnectible;
    }
    public void setConnectibleCount(Long connectibleCount) 
    {
        this.connectibleCount = connectibleCount;
    }

    public Long getConnectibleCount() 
    {
        return connectibleCount;
    }
    public void setConnectionType(String connectionType) 
    {
        this.connectionType = connectionType;
    }

    public String getConnectionType() 
    {
        return connectionType;
    }
    public void setWorkingTime(Date workingTime) 
    {
        this.workingTime = workingTime;
    }

    public Date getWorkingTime() 
    {
        return workingTime;
    }
    public void setTransmittingState(String transmittingState) 
    {
        this.transmittingState = transmittingState;
    }

    public String getTransmittingState() 
    {
        return transmittingState;
    }
    public void setStorageState(Long storageState) 
    {
        this.storageState = storageState;
    }

    public Long getStorageState() 
    {
        return storageState;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("crystalCode", getCrystalCode())
            .append("spec", getSpec())
            .append("type", getType())
            .append("length", getLength())
            .append("thicknessSplice", getThicknessSplice())
            .append("slicerModel", getSlicerModel())
            .append("storageLocation", getStorageLocation())
            .append("exwarehousingTime", getExwarehousingTime())
            .append("spec1", getSpec1())
            .append("type1", getType1())
            .append("length1", getLength1())
            .append("thicknessSplice1", getThicknessSplice1())
            .append("slicerModel1", getSlicerModel1())
            .append("storageLocation1", getStorageLocation1())
            .append("code", getCode())
            .append("model", getModel())
            .append("isConnectible", getIsConnectible())
            .append("connectibleCount", getConnectibleCount())
            .append("connectionType", getConnectionType())
            .append("workingTime", getWorkingTime())
            .append("transmittingState", getTransmittingState())
            .append("storageState", getStorageState())
            .toString();
    }
}
