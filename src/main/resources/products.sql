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

COMMIT;


