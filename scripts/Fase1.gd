extends Node2D

var score = 0
var vidas = 1
func _ready():
	$personagem/Jogador/Camera2D/Control/Pontos.text = " " + str(score)
	pass
	$personagem/Jogador/Camera2D/Control/Vida.text = " " + str(vidas)
func count_score():
	score += 1
	$personagem/Jogador/Camera2D/Control/Pontos.text = " " + str(score)
func count_vidas():
	$personagem/Jogador/Camera2D/Control/Vida.text = " " + str(vidas)
func _on_Area2D_body_entered(body):
		if(body.name=="Jogador"):
			get_tree().change_scene("res://scenes/gameWin.tscn")
			pass

