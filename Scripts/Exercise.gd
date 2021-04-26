extends MarginContainer

onready var button = $CenterContainer/Button
onready var panel = $CanvasLayer/MarginContainer/Panel

func _ready(): 
	button.connect("pressed", self, "modify_exercise")
	panel.hide()

func modify_exercise() -> void:
	panel.show()
