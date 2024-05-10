extends Area2D

func _on_body_shape_entered(_body_rid, _body, _body_shape_index, local_shape_index):
	#print(body.name) # Striker
	#print(body_rid) # RID 2132132132131
	#print(body) # Striker<RigidBody2d>
	#print(local_shape_index) # The no. of the area2D
	#var local_shape_owner = shape_find_owner(local_shape_index)
	var local_shape_node = shape_owner_get_owner(shape_find_owner(local_shape_index))
	
	#print(local_shape_owner)
	#print(local_shape_node) # the local collision circle
