extends MarginContainer

onready var button = $CenterContainer/Button
onready var panel = $CanvasLayer/MarginContainer/Panel
onready var confirm = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/MarginContainer/CenterContainer/confirm
onready var name_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/name_input
onready var notes_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/notes_input

func _ready(): 
	button.connect("pressed", self, "modify_exercise")
	confirm.connect("pressed", self, "confirm")
	panel.get_parent().hide()

func modify_exercise() -> void: panel.get_parent().show()

func confirm() -> void:
	var x = get_tree().get_nodes_in_group("main")
	# the last part of the array is a boolean that's true if it's a rest
	var y = [x[0].ex_count+x[0].re_count, self, name_input.text, notes_input.text, 0]
	x[0].set[String(name)] = y
	 
	panel.get_parent().hide()
