extends Node2D


onready var states = {
	Root.TileTypes.NULL : $Null,
	Root.TileTypes.RES_A : $Res_A,
	Root.TileTypes.RES_B : $Res_B,
	Root.TileTypes.ROAD : $Road,
	Root.TileTypes.TOWN : $Town,
}

enum RoadState {
	BUILD,
	NOTBUILD
}

onready var roadTextures = {
	RoadState.BUILD : preload("res://Assets/Road.png"),
	RoadState.NOTBUILD : preload("res://Assets/Road.png")
}

onready var sprite = $Sprite
onready var road = $RoadSprite

var parent = null
var distance : float
var children = null

var built = RoadState.NOTBUILD 
var currState : Root

func _ready():
	pass # Replace with function body.

func init(pos : Vector2, p, TileType):
	parent = p
	position = pos
	if parent:
		distance = position.distance_to(parent.position)
	else:
		distance = 0
	currState = states[TileType]
	currState.init()
	sprite.set_texture(currState.texture)
	if parent:
		drawRoad()

func drawRoad():
	var delta = parent.position - position
	var alpha = asin(delta.x / delta.length())
	road.set_position((delta)/2)
	road.set_texture(roadTextures[built])
	var i = road.get_texture().get_size() #image size
	var th = delta.length()  #target height
	var tw = 50 #target width
	road.scale = Vector2((1/(i.x/tw)), (1/(i.y/th)))
	road.set_rotation(alpha)
	road.z_index = -1

func showUI():
	currState.showUI()

func _input(event):
	currState.input(event)
