package com.ruoyi.mes.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 胶水批次对象 mes_glue_batch
 * 
 * @author owen
 * @date 2021-12-27
 */
public class MesGlueBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 胶水批次 */
    @Excel(name = "胶水批次")
    private String mesGlueBatch;

    /** 创建人 */
    private String creater;

    /** 创建时间 */
    private Date creatingTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMesGlueBatch(String mesGlueBatch) 
    {
        this.mesGlueBatch = mesGlueBatch;
    }

    public String getMesGlueBatch() 
    {
        return mesGlueBatch;
    }
    public void setCreater(String creater) 
    {
        this.creater = creater;
    }

    public String getCreater() 
    {
        return creater;
    }
    public void setCreatingTime(Date creatingTime) 
    {
        this.creatingTime = creatingTime;
    }

    public Date getCreatingTime() 
    {
        return creatingTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("mesGlueBatch", getMesGlueBatch())
            .append("creater", getCreater())
            .append("creatingTime", getCreatingTime())
            .toString();
    }
}
