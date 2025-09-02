if (instance_exists(oPlayer)) {
    // Posiciona a arma junto do player
    x = oPlayer.x + offsetX * oPlayer.image_xscale;
    y = oPlayer.y + offsetY;
    image_xscale = oPlayer.image_xscale;
}