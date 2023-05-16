extends KinematicBody2D

export(int) var speed = 100
export(int, "left","right") var direction = 0

var tiro_dir = -1

func set_direction( dir ):
	self.direction = dir

func _physics_process(delta):
	if (direction == 0):
		$Sprite.flip_h = false
		tiro_dir = -1
	else:
		$Sprite.flip_h = true
		tiro_dir = 1
	var info = move_and_collide(Vector2(tiro_dir,0) * speed * delta)

	if info && info.collider.is_in_group("inimigos"):
		info.collider.queue_free()
		self.queue_free()
		get_parent().num_enemy = get_parent().num_enemy + 1
	elif info && !info.collider.is_in_group("inimigos"):
		self.queue_free()

func _on_paratiro_screen_exited():
	print("tiro exited")
	self.queue_free()
	pass

func _on_acerto_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("tiro")
	
