extends Node3D

@export var x_speed: float = 1.0
@export var y_speed: float = 1.0

func _input(event):
	var left_right: float = int(event.is_action("ui_left")) * -1 + int(event.is_action("ui_right"))
	self.move(x_speed * left_right, y_speed * float(event.is_action("ui_up")))

func move(x: float, y: float) -> void:
	self.position += Vector3(x, y, self.position.z)
