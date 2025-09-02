// --- INPUT ---
var move_x      = keyboard_check(vk_right) - keyboard_check(vk_left); 
var pulo_press  = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up); 
var pulo_hold   = keyboard_check(vk_space) or keyboard_check(vk_up);
var baixo		= keyboard_check(vk_down);
var ataque      = keyboard_check_pressed(ord("Z")); 
var tiro        = keyboard_check_pressed(ord("C")); 

// Se estiver atirando, não pode andar ou pular
if (estado == Estado.Atirando){
    move_x = 0;
    pulo_press = false;
    pulo_hold = false;
}

// Jump buffer
if (pulo_press) buffer_timer = buffer_max;


// --- TERRENO / CHÃO ---
var estava_no_chao = no_chao;
no_chao = place_meeting(x, y + 1, COL_OBJ);

// Coyote time
if (no_chao) coyote_timer = coyote_max;
else if (coyote_timer > 0) coyote_timer--;


// --- MOVIMENTO HORIZONTAL ---
if (move_x != 0) {
    hs += move_x * acel;
    hs = clamp(hs, -vel_max, vel_max);
} else {
    if (abs(hs) <= desacel) hs = 0;
    else hs -= sign(hs) * desacel;
}

// --- Colisão X segura ---
var signx = sign(hs);
var move = abs(hs);
while (move > 0) {
    if (!place_meeting(x + signx, y, COL_OBJ)) {
        x += signx;
        move -= 1;
    } else {
        hs = 0;
        break;
    }
}


// --- MOVIMENTO VERTICAL ---
vs += grav;
if (vs > queda_max) vs = queda_max;

// Pulo com buffer + coyote
if (buffer_timer > 0 && coyote_timer > 0) {
    vs = -pulo_vel;
    buffer_timer = 0;
    pulo_hold_timer = pulo_hold_max;
    no_chao = false;
}

// Altura variável do pulo
if (vs < 0) {
    if (pulo_hold && pulo_hold_timer > 0) {
        pulo_hold_timer--;
        vs += grav * 0.2;
    } else {
        vs += grav * 0.9;
    }
} else pulo_hold_timer = 0;

// Colisão Y segura
var signy = sign(vs);
move = abs(vs);
while (move > 0) {
    if (!place_meeting(x, y + signy, COL_OBJ)) {
        y += signy;
        move -= 1;
    } else {
        if (vs > 0) { 
            no_chao = true;
            coyote_timer = coyote_max;
        }
        vs = 0;
        break;
    }
}

// --- TIMERS ---
buffer_timer = max(0, buffer_timer - 1);
ataque_cooldown = max(0, ataque_cooldown - 1);
tiro_cooldown = max(0, tiro_cooldown - 1);

// Timer de rebote
if (rebote_timer > 0) {
    rebote_timer--;
    if (rebote_timer <= 0) {
        rebote_ativo = false;
    }
}


// --- ESTADOS / ATAQUES ---

// --- POGO ---
if (ataque && baixo && !no_chao && estado != Estado.Pogo) {
    estado = Estado.Pogo;
	ataque_timer = ataque_duracao;
	vs = max(vs, 2); // acelera a queda
	ataque_ativo = true;

    // ativa oPointPogo para detectar
	with (oPointPogo) visible = true;}
else if (estado == Estado.Pogo) {
    ataque_timer--;

    var rebateu = false;

    // Percorre todos os inimigos usando herança
    with (oPogaveis) {
        if (point_in_rectangle(oPointPogo.x, oPointPogo.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
            if (variable_instance_exists(id, "pogoable") && pogoable) {
                if (variable_instance_exists(id, "vida")) {
                    vida -= 1;
                }
                rebateu = true;
            }
        }
    }

    // Aplica rebote
    if (rebateu && !other.rebote_ativo) {
        other.vs = -other.pogo_rebote_vel;
        other.rebote_ativo = true;
        other.rebote_timer = other.rebote_duracao;
    }

    // Finaliza pogo se tocar no chão ou tempo acabar
    if (no_chao || ataque_timer <= 0) {
		image_speed = 1;
        ataque_ativo = false;
        with (oPointPogo) visible = false;
        if (abs(hs) > 0) estado = Estado.Andar;
        else estado = Estado.Parado;
    }
}


// Ataque corpo a corpo
else if (ataque && ataque_cooldown <= 0 && estado != Estado.Atacando) {
    image_speed = 1;
    estado = Estado.Atacando;
    ataque_timer = ataque_duracao;
    ataque_cooldown = ataque_duracao + 18;

}

// Ataque à distância
else if (tiro && tiro_cooldown <= 0 && move_x == 0 && no_chao) {
    image_speed = 1;
    estado = Estado.Atirando;
    tiro_timer = tiro_duracao;
    tiro_cooldown = tiro_duracao + 100;
}

// Ataque corpo a corpo em andamento
else if (estado == Estado.Atacando) {
    image_speed = 1;
	ataque_timer--;
	if (ataque_timer ==10){
		ataque_ativo = true
		with(oPointArma){visible = true}
	}

    if (ataque_timer <= 0) {
		ataque_ativo = false
		with(oPointArma){visible = false}
        if (!no_chao) estado = Estado.Pulo;
        else if (abs(hs) > 0) estado = Estado.Andar;
        else estado = Estado.Parado;
    }
}

// Ataque de tiro em andamento
else if (estado == Estado.Atirando) {
    image_speed = 1;
    tiro_timer--;
	
	if (tiro_timer == 20){
		with(oPointTiro){
			instance_create_layer(x,y,"Player",oAgua)
		}
	}
	
    if (tiro_timer <= 0) {
        if (!no_chao) estado = Estado.Pulo;
        else if (abs(hs) > 0) estado = Estado.Andar;
        else estado = Estado.Parado;
    }
}

// Pulo
else if (estado == Estado.Pulo) {
    image_speed = 1;
    if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;
        if (no_chao) {
            estado = Estado.Parado;
            image_speed = 1;
        }
    }
}

// Estado normal
else {
	image_speed = 1;
    if (!no_chao) estado = Estado.Pulo;
    else if (abs(hs) > 0) estado = Estado.Andar;
    else estado = Estado.Parado;
}


// Reset Animações
if (estado != estado_anterior) {
    image_index = 0;
}
estado_anterior = estado;


// --- ANIMAÇÕES ---
switch(estado) {
    case Estado.Parado:   sprite_index = sIdle; break;
    case Estado.Andar:    sprite_index = sWalk; break;
	case Estado.Pogo:	  sprite_index = sPogo; break;
    case Estado.Pulo:     sprite_index = sJump; break;
    case Estado.Atacando: sprite_index = sAttack; break;
    case Estado.Atirando: sprite_index = sShot; break;
}

// Vira sprite
if (hs != 0) image_xscale = escala_player * sign(hs);

if (y >= 730 or y <= -10) {room_restart(); show_debug_message("morreu")};
