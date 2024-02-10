extends Node

#var gotov = 0
#var cube = 0
var nam_dc = 1 # количество черных кубиков
#var b = 0
var diff = start_pos/6*2
const  start_pos = -600 # половина ширины расстановки кубиков игрока
#var Dicename = []
#var name_dice = 0
var level = 1 # уровени подземелья




# Called when the node enters the scene tree for the first time.
func _ready():
	# подключение опроса сигнала от кубов о готовности
	for i in range($WhiteCubes.get_child_count()):
		var Dices = $WhiteCubes.get_child(i)
		var cube = Dices.get_child(0)
		cube.cubu_gotov.connect(self.next_p)
		cube.cubu_clic.connect(self.next_clic_p) # при поступлении сигнала запуск функции next1
	for i in range($DarkCubes.get_child_count()):
		var Dices = $DarkCubes.get_child(i)
		var cube = Dices.get_child(0)
		cube.cubu_gotov.connect(self.next_e)
		cube.cubu_clic.connect(self.next_clic_e)
		#$"start level".visible = false
		$"leave_level".visible = false
		$battle.visible = false
		$Reroll.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.


@warning_ignore("unused_parameter")
func _process(delta):
	pass
	

# функция рандомного разбрасывания кубиков по полю
func rndbynoove(locatarr):
	var x = 0
	var y = 0
	var cubesize = 100
	var polesizeX = 1000
	var polesizeY = -800
	var rng = RandomNumberGenerator.new()
	while true:
		rng.randomize()
		x = rng.randi_range( -polesizeX, polesizeX)
		#y = 700
		y = rng.randi_range(polesizeY,-polesizeY)
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
	
	
var level_started = 0
func _on_button_1_pressed():# функция по нажатию кнопки начать уровень
	$"start level".visible = false
	$"leave_level".visible = false
	$Reroll.visible = false
	enemi_arrey.clear()
	pleer_arrey.clear()
	pleer_batt_arrey.clear()
	enemi_batt_arrey.clear()
	var start_pos_p = start_pos
	
	var start_pos_e = (level-1) * diff / 2
	var locationscube: Array = [[0, 0]] 
	if level_started == 0:
		cast_white(locationscube,start_pos_p,diff)
		cast_dark(locationscube,start_pos_e,diff)
	else:
		cast_dark(locationscube,start_pos_e,diff)
	

func cast_white(locationscube,start_pos_p,diff):
	for i in range($WhiteCubes.get_child_count()):
			var Dices = $WhiteCubes.get_child(i)
			var cube = Dices.get_child(0)
			var xy = rndbynoove(locationscube)
			var x = xy[0]
			var y = xy[1]
			var n = start_pos_p
			var m = -1350
			Dices.visible = true
			cube.fall_dice(x,y,m,n,i)
			start_pos_p = start_pos_p-diff
			level_started = 1
	
	
func cast_dark(locationscube,start_pos_e,diff):
	for i in range($DarkCubes.get_child_count()):
			var Dices = $DarkCubes.get_child(i)
			var cube = Dices.get_child(0)
			var xy = rndbynoove(locationscube) 
			var x = xy[0]
			var y = xy[1]
			var n =  start_pos_e
			var m = 1350#
			nam_dc = level
			if i < nam_dc:
				Dices.visible = true
				cube.fall_dice(x,y,m,n,i)
				start_pos_e = start_pos_e-diff
				
	
@warning_ignore("unused_parameter")
func Dicenext(Dicenumber, nextDice):
	Dicenumber += 1
	pass
	
	
func _on_leave_level_pressed(): # функция по нажатию кнопки выйти из подземелья
	$"leave_level".visible = false
	$"start level".visible = true
	$"battle".visible = false
	$Reroll.visible = false
	level = 1
	level_started = 0
	for i in range($WhiteCubes.get_child_count()):
			var Dices = $WhiteCubes.get_child(i)
			var cube = Dices.get_child(0)
			Dices.visible = false
	print(enemi_arrey)
	pass # Replace with function body.


func _on_battle_pressed(): # функция по нажатию кнопки бой
	#print("  ","  ",enemi_batt_arrey,"  ",enemi_arrey,"  ",pleer_arrey,"  ",pleer_batt_arrey)
	buttle()
	$battle.visible = false
	pass # Replace with function body.	
	
	
func buttle(): # функция бой
	var p = pleer_batt_arrey[0][0]
	var Dices_p = $WhiteCubes.get_child(p)
	Dices_p.visible = false
	var e = enemi_batt_arrey[0][0]
	var Dices_e = $DarkCubes.get_child(e)
	Dices_e.visible = false
	pleer_batt_arrey.remove_at(0)
	#pleer_arrey.remove_at(p)
	enemi_batt_arrey.remove_at(0)
	nam_dc -=1
	#enemi_arrey.remove_at(e)
	#enemi_arrey.insert(e,[e,"kill"])
	if nam_dc == 0:
		$"leave_level".visible = true
		$"start level".visible = true
		$Reroll.visible = false
		level += 1
		for i in range($WhiteCubes.get_child_count()):
			var Dices = $WhiteCubes.get_child(i)
			var cube = Dices.get_child(0)
			cube._on_button_pressed(1)
		#print(e,"  ",p,"  ",enemi_batt_arrey,"  ",enemi_arrey,"  ",pleer_arrey,"  ",pleer_batt_arrey)
	elif enemi_batt_arrey.size() > 0 and pleer_batt_arrey.size() == 0:
		for i in range($DarkCubes.get_child_count()):
			var Dices = $DarkCubes.get_child(i)
			var cube = Dices.get_child(0)
			cube._on_button_pressed(1)
	elif pleer_batt_arrey.size() > 0:
		buttle()
	else:
		pass
		
func _on_reroll_pressed():
	for i in pleer_batt_arrey:
		var p = i[0]
		var name = i[1]
		var Dices_p = $WhiteCubes.get_child(p)
		var xy = i[2]
		var n = xy[1]
		var m = xy[0]
		print(p," ",m," ",n," ",rol," ",)
		var cube_p = Dices_p.get_child(0)
		if name == "reroll":
			Dices_p.visible = false
		else :
			cube_p.fall_dice(0,0,m,n,p)
			cube_p._on_button_pressed(1)
	for i in enemi_batt_arrey:
		var e = i[0]
		var name = i[1]
		var Dices_e = $DarkCubes.get_child(e)
		var xy = i[2]
		var n = xy[1]
		var m = xy[0]
		var cube_e = Dices_e.get_child(0)
		if name == "Dragon":
			cube_e._on_button_pressed(1)
			pass
		else :
			cube_e.fall_dice(0,0,m,n,e)
			cube_e._on_button_pressed(1)
	print(pleer_batt_arrey," ",enemi_batt_arrey," "," ",rol," ",)
	enemi_batt_arrey.clear()
	pleer_batt_arrey.clear()
	$Reroll.visible = false
	rol = 0
	pass # Replace with function body.
	
	
var enemi_arrey : Array = []
func next_e(i,name): # функция записи общего списка врагов
	enemi_arrey.append([i,name])
	#print("выпал враг","-",x,"-",y," ",enemi_arrey," ",level,nam_dc)
	
	
var pleer_arrey: Array = [] 	
func next_p(i,name):# функция записи общего списка игроков
	pleer_arrey.append([i,name])
	#print("выпал игрок","-",x,"-",y)

var rol = 0
var pleer_batt_arrey: Array = []
func next_clic_p(i,name,xy): # функция по нажатию на игрока
	if name == "Scroll" and rol == 0:
		pleer_batt_arrey.append([i,"reroll",xy])
		$Reroll.visible = true
		rol = 1
	else:
		pleer_batt_arrey.append([i,name,xy])
	checking_battle()
	#print("нажат игрок","-",i,"-",name," ",xy)
	
	
var enemi_batt_arrey: Array = [] 
func next_clic_e(i,name,xy): # функция по нажатию на противника
	enemi_batt_arrey.append([i,name,xy])
	checking_battle()
	#print("нажат враг","-",x,"-",y,enemi_batt_arrey,pleer_batt_arrey)
	
	
func checking_battle():
	if enemi_batt_arrey.size() > 0 and pleer_batt_arrey.size() > 0:
		$battle.visible = true #функция проверки боя
		
	pass



