class_name Root
extends Node2D

var tiletex = {
	"Town" : preload("res://Assets/Town.png"),
	"Res_A" : preload("res://Assets/Res_A.png"),
	"Res_B" : preload("res://Assets/Res_B.png"),
	"Road" : preload("res://Assets/Road.png"),
	"Null" : preload("res://Assets/Road.png"),
	}


var parent : Root
var distance : float
var children : Root 
onready var sprite = $Sprite
onready var road = $Line2D

func init(pos : Vector2, p : Root):
	parent = p
	position = pos
	distance = position.distance_to(parent.position)
	road.add_point(parent.position - position)
	road.add_point(Vector2(0,0))


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
