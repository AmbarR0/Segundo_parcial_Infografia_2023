extends HBoxContainer

@onready var message = $Label
@onready var button = $Button



func _ready():
	message.visible = false
	button.visible = false


func _on_top_ui_finish_game(win: bool):
	if win:
		message.text = "Has ganado el juego y honor"
		
	else:
		message.text = "Has perdido el juego y tu honor"
		
	message.visible = true
	button.visible = true



func _on_button_button_down():
	message.visible = false
	button.visible = false
