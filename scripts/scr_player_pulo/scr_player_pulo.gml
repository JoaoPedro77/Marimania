/// --- PULO ---
function scr_player_pulo() {
    // Pulo com buffer + coyote
    if (buffer_timer > 0 && coyote_timer > 0) {
        y -= 1; // evita colar no chão
        vs = -global.PlayerStats.pulo_vel;
        buffer_timer = 0;
        pulo_hold_timer = global.PlayerStats.pulo_hold_max;
        no_chao = false;
    }

    // Se está subindo
    if (vs < 0) {
        if (pulo_hold && pulo_hold_timer > 0) {
            // reduz a gravidade para prolongar o pulo
            pulo_hold_timer--;
            vs += global.PlayerStats.grav * 0.2;
        } else {
            // corta o pulo (resposta rápida ao soltar o botão)
            if (!pulo_hold && rebote_ativo == false) {
                vs = max(vs, -2); // garante que começa a cair logo
            }
            // aplica gravidade normal
            vs += global.PlayerStats.grav;
        }
    } else {
        pulo_hold_timer = 0; // reset se não estiver subindo
    }

    // Timer do buffer
    buffer_timer = max(0, buffer_timer - 1);
}
