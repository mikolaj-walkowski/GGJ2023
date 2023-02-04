extends Root
func init(pos : Vector2, p : Root):
	position = pos
	distance = 0
	print(sprite)
	sprite.set_texture(tiletex["Town"])
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
