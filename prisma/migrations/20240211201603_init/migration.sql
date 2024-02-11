-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userName` VARCHAR(191) NOT NULL,
    `fristname` VARCHAR(191) NOT NULL,
    `lastname` VARCHAR(191) NOT NULL,
    `age` INTEGER NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `user_email_key`(`email`),
    UNIQUE INDEX `user_password_key`(`password`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rent_date` DATE NOT NULL,
    `status` ENUM('Done', 'Pending', 'Ongoing', 'Cancelled') NOT NULL,
    `userId` INTEGER NOT NULL,
    `cameraId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `camera` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cameraName` VARCHAR(191) NOT NULL,
    `cameraType` VARCHAR(191) NOT NULL,
    `price` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shipping` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `phone` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `rentId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `shipping_phone_key`(`phone`),
    UNIQUE INDEX `shipping_address_key`(`address`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `paymentDate` DATETIME(3) NOT NULL,
    `paymentAmount` VARCHAR(191) NOT NULL,
    `rentId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reveiw` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `comment` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,
    `rentId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `rent` ADD CONSTRAINT `rent_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rent` ADD CONSTRAINT `rent_cameraId_fkey` FOREIGN KEY (`cameraId`) REFERENCES `camera`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `shipping` ADD CONSTRAINT `shipping_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `shipping` ADD CONSTRAINT `shipping_rentId_fkey` FOREIGN KEY (`rentId`) REFERENCES `rent`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_rentId_fkey` FOREIGN KEY (`rentId`) REFERENCES `rent`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reveiw` ADD CONSTRAINT `reveiw_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reveiw` ADD CONSTRAINT `reveiw_rentId_fkey` FOREIGN KEY (`rentId`) REFERENCES `rent`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
