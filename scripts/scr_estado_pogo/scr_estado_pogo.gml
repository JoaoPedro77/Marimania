function scr_estado_pogo(){
	ataque_timer--;

	var rebateu = false;

	with (oPogaveis) {
	    if (point_in_rectangle(oPointPogo.x, oPointPogo.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
	        if (variable_instance_exists(id, "pogoable") && pogoable) {
	            if (variable_instance_exists(id, "vida")) vida -= 1;
	            rebateu = true;
	        }
	    }
	}

	if (rebateu && !other.rebote_ativo) {
	    other.vs = -global.PlayerStats.pogo_rebote_vel;
	    other.rebote_ativo = true;
	    other.rebote_timer = global.PlayerStats.rebote_duracao;
	}

	if (no_chao || ataque_timer <= 0) {
	    image_speed = 1;
	    ataque_ativo = false;
	    //with (oPointPogo) visible = false;

	    if (abs(hs) > 0) estado = Estado.Andar;
	    else estado = Estado.Parado;
	}
}