function scr_estado_pulo(){
	image_speed = 1;
	if (image_index >= image_number - 1) {
	    image_index = image_number - 1;
	    image_speed = 0;
	}

	if (no_chao) {
	    if (abs(hs) > 0) estado = Estado.Andar;
	    else estado = Estado.Parado;
	}
	else if (ataque && baixo) {
	    estado = Estado.Pogo;
	    ataque_timer = global.PlayerStats.ataque_duracao;
	    vs = max(vs, 2);
	    ataque_ativo = true;
	    //with (oPointPogo) visible = true;
	}
	else if (ataque && ataque_cooldown <= 0) {
	    estado = Estado.Atacando;
	    ataque_timer = global.PlayerStats.ataque_duracao;
	    ataque_cooldown = global.PlayerStats.ataque_duracao + global.PlayerStats.ataque_cooldown_padrao;
	}
}