extends MarginContainer

onready var button = $CenterContainer/Button
onready var panel = $CanvasLayer/MarginContainer/Panel
onready var confirm = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/MarginContainer/CenterContainer/confirm
onready var name_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/name_input
onready var notes_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/notes_input
onready var remove_button = $CanvasLayer/MarginContainer2/CenterContainer/remove

func _ready(): 
	button.connect("pressed", self, "modify_exercise")
	confirm.connect("pressed", self, "confirm")
	remove_button.connect("pressed", self, "remove")
	
	$CanvasLayer/MarginContainer2.hide()
	panel.get_parent().hide()

func modify_exercise() -> void: 
	$CanvasLayer/MarginContainer2.show()
	panel.get_parent().show()

func remove() -> void:
	var x = get_tree().get_nodes_in_group("main")
	x[0].ex_count -= 1
	x[0].set.erase(String(name))
	Global.set = x[0].set
	x[0].save()
	
	queue_free()

func confirm() -> void:
	var x = get_tree().get_nodes_in_group("main")
	# the last part of the array is a boolean that's true if it's a rest
	var y = [x[0].ex_count+x[0].re_count, name_input.text, notes_input.text, 0]
	x[0].set[String(name)] = y
	 
	panel.get_parent().hide()
	$CanvasLayer/MarginContainer2.hide()
