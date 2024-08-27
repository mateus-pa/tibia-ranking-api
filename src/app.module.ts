import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { PrismaModule } from "./database/prisma.module";
import { PlayersModule } from "./players/players.module";

@Module({
	imports: [ConfigModule.forRoot(), PlayersModule, PrismaModule]
})
export class AppModule {}
