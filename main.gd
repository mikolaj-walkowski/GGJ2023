extends Node

enum RootNames{
	TOWN,
	NULL,
	ROAD,
	RES_A,
	RES_B
}

var Roots = {
	RootNames.ROAD : preload("res://root/Road/Road.tscn"),
	RootNames.TOWN : preload("res://root/Town/Town.tscn"),
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = Roots[RootNames.TOWN].instance()
	add_child(root)
	root.init(Vector2(0,0),null)
	var road = Roots[RootNames.ROAD].instance()
	add_child(road)
	road.init(Vector2(200, 200), root)
	pass # Replace with function body.
