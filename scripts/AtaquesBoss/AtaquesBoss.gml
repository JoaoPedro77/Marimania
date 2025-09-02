function iniciar_ataque(tipo, duracao, obj) {
    attack_state = tipo;
    attack_timer = duracao;
    attack_object = obj;
}


function finalizar_ataque() {
    attack_state = "idle";
    attack_timer = 0;
    attack_cooldown = 90;
    attack_object = noone;
}


function executar_ataque1() {
    attack_timer--;

    if (attack_timer == 59) {
        with (attack_object) {
            x = -10;
            y = 350;
            speed = 10;
            direction = 0; // direita
        }
    }

    if (attack_object.x >= 1000) {
        with (attack_object) {
            x = 223.5;
            y = 206;
            speed = 0;
        }
        finalizar_ataque();
    }
}

function executar_ataque2L() {
    attack_timer--;

    if (attack_timer == 59) { 
        with (attack_object) {
            x = -10;
            y = 350;
            speed = 10;
            direction = 0; // direita
        }
    }

    if (attack_object.x >= 1000) {
        with (attack_object) {
            x = 223.5;
            y = 206;
            speed = 0;
        }
        finalizar_ataque();
    }
}

function executar_ataque2R() {
    attack_timer--;

    if (attack_timer == 59) {
        with (attack_object) {
            x = 1055;  
            y = 350;
            speed = 10;
            direction = 180; //esquerda
        }
    }

    if (attack_object.x <= 290) { 
        with (attack_object) {
            x = 1055;
            y = 206;
            speed = 0;
        }
        finalizar_ataque();
    }
}
