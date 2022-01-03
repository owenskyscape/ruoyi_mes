package com.ruoyi.mes.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库存盘点对象 mes_crystal_check
 * 
 * @author owen
 * @date 2022-01-03
 */
public class MesCrystalCheck extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 库位号 */
    @Excel(name = "库位号")
    private String storageLocation;

    /** 晶棒编号 */
    @Excel(name = "晶棒编号")
    private String crystalCode;

    /** 采集晶棒编号 */
    private String code1;

    /** 采集型号 */
    private String model1;

    /** 采集长度 */
    private Long length1;

    /** 采集类型 */
    private String type1;

    /** 采集规格 */
    private String spec1;

    /** 采集片厚 */
    private String thicknessSplice1;

    /** 采集是否拼棒 */
    private String isConnectible1;

    /** 采集拼棒数 */
    private Long connectibleCount1;

    /** 采集拼棒类型 */
    private String connectionType1;

    /** 采集切片机型 */
    private String slicerModel1;

    /** 采集进线时间 */
    private Date workingTime1;

    /** 采集流转状态 */
    private String transmittingState1;

    /** 采集库存状态 */
    private Long storageState1;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStorageLocation(String storageLocation) 
    {
        this.storageLocation = storageLocation;
    }

    public String getStorageLocation() 
    {
        return storageLocation;
    }
    public void setCrystalCode(String crystalCode) 
    {
        this.crystalCode = crystalCode;
    }

    public String getCrystalCode() 
    {
        return crystalCode;
    }
    public void setCode1(String code1) 
    {
        this.code1 = code1;
    }

    public String getCode1() 
    {
        return code1;
    }
    public void setModel1(String model1) 
    {
        this.model1 = model1;
    }

    public String getModel1() 
    {
        return model1;
    }
    public void setLength1(Long length1) 
    {
        this.length1 = length1;
    }

    public Long getLength1() 
    {
        return length1;
    }
    public void setType1(String type1) 
    {
        this.type1 = type1;
    }

    public String getType1() 
    {
        return type1;
    }
    public void setSpec1(String spec1) 
    {
        this.spec1 = spec1;
    }

    public String getSpec1() 
    {
        return spec1;
    }
    public void setThicknessSplice1(String thicknessSplice1) 
    {
        this.thicknessSplice1 = thicknessSplice1;
    }

    public String getThicknessSplice1() 
    {
        return thicknessSplice1;
    }
    public void setIsConnectible1(String isConnectible1) 
    {
        this.isConnectible1 = isConnectible1;
    }

    public String getIsConnectible1() 
    {
        return isConnectible1;
    }
    public void setConnectibleCount1(Long connectibleCount1) 
    {
        this.connectibleCount1 = connectibleCount1;
    }

    public Long getConnectibleCount1() 
    {
        return connectibleCount1;
    }
    public void setConnectionType1(String connectionType1) 
    {
        this.connectionType1 = connectionType1;
    }

    public String getConnectionType1() 
    {
        return connectionType1;
    }
    public void setSlicerModel1(String slicerModel1) 
    {
        this.slicerModel1 = slicerModel1;
    }

    public String getSlicerModel1() 
    {
        return slicerModel1;
    }
    public void setWorkingTime1(Date workingTime1) 
    {
        this.workingTime1 = workingTime1;
    }

    public Date getWorkingTime1() 
    {
        return workingTime1;
    }
    public void setTransmittingState1(String transmittingState1) 
    {
        this.transmittingState1 = transmittingState1;
    }

    public String getTransmittingState1() 
    {
        return transmittingState1;
    }
    public void setStorageState1(Long storageState1) 
    {
        this.storageState1 = storageState1;
    }

    public Long getStorageState1() 
    {
        return storageState1;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("storageLocation", getStorageLocation())
            .append("crystalCode", getCrystalCode())
            .append("code1", getCode1())
            .append("model1", getModel1())
            .append("length1", getLength1())
            .append("type1", getType1())
            .append("spec1", getSpec1())
            .append("thicknessSplice1", getThicknessSplice1())
            .append("isConnectible1", getIsConnectible1())
            .append("connectibleCount1", getConnectibleCount1())
            .append("connectionType1", getConnectionType1())
            .append("slicerModel1", getSlicerModel1())
            .append("workingTime1", getWorkingTime1())
            .append("transmittingState1", getTransmittingState1())
            .append("storageState1", getStorageState1())
            .toString();
    }
}
