cameraUPD()

var heal = keyboard_check_pressed(ord("H"))
var reset = keyboard_check_pressed(ord("R"))

if (heal) global.PlayerStats.vida +=1
if (reset) game_restart()

