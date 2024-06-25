-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema snowswapdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `snowswapdb` ;

-- -----------------------------------------------------
-- Schema snowswapdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `snowswapdb` DEFAULT CHARACTER SET utf8 ;
USE `snowswapdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `postal_code` INT(5) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `update_at` DATETIME NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `bio` VARCHAR(1000) NULL,
  `image_url` VARCHAR(2000) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `resort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resort` ;

CREATE TABLE IF NOT EXISTS `resort` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `website` VARCHAR(1000) NULL,
  `image_url` TEXT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resort_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_resort_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride` ;

CREATE TABLE IF NOT EXISTS `ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sponsor_id` INT NOT NULL,
  `departure_address_id` INT NOT NULL,
  `arrival_address_id` INT NOT NULL,
  `resort_id` INT NULL,
  `image_url` TEXT NULL,
  `detail` VARCHAR(1000) NULL,
  `departure` DATETIME NOT NULL,
  `vehicle_capacity` INT(2) NULL,
  `vehicle_make` VARCHAR(45) NULL,
  `vehicle_model` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_user1_idx` (`sponsor_id` ASC),
  INDEX `fk_ride_address1_idx` (`departure_address_id` ASC),
  INDEX `fk_ride_resort1_idx` (`resort_id` ASC),
  INDEX `fk_ride_address2_idx` (`arrival_address_id` ASC),
  CONSTRAINT `fk_ride_user1`
    FOREIGN KEY (`sponsor_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_address1`
    FOREIGN KEY (`departure_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_resort1`
    FOREIGN KEY (`resort_id`)
    REFERENCES `resort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_address2`
    FOREIGN KEY (`arrival_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `event_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_type` ;

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` TEXT NULL,
  `name` TEXT NULL,
  `description` TEXT NULL,
  `event_start` DATETIME NOT NULL,
  `event_end` DATETIME NULL,
  `location_description` TEXT NULL,
  `user_id` INT NOT NULL,
  `event_type_id` INT NULL,
  `address_id` INT NOT NULL,
  `active` TINYINT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_user1_idx` (`user_id` ASC),
  INDEX `fk_event_event_type1_idx` (`event_type_id` ASC),
  INDEX `fk_event_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type1`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `event_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trail` ;

CREATE TABLE IF NOT EXISTS `trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `difficulty` VARCHAR(45) NULL,
  `resort_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_resort1_idx` (`resort_id` ASC),
  CONSTRAINT `fk_trail_resort1`
    FOREIGN KEY (`resort_id`)
    REFERENCES `resort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `lift_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lift_type` ;

CREATE TABLE IF NOT EXISTS `lift_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `lift`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lift` ;

CREATE TABLE IF NOT EXISTS `lift` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `lift_type_id` INT NOT NULL,
  `resort_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lift_lift_type1_idx` (`lift_type_id` ASC),
  INDEX `fk_lift_resort1_idx` (`resort_id` ASC),
  CONSTRAINT `fk_lift_lift_type1`
    FOREIGN KEY (`lift_type_id`)
    REFERENCES `lift_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lift_resort1`
    FOREIGN KEY (`resort_id`)
    REFERENCES `resort` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `event_attendee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_attendee` ;

CREATE TABLE IF NOT EXISTS `event_attendee` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `lift_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lift_status` ;

CREATE TABLE IF NOT EXISTS `lift_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `occurrence_date` DATETIME NULL,
  `status` VARCHAR(50) NULL,
  `lift_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lift_status_lift1_idx` (`lift_id` ASC),
  CONSTRAINT `fk_lift_status_lift1`
    FOREIGN KEY (`lift_id`)
    REFERENCES `lift` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `traill_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `traill_status` ;

CREATE TABLE IF NOT EXISTS `traill_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `occurrence_date` DATETIME NULL,
  `status` VARCHAR(50) NULL,
  `trail_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_traill_status_trail1_idx` (`trail_id` ASC),
  CONSTRAINT `fk_traill_status_trail1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_content` TEXT NULL,
  `created_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SET SQL_MODE = '';
DROP USER IF EXISTS genuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'genuser'@'localhost' IDENTIFIED BY 'genuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'genuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `phone_number`) VALUES (1, '509 Copper Rd', 'Frisco', 'Colorado', 80443, '866-841-2549');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `phone_number`) VALUES (2, '6701 W Alameda Ave', 'Lakewood', 'Colorado', 80226, '235-324-5324');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `phone_number`) VALUES (3, '10001 Minaret Rd', 'Mammoth Lakes', 'CA', 93546, '800.MAMMOTH');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `phone_number`) VALUES (4, '1 Sun Valley Rd', 'Sun Valley', 'Idaho', 83353, '(888) 490-5950');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `update_at`, `first_name`, `last_name`, `bio`, `image_url`, `address_id`) VALUES (1, 'admin', 'sspass', 1, 'admin', '2024-03-13', '2024-03-20', 'Kim', 'Possible', 'A high school cheerleader moonlighting as a teenage crime fighter, special agent, and spy.', 'https://static.wikia.nocookie.net/theunitedorganizationtoonsheroes/images/b/b3/Kim_Possible_portrait.jpg/revision/latest?cb=20170430000636', 2);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `update_at`, `first_name`, `last_name`, `bio`, `image_url`, `address_id`) VALUES (2, 'NatureLover23', 'Green2024!', 1, 'mod', '2024-04-23 09:42:15', NULL, 'Emma', 'Johnson', 'Passionate about nature and wildlife conservation. Always looking for new ways to protect our planet and promote sustainability.', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `update_at`, `first_name`, `last_name`, `bio`, `image_url`, `address_id`) VALUES (3, 'TechEnthusiast99', 'CodeGeek2024@', 1, 'standard', '2024-04-23 14:57:38', NULL, 'Alex', 'Smith', 'Technology enthusiast and software developer. Love exploring new gadgets and tinkering with code. Building the future, one line at a time.', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_at`, `update_at`, `first_name`, `last_name`, `bio`, `image_url`, `address_id`) VALUES (4, 'FoodieAdventurer', 'YummyFood123', 1, 'standard', '2024-04-23 21:10:04', NULL, 'Mia', 'Chen', 'Foodie and avid traveler. Always on the hunt for delicious cuisine and hidden culinary gems around the world. Life motto: Eat well, travel often.', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resort`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `resort` (`id`, `address_id`, `name`, `website`, `image_url`, `description`) VALUES (1, 1, 'Copper Mountain', 'https://www.coppercolorado.com/', NULL, '\nLocated in the heart of the Colorado Rockies, Copper Mountain Resort offers premier skiing and snowboarding experiences across its expansive 2,450-acre terrain. With abundant snowfall and diverse trails catering to all skill levels, it\'s a haven for winter sports enthusiasts. Beyond the slopes, visitors can enjoy a vibrant village atmosphere, complete with dining, shopping, and entertainment options.');
INSERT INTO `resort` (`id`, `address_id`, `name`, `website`, `image_url`, `description`) VALUES (2, 3, 'Mammoth Mountain', 'https://www.mammothmountain.com/', 'https://www.mammothmountain.com/_next/image?url=%2F-%2Fmedia%2Fproject%2Fmammoth%2Fhp_images%2Fseasonal_stats%2F7x10%2F2021-12-17_mm_cp_decemberstorm_jpeg_0012_945x1350.jpg%3Fh%3D1350%26iar%3D0%26w%3D945%26rev%3Ddce17fc688194490a9b13bd4847d71cd%26hash%3D8DD76A1E5E57614C5A121858ABC591B3&w=1200&q=75', 'Perched majestically in the Sierra Nevada range of California, Mammoth Mountain Resort is a premier destination for skiing and snowboarding enthusiasts. Boasting over 3,500 acres of skiable terrain and a summit elevation of 11,053 feet, it offers breathtaking views and unparalleled winter sports experiences. With an average annual snowfall of over 400 inches, Mammoth guarantees excellent conditions throughout the season. Beyond the slopes, visitors can explore charming alpine villages, indulge in diverse dining options, and discover a variety of outdoor adventures, making Mammoth Mountain a year-round destination for adventure seekers and nature lovers alike.');
INSERT INTO `resort` (`id`, `address_id`, `name`, `website`, `image_url`, `description`) VALUES (3, 4, 'Sun Valley Resort', 'https://www.sunvalley.com/', 'https://www.sunvalley.com/azure/sunvalley/media/sunvalley/hd-files/homepage/carousel-world-class-skiing.jpg?w=560&h=800&mode=crop&scale=both&anchor=&quality=75', 'Nestled amidst the stunning landscapes of central Idaho, Sun Valley Resort beckons outdoor enthusiasts with its legendary skiing and outdoor recreational opportunities. With over 2,000 acres of skiable terrain and abundant sunshine, it\'s a haven for winter sports enthusiasts seeking pristine slopes and breathtaking mountain vistas. Beyond skiing and snowboarding, Sun Valley offers a wealth of year-round activities, including hiking, mountain biking, and world-class golfing. The resort\'s charming village boasts fine dining, upscale shopping, and vibrant cultural events, creating an unforgettable experience for visitors seeking adventure and relaxation in the heart of the Rocky Mountains.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `ride` (`id`, `sponsor_id`, `departure_address_id`, `arrival_address_id`, `resort_id`, `image_url`, `detail`, `departure`, `vehicle_capacity`, `vehicle_make`, `vehicle_model`, `active`, `created_at`, `updated_at`) VALUES (1, 1, 2, 1, 1, 'https://corporate.homedepot.com/sites/default/files/image_gallery/Company_Home%20Depot_Storefront.jpg', 'Meet up infront of home depot', '2024-11-12 08:00', 6, 'Kia', 'Rondo', 1, '2024-04-12 13:00', '2024-04-20 13:00');
INSERT INTO `ride` (`id`, `sponsor_id`, `departure_address_id`, `arrival_address_id`, `resort_id`, `image_url`, `detail`, `departure`, `vehicle_capacity`, `vehicle_make`, `vehicle_model`, `active`, `created_at`, `updated_at`) VALUES (2, 2, 2, 1, 2, NULL, NULL, '2024-09-25 09:00:00', 7, 'Ford', 'Explorer', 1, '2024-04-12 13:00', NULL);
INSERT INTO `ride` (`id`, `sponsor_id`, `departure_address_id`, `arrival_address_id`, `resort_id`, `image_url`, `detail`, `departure`, `vehicle_capacity`, `vehicle_make`, `vehicle_model`, `active`, `created_at`, `updated_at`) VALUES (3, 3, 2, 1, 1, NULL, NULL, '2024-09-10 11:00:00', 5, 'Toyota', 'Camry', 1, '2024-04-12 13:00', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `event_type` (`id`, `type`) VALUES (1, 'Meetup');
INSERT INTO `event_type` (`id`, `type`) VALUES (2, 'Board Waxing');
INSERT INTO `event_type` (`id`, `type`) VALUES (3, 'Slush Cup Competition');
INSERT INTO `event_type` (`id`, `type`) VALUES (4, 'Big Air Competition');
INSERT INTO `event_type` (`id`, `type`) VALUES (5, 'Snowball Fight');
INSERT INTO `event_type` (`id`, `type`) VALUES (6, 'Community Cleanup');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `event` (`id`, `image_url`, `name`, `description`, `event_start`, `event_end`, `location_description`, `user_id`, `event_type_id`, `address_id`, `active`, `created_at`, `updated_at`) VALUES (1, 'https://cdn.ski/seq5OnNnD6LfpXu0.jpg', 'Group get together', 'Let\'s enjoy the slopes together.\"\n\n\n\n\n\n\n', '2024-05-14 09:00', '2024-04-14 17:00', 'In the lobby of Copper Mountain', 1, 1, 1, 1, '2024-04-14 09:00', '2024-04-14 10:00');
INSERT INTO `event` (`id`, `image_url`, `name`, `description`, `event_start`, `event_end`, `location_description`, `user_id`, `event_type_id`, `address_id`, `active`, `created_at`, `updated_at`) VALUES (2, NULL, 'Snowboarder\'s Slush Cup', 'Prepare for a splash-tastic event as riders attempt to skim across a giant pool of slush on their snowboards! Whether you make it across or take a chilly dip, it\'s guaranteed to be a hilarious and unforgettable experience.', '2024-07-15 12:00:00', '2024-07-15 16:00:00', NULL, 3, 3, 1, 1, '2024-08-05 10:00:00', NULL);
INSERT INTO `event` (`id`, `image_url`, `name`, `description`, `event_start`, `event_end`, `location_description`, `user_id`, `event_type_id`, `address_id`, `active`, `created_at`, `updated_at`) VALUES (3, NULL, 'Snowboarder\'s Big Air Bash', 'Get ready to catch some serious air at the Snowboarder\'s Big Air Bash! Watch as riders soar through the sky, performing jaw-dropping tricks and stunts that will leave you breathless. It\'s an adrenaline-fueled spectacle you won\'t want to miss.', '2024-08-05 10:00:00', '2024-08-05 18:00:00', NULL, 4, 4, 1, 1, '2024-08-05 10:00:00', NULL);
INSERT INTO `event` (`id`, `image_url`, `name`, `description`, `event_start`, `event_end`, `location_description`, `user_id`, `event_type_id`, `address_id`, `active`, `created_at`, `updated_at`) VALUES (4, NULL, 'Snowboarder\'s Snowball Fight', 'Let the snowball battle begin! Join us for a friendly (but competitive) snowball fight on the slopes. Gather your team, build your forts, and prepare to unleash a flurry of snowballs in this epic showdown.', '2024-09-10 11:00:00', '2024-09-10 15:00:00', NULL, 2, 5, 1, 1, '2024-08-05 10:00:00', NULL);
INSERT INTO `event` (`id`, `image_url`, `name`, `description`, `event_start`, `event_end`, `location_description`, `user_id`, `event_type_id`, `address_id`, `active`, `created_at`, `updated_at`) VALUES (5, NULL, 'Snowboarder\'s Slope Cleanup Crew', 'Help keep our slopes pristine! Join fellow snowboarders for a day of volunteer work as we clean up litter and debris from the mountain. Together, we can make a difference and ensure our beloved slopes stay beautiful for generations to come.', '2024-09-25 09:00:00', '2024-09-25 13:00:00', NULL, 3, 6, 1, 1, '2024-08-05 10:00:00', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (1, '17 Glade', 'Most Difficult', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (2, 'American Flyer', 'More Difficult', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (3, 'Bridgeway', 'Easiest', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (4, 'Carefree (L)', 'More Difficult', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (5, 'Lower Enchanted Forest', 'Extreme Terrain', 1);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (6, 'AGEE\'S RUN\n\n', 'Most Difficult', 2);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (7, 'ANDY\'S DOUBLE GOLD\n\n', 'Most Difficult', 2);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (8, 'APPLE PIE', 'Easiest', 2);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (9, 'ARRIBA (LOWER)\n\n', 'More Difficult', 2);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (10, 'ARRIBA (UPPER)\n\n', 'More Difficult', 2);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (11, 'CLIMAX', 'Extreme', 3);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (12, 'THE HEMLOCKS\n\n', 'More Difficult', 3);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (13, 'SKYLINE', 'Most Difficult', 3);
INSERT INTO `trail` (`id`, `name`, `difficulty`, `resort_id`) VALUES (14, 'SURPRISE', 'Extreme', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lift_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `lift_type` (`id`, `type`) VALUES (1, 'Telemix');
INSERT INTO `lift_type` (`id`, `type`) VALUES (2, 'Double');
INSERT INTO `lift_type` (`id`, `type`) VALUES (3, 'Triple');
INSERT INTO `lift_type` (`id`, `type`) VALUES (4, 'Quad');
INSERT INTO `lift_type` (`id`, `type`) VALUES (5, '6-Person');
INSERT INTO `lift_type` (`id`, `type`) VALUES (6, 'Carpet');
INSERT INTO `lift_type` (`id`, `type`) VALUES (7, 'Surface');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lift`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (1, 'American Eagle', 1, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (2, 'American Flyer', 5, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (3, 'Excelerator', 4, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (4, 'Kokomo Express', 4, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (5, 'Lumberjack', 3, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (6, 'Rugrat', 6, 1);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (7, 'BROADWAY EXPRESS 1', 5, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (8, 'GOLD RUSH EXPRESS 10', 2, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (9, 'FACE LIFT EXPRESS 3', 4, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (10, 'STUMP ALLEY EXPRESS 2\n\n', 4, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (11, 'UNBOUND EXPRESS 6\n\n', 4, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (12, 'DISCOVERY EXPRESS 11\n\n', 4, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (13, 'CHAIR 12\n\n', 2, 2);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (14, 'CLOUD NINE EXPRESS 9\n\n', 5, 3);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (15, 'CHAIR 20\n\n', 3, 3);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (16, 'VILLAGE GONDOLA\n\n', 4, 3);
INSERT INTO `lift` (`id`, `name`, `lift_type_id`, `resort_id`) VALUES (17, 'CHAIR 25\n\n', 5, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_attendee`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `event_attendee` (`user_id`, `event_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lift_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `lift_status` (`id`, `occurrence_date`, `status`, `lift_id`) VALUES (1, '2024-04-19 08:00', 'Open', 1);
INSERT INTO `lift_status` (`id`, `occurrence_date`, `status`, `lift_id`) VALUES (2, '2024-04-19 08:00', 'Closed', 3);
INSERT INTO `lift_status` (`id`, `occurrence_date`, `status`, `lift_id`) VALUES (3, '2024-04-19 08:00', 'On Hold', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `traill_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowswapdb`;
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (1, '2024-04-19 08:00', 'Open', 1);
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (2, '2024-04-19 08:00', 'Closed', 3);
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (3, '2024-04-19 08:00', 'Open', 4);
INSERT INTO `traill_status` (`id`, `occurrence_date`, `status`, `trail_id`) VALUES (4, '2024-04-19 08:00', 'On Hold', 2);

COMMIT;

