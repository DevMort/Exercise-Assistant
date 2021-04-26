extends Control

export (PackedScene) var exercise_scene
export (PackedScene) var rest_scene

onready var add_exercise_button = $VBoxContainer/MarginContainer/HBoxContainer/add_exerise
onready var add_rest_button = $VBoxContainer/MarginContainer/HBoxContainer/add_rest
onready var grid = $VBoxContainer/MarginContainer2/GridContainer
onready var start_button = $VBoxContainer/MarginContainer3/CenterContainer/start

var ex_count : int = 0
var re_count : int = 0
var set : Dictionary = {}
var p : int = 0 # for tracking the indeces when loading at startup

func _ready():
	load_sets()
	Global.set = {}
	
	add_exercise_button.connect("pressed", self, "add_exercise")
	add_rest_button.connect("pressed", self, "add_rest")
	start_button.connect("pressed", self, "start")

func add_exercise() -> void:
	var e = exercise_scene.instance()
	grid.add_child(e)
	ex_count += 1
	e.button.text = String(ex_count)

func add_rest() -> void:
	var r = rest_scene.instance()
	grid.add_child(r)
	re_count += 1
	r.button.text = String(re_count)

func start() -> void:
	if ex_count != 0:
		Global.set = set
		
		save()
		
		get_tree().change_scene("res://Exercise Area.tscn")

func save() -> void:
	var f = File.new()
	f.open("user://sets.emp", File.WRITE)
	
	f.store_string(to_json(set))
	
	f.close()

func load_sets() -> void:
	var f = File.new()
	if not f.file_exists("user://sets.emp"):
		return
	f.open("user://sets.emp", File.READ)
	
	var data = parse_json(f.get_as_text())
	set = data
	
	while p != data.size():
		p += 1
		for k in data:
			if data[k][0] == p:
				if not data[k][data[k].size() - 1]:
					var e = exercise_scene.instance()
					ex_count += 1
					grid.add_child(e)
					
					e.button.text = String(ex_count)
					e.name_input.text = data[k][1]
					e.notes_input.text = data[k][2]
					
					set[String(e.name)][0] = p
				else:
					var r = rest_scene.instance()
					re_count += 1
					grid.add_child(r)
					
					r.button.text = String(re_count)
					r.minutes_input.text = String(data[k][1])
					r.seconds_input.text = String(data[k][2])
					
					set[String(r.name)][0] = p
		
	f.close()
