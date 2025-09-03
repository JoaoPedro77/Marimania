function scr_player_estados(){
	switch (estado) {
	    case Estado.Parado:   scr_estado_parado(); break;
	    case Estado.Andar:    scr_estado_andar(); break;
	    case Estado.Pulo:     scr_estado_pulo(); break;
	    case Estado.Atacando: scr_estado_atacando(); break;
	    case Estado.Atirando: scr_estado_atirando(); break;
	    case Estado.Pogo:     scr_estado_pogo(); break;
	}
}