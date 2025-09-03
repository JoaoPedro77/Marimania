function scr_estado_atirando(){
	image_speed = 1;
	tiro_timer--;

	if (tiro_timer == global.PlayerStats.tiro_duracao - 25) {
	    with (oPointTiro) {
	        instance_create_layer(x, y, "Player", oAgua);
	    }
	}

	if (tiro_timer <= 0) {
	    if (!no_chao) estado = Estado.Pulo;
	    else if (abs(hs) > 0) estado = Estado.Andar;
	    else estado = Estado.Parado;
	}
}