extends Control

onready var text = $CenterContainer/text
onready var next_button = $MarginContainer3/CenterContainer/next

# is the current thingy an exercise or rest?
var er : bool = false 
var i : int = 0 # tracks the order of the sets

func _ready() -> void: 
	next_button.connect("pressed", self, "next")
	next()

func next() -> void: 
	#  == Format ==
	## [index, exercise name / minutes, exercise notes / seconds, exercise or rest]
	## index = what goes first
	#  == ==  == ==
	
	# See what goes first
	i += 1
	
	for k in Global.set:
		if Global.set[k][0] == i:
			if Global.set[k][Global.set[k].size() - 1]:
				print("It's a rest.")
			else:
				text.bbcode_text = "[shake rate=10 level=6] [center]" + String(Global.set[k][1]) + "[/center] [/shake]"
