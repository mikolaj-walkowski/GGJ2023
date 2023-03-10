extends Node

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
	var layout = layout_tree(edges)
	
	for i in range(n):
		var selected_node = edges[i][1]
		var new_node = rootV2.instance()
		add_child(new_node)
		new_node.init(Vector2(layout[selected_node]), i, Root.TileTypes.ROAD)
	
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += " " + String(i.x) + " " + String(i.y)
	return s
	
func load_layout():
	var file = File.new()
	file.open("res://layout.json", File.READ)
	var data = parse_json(file.get_as_text())
	return data
	
func layout_tree(edges):
	print(edges)
	var string_edges = array_to_string(edges)
	print(string_edges)
	var stdout = []
	var exit = OS.execute("python", ["graph_layout.py", "%s" % string_edges], true, stdout)
	if exit == OK:
		var data = load_layout()
		return data
	else:
		print("Python error occured")
		return
		
		
		
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
				vertex_set[j] = -1
				edges.append(Vector2(j+1, prufer[i]))
				vertex_set[prufer[i] - 1] -= 1
				break
	 
	jw = 0
	var dupa_romana = 0
	var zupa_romana = 0
	for i in range(vertices):
		if (vertex_set[i] == 0 and jw == 0):
			dupa_romana = i +1
			jw += 1
		elif vertex_set[i] == 0 and jw == 1:
			zupa_romana = i + 1
	edges.append(Vector2(dupa_romana, zupa_romana))
	return edges
