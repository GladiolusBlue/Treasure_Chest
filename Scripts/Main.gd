extends Node
var gotov = 0
var cube = 0
var a = 0
var b = 0
var start_pos =700
var enemi = 0
var Diceenemy1 = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	#опрос сигнала от кубов о готовности
	$Dice_e1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_e2/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p2/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p3/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p4/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p5/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p6/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p7/Dice_main.cubu_gotov.connect(self.next1)
	Diceenemy1 = $Dice_e1/Dice_main
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_button_1_pressed():
	enemi = start_pos/7*2
	gotov = 0
	a = 0
	b = -650
	Diceenemy1.fall_dice(a,b)
	#$Dice_e1/Dice_main.fall_dice(a,b)
	#print("test1","-",a,"-",b,"-",gotov)
	

# запуск следующего куба по готовности
func next1(x,y):
	gotov += 1
	if gotov == 1:
		a = 700
		b = -650
		$Dice_e2/Dice_main.fall_dice(a,b)
		print("E1","-",x,"-",y,"<",start_pos)
	elif gotov == 2:
		print(start_pos)
		a = start_pos
		b = 700
		start_pos = start_pos+enemi
		$Dice_p1/Dice_main.fall_dice(a,b)
		print("E2","-",x,"-",y,"<",start_pos)
	elif gotov == 3:
		print(start_pos)
		a = start_pos
		b = 700
		start_pos = start_pos+enemi
		$Dice_p2/Dice_main.fall_dice(a,b)
		
		print("P1","-",x,"-",y,"<",start_pos)
	else :
		print("P2","-",x,"-",y,"<",start_pos)

