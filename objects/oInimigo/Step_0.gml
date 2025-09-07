// Se morrer, destrói
if (global.Mari_MalStats.vida <= 0) {
    instance_destroy(self);
}

// --- Gravidade / chão ---
no_chao = place_meeting(x, y, COL_OBJ) || place_meeting(x, y, COL_PLAT);

if (!no_chao) {
    vs = 15;
    y += vs;
} else {
    vs = 0;
}

// --- Movimento / perseguição ---
if (distance_to_object(oPlayer) <= 400 && oCheck.chao == true) {
    var movimento = "perseguir";

    if (movimento == "perseguir") {
        move_towards_point(oPlayer.x, y, 5);   
    }
} else {
    speed = 0;
}

if (oPlayer.x > x) {
            image_xscale = 0.15;   // olhando para a direita
        } else {
            image_xscale = -0.15;  // olhando para a esquerda
        }