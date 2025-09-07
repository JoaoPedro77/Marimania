if (oPlayer.ataque_ativo == true && duracao_ataque >= 0) {
	oPlayer.ataque_ativo = false
    global.Mari_MalStats.vida -= ataque_dano;
}
