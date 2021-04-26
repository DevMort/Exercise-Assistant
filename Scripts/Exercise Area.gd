extends Control

onready var text = $CenterContainer/text
onready var next_button = $MarginContainer3/CenterContainer/next

# is the current thingy an exercise or rest?
var er : bool = false 

func _ready() -> void: 
	next_button.connect("pressed", self, "next")
	next()

func next() -> void: 
	#  == Format ==
	## [index, node, exercise name / minutes, exercise notes / seconds, exercise or rest]
	## index = what goes first
	#  == ==  == ==
	
	for p in Global.set:
		pass
