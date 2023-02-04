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
	generate_tree(100)
	road.init(Vector2(200, 200), root, Root.TileTypes.ROAD)
	pass # Replace with function body.
	
func custom_sort(a: Vector2, b: Vector2):
	return a.x < b.x

func generate_tree(n: int):
	var length: int = n - 2
	var arr = [] 
	arr.resize(length)
	arr.fill(0)
	var rng = RandomNumberGenerator.new()
	randomize()
	for i in range(length):
		arr[i] = rng.randi_range(1, length+1)
	var edges = get_tree_edges(arr, length)
	edges.sort_custom(self, "custom_sort")
	print(edges)
	
	#tree_nodes = generate_coordinates(edges)
	
func generate_coordinates(edges):
	
	for edge in edges:
		pass
		
func get_tree_edges(prufer: Array, m: int):
	var vertices = m + 2
	var vertex_set = []
	var edges = []
	vertex_set.resize(vertices)
	vertex_set.fill(0)
	
	for i in range(vertices - 2):
		vertex_set[prufer[i] - 1] += 1
		
		
	var jw = 0
	for i in range(vertices - 2):
		for j in range(vertices): 
			jw = j
			if (vertex_set[j] == 0):
				 
				# Remove from Prufer set and print
				# pair.
				vertex_set[j] = -1
				edges.append(Vector2(j+1, prufer[i]))
				vertex_set[prufer[i] - 1] -= 1
				break
	 
	jw = 0
	var dupa_romana = 0
	var zupa_romana = 0
	# For the last element
	for i in range(vertices):
		if (vertex_set[i] == 0 and jw == 0):
			dupa_romana = i +1
			jw += 1
		elif vertex_set[i] == 0 and jw == 1:
			zupa_romana = i + 1
	edges.append(Vector2(dupa_romana, zupa_romana))
	return edges
	
