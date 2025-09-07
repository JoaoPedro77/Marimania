if (tomou_dano == 0){
	global.PlayerStats.vida -=1
	if (hs >=1) x -= global.PlayerStats.kb
	if (hs <=-1) x += global.PlayerStats.kb
	tomou_dano = 50
}