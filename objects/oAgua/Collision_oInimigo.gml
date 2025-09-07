if (place_meeting(x,y,oInimigo) && ataque_ativo == true) {
	ataque_ativo = false;
    global.Mari_MalStats.vida -= ataque_dano;
	instance_destroy(self);
}
