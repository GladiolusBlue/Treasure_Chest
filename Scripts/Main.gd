extends Node
var gotov = 0
var cube = 0
var g = 0
var c = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#опрос сигнала от кубов о готовности
	$Dice_e1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_e2/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p2/Dice_main.cubu_gotov.connect(self.next1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	gotov = 0
	$Dice_e1/Dice_main.fall_dice()


# запуск следующего куба по готовности
func next1(x,y):
	gotov += 1
	if gotov == 1:
		$Dice_e2/Dice_main.fall_dice()
	elif gotov == 2:
		$Dice_p1/Dice_main.fall_dice()
	elif gotov == 3:
		$Dice_p2/Dice_main.fall_dice()
	else :
		print("test1","-",x,"-",y,"-",gotov)

