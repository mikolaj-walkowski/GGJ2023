extends Node

signal updateResourceValues 

enum ResourceType {
	A,
	B
}

var Resources = {
	ResourceType.A : 
	{
		rate = 0.1,
		currentCount = 0,
		maxCount = 1000,
	},
	ResourceType.B : 
	{
		rate = 0.1,
		currentCount = 0,
		maxCount = 1000,
	}
}


func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	for r in Resources:
		var res = Resources[r]
		if res.currentCount + delta * res.rate < res.maxCount:
			res.currentCount += delta * res.rate
		else:
			res.currentCount = res.maxCount
	emit_signal("updateResourceValues")

