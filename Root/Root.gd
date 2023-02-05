class_name Root
extends Node2D

enum TileTypes{
	TOWN,
	RES_A,
	RES_B,
	ROAD,
	NULL
}

#var tiletex = {
#	"Town" : preload("res://Assets/Town.png"),
#	"Res_A" : preload("res://Assets/Res_A.png"),
#	"Res_B" : preload("res://Assets/Res_B.png"),
#	"Road" : preload("res://Assets/Road.png"),
#	"Null" : preload("res://Assets/Null.png"),
#	}


var texture : Texture = preload("res://Assets/Null.png")

func init():
	pass

func showUI():
	pass

func _ready():
	pass 

func input(event):
	pass
