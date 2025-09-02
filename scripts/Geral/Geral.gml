/// @function mover_y(alvo, vel)
/// @param alvo Objeto ou instância que vai se mover
/// @param vel  Velocidade no eixo Y (pode ser positiva ou negativa)

/// @function tomar_dano(alvo, dano)
/// @param alvo   Objeto ou instância
/// @param dano   Quanto de dano aplicar

function tomar_dano(alvo, dano) {
    if (instance_exists(alvo)) {
        with (alvo) {
            if (variable_instance_exists(id, "vida")) {
                vida -= dano;
            }
        }
    }
}

/// @function rodar(alvo, rodar)
/// @param alvo   Objeto ou instância
/// @param rodar  Intensidade da oscilação em graus

function rodar(alvo, rodar) {
    if (instance_exists(alvo)) {
        with (alvo) {
            // Variáveis iniciais
            if (!variable_instance_exists(id, "angle_base")) {
                angle_base = image_angle;
                rodar_timer = 0;
            }

            // Atualiza o timer
            rodar_timer += 0.09; // controla a velocidade da oscilação

            // Oscila suavemente
            image_angle = angle_base + sin(rodar_timer) * rodar;
        }
    }
}