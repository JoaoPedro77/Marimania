function scr_estado_parado(){
	image_speed = 1;

	if (!no_chao) estado = Estado.Pulo;
	else if (ataque && ataque_cooldown <= 0) {
	    estado = Estado.Atacando;
	    ataque_timer = global.PlayerStats.ataque_duracao;
	    ataque_cooldown = global.PlayerStats.ataque_duracao + global.PlayerStats.ataque_cooldown_padrao;
	}
	else if (tiro && tiro_cooldown <= 0) {
	    estado = Estado.Atirando;
	    tiro_timer = global.PlayerStats.tiro_duracao;
	    tiro_cooldown = global.PlayerStats.tiro_duracao + global.PlayerStats.tiro_cooldown_padrao;
	}
	else if (abs(hs) > 0) estado = Estado.Andar;
}