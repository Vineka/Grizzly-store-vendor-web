CREATE TABLE `test`.`vendordetails` (
  `vendor_name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NULL,
  `mobile` BIGINT NULL,
  `rating` FLOAT NULL,
  `address` VARCHAR(150) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`vendor_name`));
INSERT INTO `test`.`vendordetails` (`vendor_name`, `password`, `mobile`, `rating`, `address`, `status`) VALUES ('Vineka', 'vineram', '9876543210', '4.5', 'Madurai', 'unlock');
INSERT INTO `test`.`vendordetails` (`vendor_name`, `password`, `mobile`, `rating`, `address`, `status`) VALUES ('Ram Ganesh', 'ramu', '9632584107', '4.5', 'Madurai', 'unlock');
INSERT INTO `test`.`vendordetails` (`vendor_name`, `password`, `mobile`, `rating`, `address`, `status`) VALUES ('John Doe', 'john', '8546791230', '3.7', 'Lorem ipsum dolor sit amet, condwcteture adipiscing elit, sed diam nonummy nibh', 'unlock');

CREATE TABLE `test`.`vendor_quantity_table` (
  `product_name` VARCHAR(45) NOT NULL,
  `offer` VARCHAR(45) NULL DEFAULT '0.0',
  `instock` INT NULL DEFAULT 0,
  `buffer` INT NULL DEFAULT 0,
  `pending` INT NULL DEFAULT NULL,
  PRIMARY KEY (`product_name`));

INSERT INTO `test`.`vendor_quantity_table` (`product_name`, `offer`, `instock`, `buffer`) VALUES ('Trimmer', '-15%', '34', '45');
INSERT INTO `test`.`vendor_quantitiy_table` (`product_name`, `offer`, `instock`, `buffer`) VALUES ('Shaver', '-5%', '23', '10');
INSERT INTO `test`.`vendor_quantitiy_table` (`product_name`, `offer`, `instock`, `buffer`) VALUES ('Macbook  Pro', '0.0', '15', '5');
INSERT INTO `test`.`vendor_quantitiy_table` (`product_name`, `offer`, `instock`, `buffer`) VALUES ('iMac 27', '0.0', '12', '5');
INSERT INTO `test`.`vendor_quantitiy_table` (`product_name`, `offer`, `instock`, `buffer`) VALUES ('MicronPens', '-45%', '60', '75');
INSERT INTO `test`.`vendor_quantitiy_table` (`product_name`, `offer`, `instock`, `buffer`) VALUES ('Paint Makers', '-10%', '45', '60');


UPDATE `test`.`vendor_quantity_table`
SET
`product_name` = 'Paint Makers',
`offer` = '-4%',
`instock` = 13,
`buffer` = 20,
`pending` = 4
WHERE `product_name` = 'Paint Makers';

DELETE FROM `test`.`vendor_quantity_table`
WHERE product_name='Shaver';

DELETE FROM `test`.`product`
WHERE product_name='Shaver';
