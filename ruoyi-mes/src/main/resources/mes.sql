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


-- 配棒库表
drop table if exists mes_matchingpost;
create table mes_matchingpost
(
    id                  bigint primary key not null auto_increment comment '主键',
    production_order_id bigint             not null comment '晶棒ID',
    match_date          varchar(16) comment '配棒日期',
    match_time          varchar(16) comment '配棒时间',
    numbers             varchar(16) comment '根数',
    length              double(10, 2) comment '检棒总长mm',
    effective_length    double(10, 2) comment '有效总长mm',
    thick               varchar(16) comment '厚片',
    create_user         varchar(16) comment '配棒人员',
    size_scope          varchar(16) comment '尺寸范围'
) engine = innodb
  charset = utf8 comment = '配棒库表';

-- 粘棒
drop table if exists mes_glue_stick;
create table mes_glue_stick
(
    id                  bigint primary key not null auto_increment comment '主键',
    production_order_id bigint             not null comment '晶棒ID',
    glue_stick_date     varchar(16) comment '粘棒日期',
    team                varchar(16) comment '班组',
    person              varchar(16) comment '粘棒人员',
    viscose_time        varchar(16) comment '粘胶时间',
    boiled_glue_batch   varchar(16) comment '水煮胶厂家批次',
    viscose_batch       varchar(16) comment '粘棒胶厂家批次',
    glue_stick_batch    varchar(16) comment '粘棒板厂家批次',
    boiled_glue_dosage  varchar(16) comment '水煮胶用量',
    a_dosage            varchar(16) comment 'A粘棒胶用量',
    b_dosage            varchar(16) comment 'B粘棒胶用量',
    length              double(10, 2) comment '粘棒板长度mm',
    material            varchar(16) comment '粘棒板材质',
    tray_batch          varchar(16) comment '晶托编号'
) engine = innodb
  charset = utf8 comment = '粘棒库表';

-- 切片
drop table if exists mes_slice;
create table mes_slice
(
    id                   bigint primary key not null auto_increment comment '主键',
    production_order_id  bigint             not null comment '晶棒ID',
    date                 varchar(16) comment ' 切片日期',
    team                 varchar(16) comment ' 班组',
    slot_pitch           double(10, 2) comment ' 槽距',
    theory_numbers       int comment ' 理论切片数',
    boot_dose            int comment ' 开机线量',
    operation_user       varchar(16) comment ' 上棒操作工',
    start_time           datetime comment ' 上棒开机时间',
    glue_stick_loss      double(10, 2) comment ' 粘棒损失mm',
    main_roller_time     varchar(16) comment ' 主辊时间',
    inducer_batch        varchar(16) comment ' 导轮厂家批次',
    guide_time           datetime comment ' 导向轮时间',
    steel_wire_spec      varchar(16) comment ' 钢线规格',
    steel_wire_batch     varchar(16) comment ' 钢线厂家批次',
    steel_wire_code      varchar(16) comment ' 钢线编号',
    knife_no             int comment ' 刀次',
    cutting_fluid_batch  varchar(16) comment ' 切割液厂家批次',
    cutting_fluid_dosage int comment ' 切割液用量',
    offline_numbers      int comment ' 断线次数',
    add_cut_flag         bit comment ' 是否加切',
    knife_use_dosage     int comment ' 本刀用线量',
    under_user           varchar(16) comment ' 下棒操作工',
    under_time           datetime comment ' 下棒时间',
    timeout_remark       text comment ' 超时备注',
    offline_reason       text comment ' 断线原因',
    offline_remark       text comment ' 断线描述'

) engine = innodb
  charset = utf8 comment = '切片库表';

-- 清洗
drop table if exists mes_cleaning;
create table mes_cleaning
(
    id                  bigint primary key not null auto_increment comment '主键',
    production_order_id bigint             not null comment '晶棒ID',
    slice_id            bigint             not null comment '切片ID', -- 因为有个刀次，考虑下是否需要？
    degumming_time      datetime comment '脱胶日期',
    batch_no            varchar(32) comment '班次',
    degumming_machine   varchar(32) comment '脱胶机台',
    degumming_user      varchar(32) comment '脱胶员',
    degumming_batch     varchar(32) comment '脱胶剂厂家批次',
    knife_no            varchar(32) comment '刀次',
    slice_loss          double(10, 2) comment '切片损失mm',
    cleaning_line       varchar(32) comment '清洗线别',
    cleaning_user       varchar(32) comment '清洗员',
    in_piece_count      int comment '进片数',
    out_piece_count     int comment '出片数',
    cleaning_batch      varchar(32) comment '清洗剂厂家批次',
    numbers             int comment '次数',
    degumming_baloss    double(10, 2) comment '脱胶损失'
) engine = innodb
  charset = utf8 comment = '清洗库表';

-- 捡包
drop table if exists mes_production_order_check;
create table mes_production_order_check
(
    id                  bigint primary key not null auto_increment comment '主键',
    production_order_id bigint             not null comment '晶棒ID',
    check_date          datetime comment '检验日期',
    batch               varchar(32) comment '班组',
    machine             varchar(32) comment '机台',
    receive_numbers     varchar(32) comment '接收片数',
    operation_user      varchar(32) comment '上料员',
    cleaning_loss       int comment '清洗损失',
    sorting_user        varchar(32) comment '分选员',
    machine_loss        varchar(32) comment '机选损失',
    package_user        varchar(32) comment '打包人员',
    qc                  varchar(32) comment 'QC',
    error_project       varchar(32) comment '异常项目',
    wafer_location      varchar(32) comment '硅片位置（单片）',
    crystal_location    varchar(32) comment '晶棒位置（单刀）',
    remark              text comment '异常描述备注：'


) engine = innodb
  charset = utf8 comment = '捡包表';

-- 捡包明细
drop table if exists mes_production_order_check_detail;
create table mes_production_order_check_detail
(
    id                        bigint primary key not null auto_increment comment '主键',
    production_order_id       bigint             not null comment '晶棒ID',
    production_order_check_id bigint             not null comment '捡包ID',
    type                      varchar(32) comment '等级',
    a_numbers                 int comment 'A片数',
    high_resistance           int comment '高电阻',
    low_resistance            int comment '低电阻',
    a_size                    int comment 'A尺寸',
    a2_line                   varchar(32) comment '"A2轻线痕"',
    b2_line                   varchar(32) comment 'B2崩边',
    knife_side                varchar(32) comment '入刀侧面崩边',
    b3                        varchar(32) comment '"B3TTV"',
    b4                        varchar(32) comment 'B4脏污',
    b5                        varchar(32) comment 'B5色差',
    c1ttv                     varchar(32) comment 'C1线痕TTV',
    c2                        varchar(32) comment 'C2崩边缺角',
    c7                        varchar(32) comment '"C7隐裂',
    dc                        varchar(32) comment '直流',
    double_disc               varchar(32) comment '双片',
    other                     varchar(32) comment '其他'
) engine = innodb
  charset = utf8 comment = '捡包明细';