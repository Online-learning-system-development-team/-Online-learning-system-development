--liquibase formatted sql

--changeset WangZhenPeng:bkpping_account_role-20220904-v1<新建表>
CREATE TABLE `bkpping_account_role`  (
                                         `account_id` int NOT NULL,
                                         `role_id` int NOT NULL,
                                         `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                         `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                         `create_time` timestamp(0) NULL DEFAULT NULL,
                                         `modify_time` timestamp(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;
