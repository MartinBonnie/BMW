use bmw;
ALTER TABLE `bmw_user`
ADD COLUMN `audit`  varchar(2) NULL AFTER `last_ip`;