// Estados
enum Estado { Parado, Andar, Pulo, Atacando, Atirando, Pogo }
estado = Estado.Parado;
estado_anterior = Estado.Parado;

// Velocidades
hs = 0;
vs = 0;

// Timers
coyote_timer = 0;
buffer_timer = 0;
pulo_hold_timer = 0;
ataque_timer = 0;
ataque_cooldown = 0;
tiro_timer = 0;
tiro_cooldown = 0;
rebote_timer = 0;

// Flags
no_chao = false;
ataque_ativo = false;
rebote_ativo = false;

// Sprites
sIdle   = sPlayerIdle;
sWalk   = sPlayerAndando;
sJump   = sPlayerPulando;
sAttack = sPlayerAtacando;
sShot   = sPlayerAtirando;
sPogo   = sPlayerPogo;

// Escala inicial
escala_player = 0.15;
image_xscale  = escala_player;
image_yscale  = escala_player;

// Colisão
COL_OBJ = oSolido;

x = 90;
y = 400;
	