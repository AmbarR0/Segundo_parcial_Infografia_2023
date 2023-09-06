extends TextureRect

@onready var score_label = $MarginContainer/HBoxContainer/score_label
@onready var counter_label = $MarginContainer/HBoxContainer/counter_label
@onready var goal = $MarginContainer/HBoxContainer/HBoxContainer/goal


var current_score = 0
var current_count = 10
var current_timer = 30
var metaG = 1000

signal Iwin
signal stopTimer
signal finishGame

func _ready():
	_on_grid_score_u(current_score)
	_on_grid_moving(current_count)
	
	

func _on_grid_score_u(value):
	current_score += value
	if current_score >= metaG:
		emit_signal("Iwin")
		emit_signal("finishGame", true)
	score_label.text = str(current_score)


func _on_grid_moving(value = -1):
	if value == -1:
		current_count -= 1
		if current_score >= metaG:
			counter_label.text = "WIN"
			emit_signal("Iwin")
			emit_signal("finishGame", true)

		else:
			if current_count <= 0:
				counter_label.text = "FIN"
				emit_signal("Iwin")
				emit_signal("finishGame", false)
			else:
				counter_label.text = str(current_count)
	else:
		counter_label.text = str(current_count)

func _on_grid_timer_u(timer = -1):
	if timer == -1:
		current_timer -= 1
		if current_score >= metaG:
			counter_label.text = "WIN"
			emit_signal("finishGame", true)
		else:
			if current_timer <= 0:
				counter_label.text = "FIN"
				emit_signal("Iwin")
				emit_signal("finishGame", false)
			else:
				counter_label.text = str(current_timer)
	else: 
		counter_label.text = str(timer)


func _on_button_button_down():
	current_score = 0
	current_count = 10
	current_timer = 30
	_on_grid_score_u(current_score)
	_on_grid_moving(current_count)
