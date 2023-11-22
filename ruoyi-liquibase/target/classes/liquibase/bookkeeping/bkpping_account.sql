--liquibase formatted sql

--changeset WangZhenPeng:bkpping_account-20220904-v1<修改create_user和modufy_user字段类型>
ALTER TABLE bkpping_account MODIFY column create_user VARCHAR(32);
ALTER TABLE bkpping_account MODIFY column modufy_user VARCHAR(32);



--changeset WangZhenPeng:bkpping_account-20220904-v2<修改modufy_user字段名称>
ALTER  TABLE bkpping_account CHANGE modufy_user modify_user VARCHAR(32);