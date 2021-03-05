BEGIN;

CREATE TABLE `spring`.`productsList` (
                                         `id` INT NOT NULL,
                                         `title` VARCHAR(45) NOT NULL,
                                         `cost` VARCHAR(45) NOT NULL,
                                         PRIMARY KEY (`id`));
INSERT INTO `spring`.`productsList` (`id`, `title`, `cost`) VALUES ('1', 'Egg', '12');
INSERT INTO `spring`.`productsList` (`id`, `title`, `cost`) VALUES ('2', 'Milk', '54');
INSERT INTO `spring`.`productsList` (`id`, `title`, `cost`) VALUES ('3', 'Potato', '43');
INSERT INTO `spring`.`productsList` (`id`, `title`, `cost`) VALUES ('4', 'Sugar', '21');
INSERT INTO `spring`.`productsList` (`id`, `title`, `cost`) VALUES ('5', 'Coffee', '86');

CREATE TABLE `spring`.`customer` (
                                     `id` INT NOT NULL,
                                     `customer` VARCHAR(45) NOT NULL,
                                     PRIMARY KEY (`id`));
INSERT INTO `spring`.`customer` (`id`, `customer`) VALUES ('1', 'Nikolay');
INSERT INTO `spring`.`customer` (`id`, `customer`) VALUES ('2', 'Peter');
INSERT INTO `spring`.`customer` (`id`, `customer`) VALUES ('3', 'Natalia');

CREATE TABLE `spring`.`shoplist` (
                                     `id` INT NOT NULL,
                                     PRIMARY KEY (`id`),
                                     CONSTRAINT `idCustomer`
                                         FOREIGN KEY (`id`)
                                             REFERENCES `spring`.`customer` (`id`)
                                             ON DELETE NO ACTION
                                             ON UPDATE NO ACTION,
                                     CONSTRAINT `idProduct`
                                         FOREIGN KEY (`id`)
                                             REFERENCES `spring`.`productslist` (`id`)
                                             ON DELETE NO ACTION
                                             ON UPDATE NO ACTION);



COMMIT;


