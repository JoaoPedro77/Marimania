/// --- MOVIMENTO HORIZONTAL ---
function scr_player_movimento_horizontal() {
    // Aceleração / Desaceleração
    if (move_x != 0) {
        hs += move_x * global.PlayerStats.acel;
        hs = clamp(hs, -global.PlayerStats.vel_max, global.PlayerStats.vel_max);
    } else {
        if (abs(hs) <= global.PlayerStats.desacel) hs = 0;
        else hs -= sign(hs) * global.PlayerStats.desacel;
    }

    // Movimento seguro em X (limite para evitar loops gigantes)
    var signx = sign(hs);
    var move = min(abs(hs), 32);
    while (move > 0) {
        if (!place_meeting(x + signx, y, oSolido) && !place_meeting(x + signx, y, oPlat_colisao)) {
            x += signx;
            move -= 1;
        } else {
            hs = 0;
            break;
        }
    }
}