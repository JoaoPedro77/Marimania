if (oPlayer.ataque_ativo == true && duracao_ataque >= 0) {
	oPlayer.ataque_ativo = false
    other.vida -= ataque_dano;
}
