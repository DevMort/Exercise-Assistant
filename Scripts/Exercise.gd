extends MarginContainer

onready var button = $CenterContainer/Button
onready var panel = $CanvasLayer/MarginContainer/Panel
onready var confirm = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/MarginContainer/CenterContainer/confirm
onready var name_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/name_input
onready var notes_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/notes_input

var exercise_name : String = ""
var notes : String = ""

func _ready(): 
	button.connect("pressed", self, "modify_exercise")
	confirm.connect("pressed", self, "confirm")
	panel.get_parent().hide()

func modify_exercise() -> void: 
	button.disabled = true
	panel.get_parent().show()
func confirm() -> void:
	exercise_name = name_input.text
	notes = notes_input.text
	 
	panel.get_parent().hide()
	button.disabled = false
