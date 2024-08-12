-- CreateTable
CREATE TABLE "player" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "character" (
    "id" SERIAL NOT NULL,
    "nickname" TEXT NOT NULL,
    "level" INTEGER NOT NULL DEFAULT 1,
    "magicLevel" INTEGER NOT NULL DEFAULT 1,
    "swordFighting" INTEGER NOT NULL DEFAULT 10,
    "axeFighting" INTEGER NOT NULL DEFAULT 10,
    "clubFighting" INTEGER NOT NULL DEFAULT 10,
    "distanceFighting" INTEGER NOT NULL DEFAULT 10,
    "shielding" INTEGER NOT NULL DEFAULT 10,
    "fistFighting" INTEGER NOT NULL DEFAULT 10,
    "vocationId" INTEGER NOT NULL,
    "worldId" INTEGER NOT NULL,
    "playerId" INTEGER NOT NULL,

    CONSTRAINT "character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vocation" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "vocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "world" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "pvpType" TEXT NOT NULL,
    "capacity" INTEGER NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "world_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "player_username_key" ON "player"("username");

-- CreateIndex
CREATE UNIQUE INDEX "player_email_key" ON "player"("email");

-- CreateIndex
CREATE UNIQUE INDEX "character_nickname_key" ON "character"("nickname");

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_vocationId_fkey" FOREIGN KEY ("vocationId") REFERENCES "vocation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_worldId_fkey" FOREIGN KEY ("worldId") REFERENCES "world"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
