extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	$Dice_e1/Dice_main.fall_dice()
	$Dice_e2/Dice_main.fall_dice()
	$Dice_p1/Dice_main.fall_dice()
	$Dice_p2/Dice_main.fall_dice()

