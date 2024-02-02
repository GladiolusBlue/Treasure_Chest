extends Node
var gotov = 0
var cube = 0
var a = 0
var b = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#опрос сигнала от кубов о готовности
	$Dice_e1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_e2/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p2/Dice_main.cubu_gotov.connect(self.next1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_button_1_pressed():
	gotov = 0
	a = 19
	b = -550
	$Dice_e1/Dice_main.fall_dice(a,b)
	#print("test1","-",a,"-",b,"-",gotov)
	

# запуск следующего куба по готовности
func next1(x,y):
	gotov += 1
	if gotov == 1:
		a = 700
		b = -550
		$Dice_e2/Dice_main.fall_dice(a,b)
		print("E1","-",x,"-",y)
	elif gotov == 2:
		a = 19
		b = 550
		$Dice_p1/Dice_main.fall_dice(a,b)
		print("E2","-",x,"-",y)
	elif gotov == 3:
		a = 700
		b = 550
		$Dice_p2/Dice_main.fall_dice(a,b)
		
		print("P1","-",x,"-",y)
	else :
		print("P2","-",x,"-",y)

