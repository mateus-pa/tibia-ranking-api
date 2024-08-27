/*
  Warnings:

  - You are about to drop the column `username` on the `player` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "player_username_key";

-- AlterTable
ALTER TABLE "player" DROP COLUMN "username";
