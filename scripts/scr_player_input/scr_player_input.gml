function scr_player_input(){
	move_x     = keyboard_check(vk_right) - keyboard_check(vk_left); 
	pulo_press = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up); 
	pulo_hold  = keyboard_check(vk_space) or keyboard_check(vk_up);
	baixo      = keyboard_check(vk_down);
	ataque     = keyboard_check_pressed(ord("Z")); 
	tiro       = keyboard_check_pressed(ord("C"));

	// Se atirando, não anda nem pula
	if (estado == Estado.Atirando) {
	    move_x = 0;
	    pulo_press = false;
	    pulo_hold = false;
	}

	// Buffer de pulo
	if (pulo_press) buffer_timer = global.PlayerStats.buffer_max;
}