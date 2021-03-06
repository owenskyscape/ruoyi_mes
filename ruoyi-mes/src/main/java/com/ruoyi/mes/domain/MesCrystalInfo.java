package com.ruoyi.mes.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 晶棒信息对象 mes_crystal_info
 * 
 * @author ruoyi
 * @date 2021-12-27
 */
public class MesCrystalInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 晶棒编号 */
    private String code;

    /** 型号 */
    private String model;

    /** 长度 */
    private Long length;

    /** 类型 */
    private String type;

    /** 规格 */
    private String spec;

    /** 片厚 */
    private String thicknessSplice;

    /** 是否拼棒 */
    private String isConnectible;

    /** 拼棒数 */
    private Long connectibleCount;

    /** 拼棒类型 */
    private String connectionType;

    /** 切片机型 */
    private String slicerModel;

    /** 进线时间 */
    private Date workingTime;

    /** 流转状态 */
    private String transmittingState;

    /** 库存状态 */
    private Long storageState;

    /** 库位 */
    private String storageLocation;

    /** 建立时间 */
    private Date createdTime;

    /** 创建人 */
    private String creater;

    /** 领料人 */
    private String picker;

    /** 审核人 */
    private String auditor;

    /** 库位id */
    private Long housingId;

    /** 库位时间 */
    private Date housingTime;

    /** 固化状态 */
    private String curingState;

    /** 固化时间 */
    private Long curingTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setLength(Long length) 
    {
        this.length = length;
    }

    public Long getLength() 
    {
        return length;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setSpec(String spec) 
    {
        this.spec = spec;
    }

    public String getSpec() 
    {
        return spec;
    }
    public void setThicknessSplice(String thicknessSplice) 
    {
        this.thicknessSplice = thicknessSplice;
    }

    public String getThicknessSplice() 
    {
        return thicknessSplice;
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
    public void setSlicerModel(String slicerModel) 
    {
        this.slicerModel = slicerModel;
    }

    public String getSlicerModel() 
    {
        return slicerModel;
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
    public void setStorageLocation(String storageLocation) 
    {
        this.storageLocation = storageLocation;
    }

    public String getStorageLocation() 
    {
        return storageLocation;
    }
    public void setCreatedTime(Date createdTime) 
    {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime() 
    {
        return createdTime;
    }
    public void setCreater(String creater) 
    {
        this.creater = creater;
    }

    public String getCreater() 
    {
        return creater;
    }
    public void setPicker(String picker) 
    {
        this.picker = picker;
    }

    public String getPicker() 
    {
        return picker;
    }
    public void setAuditor(String auditor) 
    {
        this.auditor = auditor;
    }

    public String getAuditor() 
    {
        return auditor;
    }
    public void setHousingId(Long housingId) 
    {
        this.housingId = housingId;
    }

    public Long getHousingId() 
    {
        return housingId;
    }
    public void setHousingTime(Date housingTime) 
    {
        this.housingTime = housingTime;
    }

    public Date getHousingTime() 
    {
        return housingTime;
    }
    public void setCuringState(String curingState) 
    {
        this.curingState = curingState;
    }

    public String getCuringState() 
    {
        return curingState;
    }
    public void setCuringTime(Long curingTime) 
    {
        this.curingTime = curingTime;
    }

    public Long getCuringTime() 
    {
        return curingTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("model", getModel())
            .append("length", getLength())
            .append("type", getType())
            .append("spec", getSpec())
            .append("thicknessSplice", getThicknessSplice())
            .append("isConnectible", getIsConnectible())
            .append("connectibleCount", getConnectibleCount())
            .append("connectionType", getConnectionType())
            .append("slicerModel", getSlicerModel())
            .append("workingTime", getWorkingTime())
            .append("transmittingState", getTransmittingState())
            .append("storageState", getStorageState())
            .append("storageLocation", getStorageLocation())
            .append("createdTime", getCreatedTime())
            .append("creater", getCreater())
            .append("picker", getPicker())
            .append("auditor", getAuditor())
            .append("housingId", getHousingId())
            .append("housingTime", getHousingTime())
            .append("curingState", getCuringState())
            .append("curingTime", getCuringTime())
            .toString();
    }
}
