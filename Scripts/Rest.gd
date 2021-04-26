extends MarginContainer

onready var button = $CenterContainer/Button
onready var panel = $CanvasLayer/MarginContainer/Panel
onready var confirm = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/MarginContainer/CenterContainer/confirm
onready var minutes_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/HBoxContainer/minutes
onready var seconds_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/HBoxContainer/seconds

var minutes : String = ""
var seconds : String = ""

func _ready(): 
	button.connect("pressed", self, "modify_exercise")
	confirm.connect("pressed", self, "confirm")
	panel.get_parent().hide()

func modify_exercise() -> void: panel.get_parent().show()

func confirm() -> void:
	minutes = minutes_input.text
	seconds = seconds_input.text
	 
	panel.get_parent().hide()
