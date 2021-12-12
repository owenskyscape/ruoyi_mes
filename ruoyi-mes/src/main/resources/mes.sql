drop table if exists mes_production_order;
create table mes_production_order
(
    id               bigint primary key not null auto_increment comment '主键',
    layer_number     int comment '层数',
    code             varchar(64) comment '晶体编号',
    model            varchar(64) comment '型号',
    spec             varchar(64) comment '规格',
    up_resistivity   double(10, 2) comment '中心电阻率（上）',
    down_resistivity double(10, 2) comment '中心电阻率（下）',
    up_resistance    double(10, 2) comment '表皮电阻（上）',
    down_resistance  double(10, 2) comment '表皮电阻（下）',
    min_dia          int comment '直径（最小）',
    max_dia          int comment '直径（最大）',
    up_life          int comment '寿命（上）',
    down_life        int comment '寿命（下）',
    pass_length      int comment '合格长度mm',
    weight           double(10, 2) comment '重量kg',
    min_margin       double(10, 2) comment '边距MIN',
    max_margin       double(10, 2) comment '边距MAX',
    remark           text comment '备注',
    in_level         varchar(8) comment '入库等级',
    resistivity      varchar(16) comment '电阻率',
    in_store_data    datetime comment '入库日期',
    heat_number      int comment '炉号',
    area             varchar(16) comment '区域'
) engine = innodb
  charset = utf8 comment = '生产指令';
