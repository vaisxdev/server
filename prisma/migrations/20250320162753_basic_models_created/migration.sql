/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Users" (
    "userUuid" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "home_address" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "work_address" TEXT NOT NULL DEFAULT '',
    "role" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "Products" (
    "productUuid" TEXT NOT NULL,
    "storeUuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "quantity" INTEGER NOT NULL,
    "category" TEXT NOT NULL,
    "categoryUuid" TEXT NOT NULL,
    "imageUrl" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "isVeg" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "Orders" (
    "orderUuid" TEXT NOT NULL,
    "userUuid" TEXT NOT NULL,
    "productUuid" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "Category" (
    "categoryUuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "Store" (
    "storeUuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "imageUrl" TEXT[],
    "lattitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "storeRating" DOUBLE PRECISION NOT NULL,
    "storeReview" TEXT[]
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_userUuid_key" ON "Users"("userUuid");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Products_productUuid_key" ON "Products"("productUuid");

-- CreateIndex
CREATE UNIQUE INDEX "Orders_orderUuid_key" ON "Orders"("orderUuid");

-- CreateIndex
CREATE UNIQUE INDEX "Category_categoryUuid_key" ON "Category"("categoryUuid");

-- CreateIndex
CREATE UNIQUE INDEX "Store_storeUuid_key" ON "Store"("storeUuid");
