extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	$Dice/Dice_main.fall_dice()
	$Dice2/Dice_main.fall_dice()
	pass # Replace with function body.
