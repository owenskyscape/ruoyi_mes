package com.ruoyi.mes.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库位管理对象 mes_storage_manage
 * 
 * @author owen
 * @date 2021-12-27
 */
public class MesStorageManage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 库位 */
    private String code;

    /** 状态 */
    private String state;

    /** 建立时间 */
    private Date createdTime;

    /** 创建人 */
    private String creater;

    /** 修改时间 */
    private Date revisedTime;

    /** 修改人 */
    private String reviser;

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
    public void setState(String state) 
    {
        this.state = state;
    }

    public String getState() 
    {
        return state;
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
    public void setRevisedTime(Date revisedTime) 
    {
        this.revisedTime = revisedTime;
    }

    public Date getRevisedTime() 
    {
        return revisedTime;
    }
    public void setReviser(String reviser) 
    {
        this.reviser = reviser;
    }

    public String getReviser() 
    {
        return reviser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("state", getState())
            .append("createdTime", getCreatedTime())
            .append("creater", getCreater())
            .append("revisedTime", getRevisedTime())
            .append("reviser", getReviser())
            .toString();
    }
}
