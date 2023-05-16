extends StaticBody2D

var flip = true
var posicao_inicial 
var posicao_final 
var velocidade = 0.5
var game

func _ready():
	game = get_tree().current_scene
	add_to_group("inimigos")
	$AnimatedSprite.play("andar")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 130

func _process(delta):
	if (posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$AnimatedSprite.flip_h = false
		if($".".position.x  >= posicao_final):
			flip = false
			
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$AnimatedSprite.flip_h = true
		if($".".position.x<= posicao_inicial):
			flip = true
			
func _on_Area2D_body_entered(body):
		if(body.name=="Jogador"):
			get_tree().change_scene("res://scenes/gameFail.tscn")


func _on_mortezumbi_body_entered(body):
	if (body.name == "tiro"):
		$AnimatedSprite.play ("morte")


func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation == "morte"): 
		queue_free()
		game.count_score()
		game.count_vidas()

