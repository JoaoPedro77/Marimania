function cameraInit(){
	global.cameraWidth = 1280;
	global.cameraHeight = 720;
	global.windowScale = 2;

	window_set_size(global.cameraWidth * global.windowScale, global.cameraHeight * global.windowScale);
	surface_resize(application_surface, global.cameraWidth, global.cameraHeight);
	display_set_gui_size(global.cameraWidth, global.cameraHeight);

	window_center();

	camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight);
	view_enabled = true;
	view_visible[0] = true;

}

function cameraUPD(){

	var _cameraX = camera_get_view_x(view_camera[0]);
	//var _cameraY = camera_get_view_y(view_camera[0]);

	var _targetX = oPlayer.x - (global.cameraWidth * 0.5);
	//var _targetY = oPlayer.y - (global.cameraHeight * 0.5);

	// Limites para não passar do cenário
	_targetX = clamp(_targetX, 0, room_width - global.cameraWidth);
	//_targetY = clamp(_targetY, 0, room_height - global.cameraHeight);

	camera_set_view_pos(view_camera[0],lerp(_cameraX, _targetX, 0.2), 0);

}