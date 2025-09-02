if (place_meeting(x,y,oInimigo) && ataque_ativo == true) {
	ataque_ativo = false;
    other.vida -= ataque_dano;
	instance_destroy(self);
	show_debug_message("Acertou o Inimigo");
}
