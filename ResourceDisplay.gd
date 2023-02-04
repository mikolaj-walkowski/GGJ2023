extends Control

var textures ={
	CityManager.ResourceType.A : preload("res://Assets/Res_A.png"),
	CityManager.ResourceType.B : preload("res://Assets/Res_B.png")
}
var type
onready var tex = $TopLeft/TextureRect
onready var maxLabel = $TopLeft/VBoxContainer/Max
onready var currLabel = $TopLeft/VBoxContainer/Current
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updateValues():
	maxLabel.text = str(CityManager.Resources[type].maxCount)
	currLabel.text = str(CityManager.Resources[type].currentCount)

func setResource(t):
	tex.set_texture(textures[t])
	type = t
	CityManager.connect("updateResourceValues",self,"updateValues")
