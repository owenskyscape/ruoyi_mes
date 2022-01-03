package com.ruoyi.mes.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 板材批次对象 mes_board_batch
 * 
 * @author owen
 * @date 2021-12-27
 */
public class MesBoardBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 板材批次 */
    @Excel(name = "板材批次")
    private String mesBoardBatch;

    /** 创建人 */
    @Excel(name = "创建人")
    private String creater;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date creatingTime;

    /** 修改人 */
    @Excel(name = "修改人")
    private String modifier;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modified;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMesBoardBatch(String mesBoardBatch) 
    {
        this.mesBoardBatch = mesBoardBatch;
    }

    public String getMesBoardBatch() 
    {
        return mesBoardBatch;
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
    public void setModifier(String modifier) 
    {
        this.modifier = modifier;
    }

    public String getModifier() 
    {
        return modifier;
    }
    public void setModified(Date modified) 
    {
        this.modified = modified;
    }

    public Date getModified() 
    {
        return modified;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("mesBoardBatch", getMesBoardBatch())
            .append("creater", getCreater())
            .append("creatingTime", getCreatingTime())
            .append("modifier", getModifier())
            .append("modified", getModified())
            .toString();
    }
}
