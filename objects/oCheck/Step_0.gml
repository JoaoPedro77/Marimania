if (instance_exists(oInimigo)) {
    x = oInimigo.x + offsetX * oInimigo.image_xscale;
    y = oInimigo.y + offsetY;
    image_xscale = 1
}

if (place_meeting(x,y, oSolido) || (place_meeting(x,y, oPlat_colisao))){
	chao = true
}else {chao = false}

show_debug_message(chao)