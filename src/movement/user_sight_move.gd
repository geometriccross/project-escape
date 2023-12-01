extends Node3D

@export var ROTATE_TARGET: Camera3D
@export var SENSITIVITY: float = 0.01

# アキュムレータ
var rotation_x = 0
var rotation_y = 0

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton: 			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"): 	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	sight_rotate(event, Input.mouse_mode, ROTATE_TARGET, SENSITIVITY)

func sight_rotate(event: InputEvent, mouse_mode: int, camera: Camera3D, sensitivity: float) -> void:
	if event is InputEventMouseMotion and mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation_x -= event.relative.x * sensitivity
		rotation_y -= event.relative.y * sensitivity
		camera.transform.basis = Basis()
		
		camera.rotate_object_local(Vector3(0, 1, 0), rotation_x)
		camera.rotate_object_local(Vector3(1, 0, 0), rotation_y)
