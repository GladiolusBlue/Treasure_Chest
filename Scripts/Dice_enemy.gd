extends Node2D

var image1: CompressedTexture2D
var image2: CompressedTexture2D
var image3: CompressedTexture2D
var image4: CompressedTexture2D
var image5: CompressedTexture2D
var image6: CompressedTexture2D
var Dice_main: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	image1 = load("res://Dice_sprites/Enemy/Chest.png")
	image2 = load("res://Dice_sprites/Enemy/Dragon.png")
	image3 = load("res://Dice_sprites/Enemy/Goblin.png")
	image4 = load("res://Dice_sprites/Enemy/Potion.png")
	image5 = load("res://Dice_sprites/Enemy/Skeleton.png")
	image6 = load("res://Dice_sprites/Enemy/Slime.png")
	# загрузка текстур картинок
	


func fall_dice(): #падение кубика
	# выбор рандомного числа от 1 до 6
	var random_number = randi() % 6 + 1
	busting_the_dice(random_number)
	# выбор соответствующей картинки
	var image: CompressedTexture2D
	if random_number == 1:
		image = image1
	elif random_number == 2:
		image = image2
	elif random_number == 3:
		image = image3
	elif random_number == 4:
		image = image4
	elif random_number == 5:
		image = image5
	else:
		image = image6
	
	# установка выбранной картинки видимой
	$Sprite2D.texture = image
	
func busting_the_dice(i):
	var image: CompressedTexture2D
	var count = i+1
	if count == 1:
		image = image1
	elif count == 2:
		image = image2
	elif count == 3:
		image = image3
	elif count == 4:
		image = image4
	elif count == 5:
		image = image5
	else:
		image = image6
		
	$Sprite2D.texture = image
	$Timer_busting
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_busting_timeout():
	pass # Replace with function body.
