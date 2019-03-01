CREATE TABLE `product` (
  `product_id` varchar(45) NOT NULL,
  `product_name` varchar(80) NOT NULL,
  `category` varchar(45) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `price` float NOT NULL,
  `brand` varchar(45) NOT NULL DEFAULT 'Philips',
  `rating` varchar(45) NOT NULL DEFAULT '4.5',
  PRIMARY KEY (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `test`.`product`
(`product_id`,
`product_name`,
`category`,
`description`,
`price`,
`brand`,
`rating`)
VALUES
('S16','Samsung'
,
'Mobiles',
'GOOD',
110000.00,
'Samsung Galaxy',
4.9);

SELECT `product`.`product_id`,
    `product`.`product_name`,
    `product`.`category`,
    `product`.`description`,
    `product`.`price`,
    `product`.`brand`,
    `product`.`rating`
FROM `test`.`product`;

DELETE FROM `test`.`product`
WHERE product_name='Lenovo';
select * from product;