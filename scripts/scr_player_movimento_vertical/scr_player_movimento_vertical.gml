/// --- MOVIMENTO VERTICAL (com correção de canto) ---
function scr_player_movimento_vertical() {
    // Gravidade
    vs += global.PlayerStats.grav;
    vs = clamp(vs, -global.PlayerStats.pulo_vel, global.PlayerStats.queda_max);

    // Detecta chão (prévia)
    var estava_no_chao = no_chao;
    no_chao = (place_meeting(x, y, oSolido) || place_meeting(x, y, oPlat_colisao));

    // Coyote time
    if (no_chao) coyote_timer = global.PlayerStats.coyote_max;
    else if (coyote_timer > 0) coyote_timer--;

    var signx = sign(hs);
    var signy = sign(vs);
    var move  = min(abs(vs), 32);

    while (move > 0) {
        // colisão estritamente vertical (um pixel à frente no Y)
        var hit_vert = (place_meeting(x, y + signy, oSolido) || place_meeting(x, y + signy, oPlat_colisao));

        // --- CORREÇÃO DE CANTO ---
        // Se estamos subindo e temos velocidade horizontal, também checar a célula diagonal (x + signx, y + signy)
        var hit_corner = false;
        if (vs < 0 && signx != 0 && !hit_vert) {
            hit_corner = (place_meeting(x + signx, y + signy, oSolido) || place_meeting(x + signx, y + signy, oPlat_colisao));
        }

        if (!hit_vert && !hit_corner) {
            y += signy;
            move -= 1;
        } else {
            if (vs > 0) { // bateu no chão
                no_chao = true;
                coyote_timer = global.PlayerStats.coyote_max;
            } else if (vs < 0) { // bateu no teto / canto
                pulo_hold_timer = 0; // corta o pulo ao encostar
            }
            vs = 0;
            break;
        }
    }
}
