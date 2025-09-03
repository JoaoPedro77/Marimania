function scr_player_movimento_vertical(){
	// Gravidade
	vs += global.PlayerStats.grav;
	if (vs > global.PlayerStats.queda_max) vs = global.PlayerStats.queda_max;

	// Detecta chão
	var estava_no_chao = no_chao;
	no_chao = place_meeting(x, y + 1, COL_OBJ);

	// Coyote time
	if (no_chao) coyote_timer = global.PlayerStats.coyote_max;
	else if (coyote_timer > 0) coyote_timer--;

	// Colisão Y segura
	var signy = sign(vs);
	var move = abs(vs);
	while (move > 0) {
	    if (!place_meeting(x, y + signy, COL_OBJ)) {
	        y += signy;
	        move -= 1;
	    } else {
	        if (vs > 0) { 
	            no_chao = true;
	            coyote_timer = global.PlayerStats.coyote_max;
	        }
	        vs = 0;
	        break;
	    }
	}
}