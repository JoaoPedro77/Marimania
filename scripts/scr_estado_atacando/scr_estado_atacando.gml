function scr_estado_atacando(){
	image_speed = 1;
	ataque_timer--;

	if (ataque_timer == 10) {
	    ataque_ativo = true;
	    with(oPointArma) visible = true;
	}

	if (ataque_timer <= 0) {
	    ataque_ativo = false;
	    //with(oPointArma) visible = false;

	    if (!no_chao) estado = Estado.Pulo;
	    else if (abs(hs) > 0) estado = Estado.Andar;
	    else estado = Estado.Parado;
	}
}