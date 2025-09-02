// --- Física básica ---
grav          = 0.5;
queda_max     = 15;
pulo_vel      = 15;

// --- Movimento horizontal ---
acel          = 2;
desacel       = 2;
vel_max       = 7.0;

// --- Timers de polish ---
coyote_max    = 0.15 * room_speed;
buffer_max    = 0.10 * room_speed;
pulo_hold_max = 0.20 * room_speed;

// --- Estado de movimento ---
hs            = 0;
vs            = 0;
coyote_timer  = 0;
buffer_timer  = 0;
pulo_hold_timer = 0;
no_chao       = false;

// --- Estado e ataque ---
enum Estado { Parado, Andar, Pulo, Atacando, Atirando, Pogo }
estado          = Estado.Parado;
estado_anterior = Estado.Parado;

// --- Ataque ---
ataque_duracao  = 30;
ataque_timer    = 0;
ataque_cooldown = 0;
ataque_ativo    = false;

// --- Pogo ---
rebote_ativo    = false;
rebote_timer    = 0;
rebote_duracao  = 10;
pogo_rebote_vel = 18;

// --- Tiro ---
tiro_duracao    = 45;
tiro_timer      = 0;
tiro_cooldown   = 0;
tiro_spawn      = 0;

// --- Sprites ---
sIdle   = sPlayerIdle;
sWalk   = sPlayerAndando;
sJump   = sPlayerPulando;
sAttack = sPlayerAtacando;
sShot   = sPlayerAtirando;
sPogo   = sPlayerPogo;

// --- Colisão ---
COL_OBJ = oSolido;

// --- Escala inicial ---
escala_player = 0.15;
image_xscale  = escala_player;
image_yscale  = escala_player;
image_speed   = 1;

// --- Posição inicial ---
x = 90;
y = 400;


