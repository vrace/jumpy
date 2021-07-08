extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var touching = false
var force_length = 0
var to_be_force = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("stand")
	pass # Replace with function body.

func _process(delta):
	if touching:
		force_length += delta
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			force_length = 0
			to_be_force = Vector2()
			touching = true
		elif event.button_index == 1 and not event.is_pressed():
			var player_position = self.get_global_transform_with_canvas().get_origin() - Vector2(0, 25)
			var vec = (event.position - player_position).normalized()
			to_be_force = vec * (force_length * 500)
			print("force:", to_be_force)
			touching = false

func _integrate_forces(state):
	if to_be_force != Vector2():
		apply_central_impulse(to_be_force)
		to_be_force = Vector2()
	if Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector2(0, -10))
