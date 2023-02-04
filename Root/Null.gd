extends Root

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func init(_pos : Vector2, _p : Root):
	.init(_pos, _p)
	sprite.set_texture(tiletex["Null"])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var click_radius = 100 # Size of the sprite.

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if (event.position - $Sprite2D.position).length() < click_radius and event.pressed:
			showUI()

func showUI():
	pass

