/*
  Warnings:

  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Orders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Store` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Category";

-- DropTable
DROP TABLE "Orders";

-- DropTable
DROP TABLE "Products";

-- DropTable
DROP TABLE "Store";

-- DropTable
DROP TABLE "Users";

-- CreateTable
CREATE TABLE "users" (
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
CREATE TABLE "products" (
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
CREATE TABLE "orders" (
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
CREATE TABLE "category" (
    "categoryUuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "store" (
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
CREATE UNIQUE INDEX "users_userUuid_key" ON "users"("userUuid");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "products_productUuid_key" ON "products"("productUuid");

-- CreateIndex
CREATE UNIQUE INDEX "orders_orderUuid_key" ON "orders"("orderUuid");

-- CreateIndex
CREATE UNIQUE INDEX "category_categoryUuid_key" ON "category"("categoryUuid");

-- CreateIndex
CREATE UNIQUE INDEX "store_storeUuid_key" ON "store"("storeUuid");
