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
	## [index, exercise name / minutes, exercise notes / seconds, exercise or rest]
	## index = what goes first
	#  == ==  == ==
	
	# See what goes first
	var sets_done = [] # integers are put here; the indeces of them
	var i : int = 1
	for p in Global.set: # skim through the top level of the Dictionary
		if i > Global.set[p][0] and !sets_done.has(Global.set[p][0]):
				i = Global.set[p][0]
				sets_done.append(i)
	## == By this point, the next set is now pinpointed ==
	
	for k in Global.set:
		if Global.set[k][0] == i:
			if Global.set[k][Global.set[k].size() - 1]:
				print("The first set is a rest.")
			else:
				print("The first set is: " + Global.set[k][1])
