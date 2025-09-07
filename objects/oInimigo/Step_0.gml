if global.Mari_MalStats.vida <= 0 {
	instance_destroy(self)
}

no_chao = place_meeting(x,y, COL_OBJ) || no_chao = place_meeting(x,y, COL_PLAT)

if (!no_chao){
	vs = 2
	y += vs
}else{
	vs = 0
}