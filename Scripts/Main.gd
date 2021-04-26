extends Control

export (PackedScene) var exercise_scene

onready var add_exercise_button = $VBoxContainer/MarginContainer/HBoxContainer/add_exerise
onready var grid = $VBoxContainer/MarginContainer2/GridContainer

func _ready():
	add_exercise_button.connect("pressed", self, "add_exercise")

func add_exercise() -> void:
	var e = exercise_scene.instance()
	grid.add_child(e)
