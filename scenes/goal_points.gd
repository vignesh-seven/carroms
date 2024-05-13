extends Area2D

var monitoring_bodies: Array = []

signal delete_carrom(carrom)

func _on_body_shape_entered(_body_rid, body, _body_shape_index, local_shape_index):
	if body.name == "CarromBoard":
		return
	#print("============================================")
	#print(body.name) # Striker
	#print(body.get_parent().name)
	##print(body_rid) # RID 2132132132131
	#print(body) # Striker<RigidBody2d>
	#print(local_shape_index) # The no. of the area2D
	#var local_shape_owner = shape_find_owner(local_shape_index)
	var local_shape_node = shape_owner_get_owner(shape_find_owner(local_shape_index))
	#
	#print(local_shape_owner)
	#print(local_shape_node) # the local collision circle
	monitoring_bodies.append([body, local_shape_node])
	print(monitoring_bodies)
	#print(local_shape_node.shape.radius)

func _on_body_shape_exited(_body_rid, body, _body_shape_index, _local_shape_index):
	monitoring_bodies = monitoring_bodies.filter(func(m_body): return m_body[0].name != body.name)
	print(monitoring_bodies)
	

func _process(_delta):
	if monitoring_bodies.is_empty():
		return
	for m_body in monitoring_bodies:
		var carrom = m_body[0] 
		var collider = m_body[1] # this is the "Collider2D" of the corresponding hole
		print("carrom radius: %d" % carrom.get_child(1).shape.radius) # get_child() is here to get the "Collider2D" of the Carrom
		print("collider radius: %d" % collider.shape.radius)
		var dist = carrom.global_position.distance_to(collider.global_position)
		print("dist: %d" % dist)
		
		if dist + carrom.get_child(1).shape.radius <= collider.shape.radius:
			print("INSIDE")
			delete_carrom.emit(carrom)
		#print("is inside?: %s" % )

