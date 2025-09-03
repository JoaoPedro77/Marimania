function scr_player_timers(){

	// Cooldowns
	ataque_cooldown = max(0, ataque_cooldown - 1);
	tiro_cooldown   = max(0, tiro_cooldown - 1);

	// Rebote
	if (rebote_timer > 0) {
	    rebote_timer--;
	    if (rebote_timer <= 0) rebote_ativo = false;
	}

	// (Opcional) morte/reset fora da tela
	if (y >= 730 || y <= -10) {
	    room_restart();
	    show_debug_message("morreu");
	}
}