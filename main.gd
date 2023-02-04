extends Node

enum RootNames{
	TOWN,
	NULL,
	ROAD,
	RES_A,
	RES_B
}

var rootV2 = preload("res://RootV2/RootV2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = rootV2.instance()
	add_child(root)
	root.init(Vector2(0,0),null, Root.TileTypes.TOWN)
	var road = rootV2.instance()
	add_child(road)
	road.init(Vector2(200, 200), root, Root.TileTypes.ROAD)
	pass # Replace with function body.
