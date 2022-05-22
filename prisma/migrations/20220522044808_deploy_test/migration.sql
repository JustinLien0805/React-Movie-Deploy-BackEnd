/*
  Warnings:

  - You are about to drop the `movie` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `rate` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `fk_Post_Movie1`;

-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `fk_Post_User1`;

-- DropForeignKey
ALTER TABLE `rate` DROP FOREIGN KEY `fk_User_has_Movie_Movie1`;

-- DropForeignKey
ALTER TABLE `rate` DROP FOREIGN KEY `fk_User_has_Movie_User1`;

-- DropTable
DROP TABLE `movie`;

-- DropTable
DROP TABLE `post`;

-- DropTable
DROP TABLE `rate`;

-- DropTable
DROP TABLE `user`;

-- CreateTable
CREATE TABLE `Movie` (
    `movie_id` INTEGER NOT NULL AUTO_INCREMENT,
    `poster` VARCHAR(225) NOT NULL,
    `rtScore` VARCHAR(45) NOT NULL,
    `imdbScore` VARCHAR(45) NOT NULL,
    `mName` VARCHAR(45) NOT NULL,
    `releaseYear` VARCHAR(45) NOT NULL,
    `director` VARCHAR(45) NOT NULL,
    `actor` VARCHAR(225) NOT NULL,
    `plot` VARCHAR(225) NOT NULL,
    `genre` VARCHAR(45) NOT NULL,

    UNIQUE INDEX `movie_id_UNIQUE`(`movie_id`),
    PRIMARY KEY (`movie_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Post` (
    `post_id` INTEGER NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(45) NULL,
    `User_user_id1` INTEGER NOT NULL,
    `Movie_movie_id` INTEGER NOT NULL,

    INDEX `fk_Post_Movie1_idx`(`Movie_movie_id`),
    INDEX `fk_Post_User1_idx`(`User_user_id1`),
    PRIMARY KEY (`post_id`, `User_user_id1`, `Movie_movie_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Rate` (
    `User_user_id` INTEGER NOT NULL,
    `Movie_movie_id` INTEGER NOT NULL,
    `rate_id` INTEGER NOT NULL AUTO_INCREMENT,
    `score` INTEGER NOT NULL,

    INDEX `fk_User_has_Movie_Movie1_idx`(`Movie_movie_id`),
    INDEX `fk_User_has_Movie_User1_idx`(`User_user_id`),
    PRIMARY KEY (`rate_id`, `User_user_id`, `Movie_movie_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `password` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `username` VARCHAR(45) NOT NULL,
    `phoneNumber` VARCHAR(45) NOT NULL,
    `is_admin` TINYINT NOT NULL,
    `dateOfBirth` VARCHAR(45) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_phoneNumber_key`(`phoneNumber`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Like` (
    `Post_post_id` INTEGER NOT NULL,
    `User_user_id` INTEGER NOT NULL,
    `like_id` INTEGER NOT NULL AUTO_INCREMENT,

    INDEX `fk_Post_has_User_Post1_idx`(`Post_post_id`),
    INDEX `fk_Post_has_User_User1_idx`(`User_user_id`),
    PRIMARY KEY (`like_id`, `Post_post_id`, `User_user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `fk_Post_Movie1` FOREIGN KEY (`Movie_movie_id`) REFERENCES `Movie`(`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `fk_Post_User1` FOREIGN KEY (`User_user_id1`) REFERENCES `User`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Rate` ADD CONSTRAINT `fk_User_has_Movie_Movie1` FOREIGN KEY (`Movie_movie_id`) REFERENCES `Movie`(`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Rate` ADD CONSTRAINT `fk_User_has_Movie_User1` FOREIGN KEY (`User_user_id`) REFERENCES `User`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Like` ADD CONSTRAINT `fk_Post_has_User_Post1` FOREIGN KEY (`Post_post_id`) REFERENCES `Post`(`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Like` ADD CONSTRAINT `fk_Post_has_User_User1` FOREIGN KEY (`User_user_id`) REFERENCES `User`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
