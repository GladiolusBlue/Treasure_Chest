extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	#опрос сигнала от кубов о готовности
	for i in range($WhiteCubes.get_child_count()):
		var Dices = $WhiteCubes.get_child(i)
		var cube = Dices.get_child(0)
		cube.cubu_gotov.connect(self.next1)
	for i in range($WhiteCubes.get_child_count()):
		var Dices = $WhiteCubes.get_child(i)
		var cube = Dices.get_child(0)
		cube.cubu_gotov.connect(self.next1)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


@warning_ignore("unused_parameter")
func _process(delta):
	pass

func rndbynoove(locatarr):
	var x = 0
	var y = 0
	var cubesize = 50
	var polesizeX = 1600
	var polesizeY = 800
	var rng = RandomNumberGenerator.new()
	while true:
		rng.randomize()
		x = rng.randi_range(-polesizeX, polesizeX)
		y = rng.randi_range(-polesizeY, polesizeY)
		var endwhile = false
		var num = 0
		for i in range(locatarr.size()):
			var checkX = locatarr[i][0]
			var checkY = locatarr[i][1]
			if (abs(abs(x) - abs(checkX)) > cubesize and abs(abs(y) - abs(checkY)) > cubesize):
				num += 1
			if (num == locatarr.size()):
				endwhile = true				
		if (endwhile == true):
			break
	return [x, y]
	
func _on_button_1_pressed():
	var locationscube: Array = [[0, 0]]
	for i in range($DarkCubes.get_child_count()):
		var Dices = $DarkCubes.get_child(i)
		var cube = Dices.get_child(0)
		var xy = rndbynoove(locationscube)
		var x = xy[0]
		var y = xy[1]
		locationscube.append([x,y])
		print(locationscube)
		cube.fall_dice(x, y)
	for i in range($WhiteCubes.get_child_count()):
		var Dices = $WhiteCubes.get_child(i)
		var cube = Dices.get_child(0)
		var xy = rndbynoove(locationscube)
		var x = xy[0]
		var y = xy[1]
		locationscube.append([x,y])
		print(locationscube)
		cube.fall_dice(x, y)
	

func Dicenext(Dicenumber, nextDice):
	Dicenumber += 1
	pass
	
	
# запуск следующего куба по готовности
func next1():
	print("test")

