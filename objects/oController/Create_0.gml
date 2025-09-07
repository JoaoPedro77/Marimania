cameraInit()

// Configurações globais do Player
global.PlayerStats = {
	// Vida
	vida: 6,
	pontos: 0,
	
    // Física
    grav: 0.5,
    queda_max: 20,
    pulo_vel: 16,

    // Movimento horizontal
    acel: 2,
    desacel: 2,
    vel_max: 7.0,

    // Timers
    coyote_max: 0.15 * room_speed,
    buffer_max: 0.15 * room_speed,
    pulo_hold_max: 0.50 * room_speed,

    // Ataque
    ataque_duracao: 30,
    ataque_cooldown_padrao: 18,

    // Pogo
    rebote_duracao: 5,
    pogo_rebote_vel: 18,

    // Tiro
    tiro_duracao: 45,
    tiro_cooldown_padrao: 100
};

global.Mari_MalStats = {
	// Vida
	vida: 3,
	
    // Física
    grav: 0.5,
    //queda_max: 20,
    //pulo_vel: 16,

    // Movimento horizontal
    acel: 2,
    desacel: 2,
    vel_max: 7.0,
};