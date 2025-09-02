camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight);


var _cameraX = camera_get_view_x(view_camera[0]);
//var _cameraY = camera_get_view_y(view_camera[0]);


var _targetX = oPlayer.x - (global.cameraWidth * 0.5);
//var _targetY = oPlayer.y - (global.cameraHeight * 0.5);

camera_set_view_pos(view_camera[0], lerp(_cameraX, _targetX, 0.2), 0);
