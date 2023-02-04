extends Control

var resDisp = preload("res://UI/ResourceDisplay.tscn");
onready var hbox = $HBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	for type in CityManager.ResourceType:
		var display = resDisp.instance()
		hbox.add_child(display)
		display.setResource(CityManager.ResourceType[type])
