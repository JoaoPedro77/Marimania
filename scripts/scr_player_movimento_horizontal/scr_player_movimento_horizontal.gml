function scr_player_movimento_horizontal(){
	if (move_x != 0) {
	    hs += move_x * global.PlayerStats.acel;
	    hs = clamp(hs, -global.PlayerStats.vel_max, global.PlayerStats.vel_max);
	} else {
	    if (abs(hs) <= global.PlayerStats.desacel) hs = 0;
	    else hs -= sign(hs) * global.PlayerStats.desacel;
	}

	// Colisão X segura
	var signx = sign(hs);
	var move = abs(hs);
	while (move > 0) {
	    if (!place_meeting(x + signx, y, COL_OBJ)) {
	        x += signx;
	        move -= 1;
	    } else {
	        hs = 0;
	        break;
	    }
	}
}