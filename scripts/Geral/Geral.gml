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

function plataforma_move(obj, velocidade, mover_x, mover_y, alvo_X, alvo_Y) {
    if (instance_exists(obj)) {
        with (obj) {
            if (!variable_instance_exists(id, "inicialX")) inicialX = x;
            if (!variable_instance_exists(id, "inicialY")) inicialY = y;

            if (mover_x) {
                if (!variable_instance_exists(id, "dirX")) dirX = 1;
				
                x += velocidade * dirX;
				
                if (x >= alvo_X) { x = alvo_X; dirX = -1; }
				
                if (x <= inicialX) { x = inicialX; dirX = 1; }
            }

            if (mover_y) {
                if (!variable_instance_exists(id, "dirY")) dirY = 1;
				
                y += velocidade * dirY;
				
                if (y >= alvo_Y) { y = alvo_Y; dirY = -1; }
				
                if (y <= inicialY) { y = inicialY; dirY = 1; }
            }
        }
    }
}
