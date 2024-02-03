extends Node

#var gotov = 0
#var cube = 0
var a = 0
#var b = 0
#var   start_pos_e =-700
const  start_pos = -1000
#var Dicename = []
#var name_dice = 0
#var o = "p1"


# Called when the node enters the scene tree for the first time.
func _ready():
	#опрос сигнала от кубов о готовности
	for i in range($WhiteCubes.get_child_count()):
		var Dices = $WhiteCubes.get_child(i)
		var cube = Dices.get_child(0)
		cube.cubu_gotov.connect(self.next1)
	for i in range($DarkCubes.get_child_count()):
		var Dices = $DarkCubes.get_child(i)
		var cube = Dices.get_child(0)
		cube.cubu_gotov.connect(self.next1)
		a += 1
		#print(a)
# Called every frame. 'delta' is the elapsed time since the previous frame.


@warning_ignore("unused_parameter")
func _process(delta):
	pass
	
"
func rndbynoove(locatarr):
	var x = 0
	var y = 0
	var cubesize = 50
	var polesizeX = 1000
	var polesizeY = 800
	var rng = RandomNumberGenerator.new()
	while true:
		rng.randomize()
		x = rng.randi_range(-polesizeX, polesizeX)
		#y = 700
		#y = rng.randi_range(-polesizeY, polesizeY)
		var endwhile = false
		var num = 0
		for i in range(locatarr.size()):
			var checkX = locatarr[i][0]
			var checkY = locatarr[i][1]
			if (abs(abs(x) - abs(checkX)) > cubesize ):#and abs(abs(y) - abs(checkY)) > cubesize):
				num += 1
			if (num == locatarr.size()):
				endwhile = true				
		if (endwhile == true):
			break
	return [x, y]
	"
	
func _on_button_1_pressed():
	var start_pos_p = start_pos
	var diff = start_pos_p/7*2
	var start_pos_e = a * diff / 2
	#var locationscube: Array = [[0, 0]]
	for i in range($DarkCubes.get_child_count()):
		var Dices = $DarkCubes.get_child(i)
		var cube = Dices.get_child(0)
		#var xy = rndbynoove(locationscube)
		var x = start_pos_e #xy[0]
		var y = -750#xy[1]
		#locationscube.append([x,y])
		#print(locationscube)
		cube.fall_dice(x, y)
		start_pos_e = start_pos_e-diff
	for i in range($WhiteCubes.get_child_count()):
		var Dices = $WhiteCubes.get_child(i)
		var cube = Dices.get_child(0)
		#var xy = rndbynoove(locationscube)
		var x = start_pos_p #xy[0]
		var y = 750#xy[1]
		#locationscube.append([x,y])
		#print(locationscube)
		cube.fall_dice(x, y)
		start_pos_p = start_pos_p-diff
	

func Dicenext(Dicenumber, nextDice):
	Dicenumber += 1
	pass
	
	
# запуск следующего куба по готовности
func next1(x,y):
	print("",x,y)
	
	
