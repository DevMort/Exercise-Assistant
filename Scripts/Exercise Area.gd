extends Control

onready var text = $CenterContainer/text
onready var next_button = $MarginContainer3/CenterContainer/next
onready var timer = $Timer
onready var back_button = $MarginContainer4/CenterContainer/back

# is the current thingy an exercise or rest?
var er : bool = false 
var i : int = 0 # tracks the order of the sets

# rests related
var total_in_sec : int = 0

func _ready() -> void: 
	next_button.connect("pressed", self, "next")
	timer.connect("timeout", self, "tick")
	back_button.connect("pressed", self, "back")
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
				rest(Global.set[k][1], Global.set[k][2])
			else:
				text.bbcode_text = "[shake rate=10 level=6] [center]" + String(Global.set[k][1]) + "\n[color=#44475a]" + String(Global.set[k][2]) + "[/color][/center] [/shake]"

func rest(minutes, seconds) -> void:
	total_in_sec = (minutes*60) + seconds
	text.bbcode_text = "[shake rate=10 level=6] [center]" + "Rest\n" + String(total_in_sec) + "[/center] [/shake]"
	
	next_button.disabled = true
	
	timer.start()

func tick() -> void:
	if total_in_sec > 0:
		total_in_sec -= 1
		text.bbcode_text = "[shake rate=10 level=6] [center]" + "Rest\n" + String(total_in_sec) + "[/center] [/shake]"
	else:
		total_in_sec = 0
		text.bbcode_text = "[shake rate=10 level=6] [center]Ready to proceed?[/center] [/shake]"
		timer.stop()
		next_button.disabled = false

func back() -> void: get_tree().change_scene("res://Main.tscn")
