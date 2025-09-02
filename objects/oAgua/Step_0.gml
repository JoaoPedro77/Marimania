/// Movimento horizontal
x += hs * direcao
/// Movimento vertical
vs += grav;
y += vs;


if (place_meeting(x,y, oSolido)) {
	instance_destroy(self)
	show_debug_message("destruir")
};

