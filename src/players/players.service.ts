import { Injectable } from "@nestjs/common";
import { PrismaService } from "src/database/prisma.service";

@Injectable()
export class PlayersService {
	constructor(private readonly prisma: PrismaService) {}

	async findPlayerByEmail(email: string) {
		return await this.prisma.player.findFirst({
			where: {
				email
			}
		});
	}
}
