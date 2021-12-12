/**
 * @Version V1.0
 * @Title: MesProductionOrderMapper.java
 * @Description:
 * @Author: DaiChao
 * <p>
 * Copyright(C) 2018-2019  NPlus
 * Company:   无锡核心信息科技有限公司
 * @Date: 2021/12/12 15:32
 * <p>
 * 修改历史:
 * Date                 Author        Version        Discription
 * -----------------------------------------------------------------------------------
 * 2021/12/12           DaiChao      1.0            初始化版本
 */
package com.ruoyi.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.MesProductionOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MesProductionOrderMapper extends BaseMapper<MesProductionOrder> {
}
