function scr_player_debug(){
	draw_set_color(c_black);
	draw_text(0, 0,
	    "Estado: " + string(estado) + "\n" +
	    "HS: " + string(hs) + "\n" +
	    "VS: " + string(vs) + "\n" +
	    "Coyote: " + string(coyote_timer) + "\n" +
	    "Buffer: " + string(buffer_timer) + "\n" +
	    "Cooldown Atk: " + string(ataque_cooldown) + "\n" +
	    "Cooldown Tiro: " + string(tiro_cooldown)
	);
}