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

func _ready():
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

func _process(delta):
	print(set)

func start() -> void:
	if ex_count != 0:
		Global.set = set
		get_tree().change_scene("res://Exercise Area.tscn")
