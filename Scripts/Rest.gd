extends MarginContainer

onready var button = $CenterContainer/Button
onready var panel = $CanvasLayer/MarginContainer/Panel
onready var confirm = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/MarginContainer/CenterContainer/confirm
onready var minutes_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/HBoxContainer/minutes
onready var seconds_input = $CanvasLayer/MarginContainer/Panel/MarginContainer/VBoxContainer/HBoxContainer/seconds
onready var remove_button = $CanvasLayer/MarginContainer2/CenterContainer/remove

var minutes : String = ""
var seconds : String = ""

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
	x[0].set.erase(String(name))
	Global.set = x[0].set
	x[0].re_count -= 1
	x[0].save()
	
	queue_free()

func confirm() -> void:
	var x = get_tree().get_nodes_in_group("main")
	# the last part of the array is a boolean that's true if it's a rest
	var y = [x[0].ex_count+x[0].re_count, int(minutes_input.text), int(seconds_input.text), 1]
	x[0].set[String(name)] = y
	x[0].save()
	 
	panel.get_parent().hide()
	$CanvasLayer/MarginContainer2.hide()
