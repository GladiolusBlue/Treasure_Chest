extends Node
var gotov = 0
var cube = 0
var g = 0
var c = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Dice_e1/Dice_main.cubu_gotov.connect(self.next1)
	gotov += 1
	$Dice_e2/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p1/Dice_main.cubu_gotov.connect(self.next1)
	$Dice_p2/Dice_main.cubu_gotov.connect(self.next1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	$Dice_e1/Dice_main.fall_dice()
	#if $Dice_e1/Dice_main.readi1():
	#$Dice_e2/Dice_main.fall_dice()
	#$Dice_p1/Dice_main.fall_dice()
	#$Dice_p2/Dice_main.fall_dice()
	#print(gotov,  cube,  g,  c)

func next1(x,y):
	if gotov == 1:
		$Dice_e2/Dice_main.fall_dice()
		gotov += 1
	elif gotov == 2:
		$Dice_p1/Dice_main.fall_dice()
		gotov += 1
	elif gotov == 3:
		$Dice_p2/Dice_main.fall_dice()
		gotov += 1
	else :
		#$Dice_p2/Dice_main.fall_dice()
		print("test1","-",x,"-",y,"-",gotov)

