--liquibase formatted sql

--changeset WangZhenPeng:bkpping_account_detail-20220904-v1<修改create_user和modufy_user字段类型>
ALTER TABLE bkpping_account_detail MODIFY column create_user VARCHAR(32);
ALTER TABLE bkpping_account_detail MODIFY column modify_user VARCHAR(32);

