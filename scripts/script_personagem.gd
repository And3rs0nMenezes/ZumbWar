extends KinematicBody2D

export var speed = 100
var screen_size
var player_direction = 1

func _ready():
	screen_size = get_viewport_rect().size
func fire():
	var pre_tiro = preload("res://scenes/tiro.tscn")
	var tiro = pre_tiro.instance()
	tiro.set_direction( player_direction )
	tiro.position.y = self.position.y
	
	if player_direction == 0:
		tiro.position.x = self.position.x - 10;
	else:
		tiro.position.x = self.position.x + 20;
	get_parent().add_child(tiro)
	if player_direction == 0:
		tiro.position.y = self.position.y - 8;
	else:
		tiro.position.y = self.position.y - 9;
	get_parent().add_child(tiro)
	
func _process(delta):
	var velocidade = Vector2(0, 0)
	if Input.is_action_just_pressed("ui_tiro"):
		print("shooting!")
		self.fire()
		
	if Input.is_action_pressed("ui_right"):
		velocidade.x += 1
		player_direction = 1
		$AnimatedSprite.flip_h = false
		
	if Input.is_action_pressed("ui_left"):
		velocidade.x -= 1
		player_direction = 0
		$AnimatedSprite.flip_h = true
		
	if Input.is_action_pressed("ui_down"):
		velocidade.y += 1
	if Input.is_action_pressed("ui_up"):
		velocidade.y -= 1
	pass
	if velocidade.length() > 0:
		velocidade = velocidade.normalized() * speed
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
		
	move_and_slide(velocidade)
