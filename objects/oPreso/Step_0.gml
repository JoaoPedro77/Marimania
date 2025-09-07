if (instance_exists(oPlayer)) {
    x = oPlayer.x + offsetX * oPlayer.image_xscale;
    y = oPlayer.y + offsetY * oPlayer.image_yscale;
    image_xscale = 0.3;
	image_yscale = 1.5;
}

if (place_meeting(x, y, oPlat_colisao) || (place_meeting(x, y, oSolido))){
	preso = true
	if (preso){
		oPlayer.y -= 15
	}
	
{oPlayer.y -= 100; preso = false;}
show_debug_message(preso)
}

