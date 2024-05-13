extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var my_array = [
		[1,10],
		[2, 20],
		[3, 30],
		[4, 40],
		[5, 50]
	]
	
	var my_new_array = my_array.filter(func(item): return item[0] != 3)
	print(my_array)
	print(my_new_array)
