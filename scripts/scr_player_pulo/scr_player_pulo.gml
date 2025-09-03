function scr_player_pulo(){
	// Pulo com buffer + coyote
	if (buffer_timer > 0 && coyote_timer > 0) {
	    vs = -global.PlayerStats.pulo_vel;
	    buffer_timer = 0;
	    pulo_hold_timer = global.PlayerStats.pulo_hold_max;
	    no_chao = false;
	}

	// Altura variável do pulo
	if (vs < 0) {
	    if (pulo_hold && pulo_hold_timer > 0) {
	        pulo_hold_timer--;
	        vs += global.PlayerStats.grav * 0.2;
	    } else {
	        vs += global.PlayerStats.grav * 0.9;
	    }
	} else {
	    pulo_hold_timer = 0;
	}

	// Timer
	buffer_timer = max(0, buffer_timer - 1);
}