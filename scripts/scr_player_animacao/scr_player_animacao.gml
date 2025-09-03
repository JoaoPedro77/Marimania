function scr_player_animacao(){
	if (estado != estado_anterior) {
	    image_index = 0;
	}
	estado_anterior = estado;

	switch(estado) {
	    case Estado.Parado:   sprite_index = sIdle; break;
	    case Estado.Andar:    sprite_index = sWalk; break;
	    case Estado.Pogo:     sprite_index = sPogo; break;
	    case Estado.Pulo:     sprite_index = sJump; break;
	    case Estado.Atacando: sprite_index = sAttack; break;
	    case Estado.Atirando: sprite_index = sShot; break;
	}

	// Vira sprite
	if (hs != 0) image_xscale = escala_player * sign(hs);
}