extends Node2D
#imsleepy

enum node_type {EMPTY, ROOT, ROAD, PRODUCTION} #whateber next
enum production_type {RESOURCE_1, RESOURCE_2, RESOURCE_3} #whtever next

var my_id: int
var my_type = node_type.EMPTY
var my_production_type

func _init(id: int, type: node_type, prod_type: production_type):
	my_id = id
	my_type = type
	my_production_type = prod_type
	
func build(selected_build: node_type, prod: production_type):
	match my_type:
		node_type.EMPTY:
			match selected_build:
				node_type.ROAD:
					build_road()
				node_type.PRODUCTION:
					build_production(prod)
		node_type.ROOT:
			pass
			#The fuck im doing with my life
		node_type.ROAD:
			destroy()
		node_type.PRODUCTION:
			destroy()
			
func build_road():
	my_type = node_type.ROAD
	#Set sprite?
		
func build_production(x: production_type):
	my_type = node_type.PRODUCTION
	my_production_type = x
	#Set sprite?
func destroy():
	my_type = node_type.EMPTY
	my_production_type = null
	#Set Sprite?

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
