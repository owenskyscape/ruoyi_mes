package com.ruoyi.mes.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 入库信息对象 mes_warehousing_info
 * 
 * @author owen
 * @date 2022-01-03
 */
public class MesWarehousingInfo extends BaseEntity
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

    /** 入库时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入库时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date warehousingTime;

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
    public void setWarehousingTime(Date warehousingTime) 
    {
        this.warehousingTime = warehousingTime;
    }

    public Date getWarehousingTime() 
    {
        return warehousingTime;
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
            .append("warehousingTime", getWarehousingTime())
            .toString();
    }
}
