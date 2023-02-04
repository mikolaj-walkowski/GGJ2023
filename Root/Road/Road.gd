extends Root

func init(_pos : Vector2, _p : Root):
	.init(_pos,_p)
	sprite.set_texture(tiletex["Road"])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
