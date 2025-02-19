extends Control

export (NodePath) var botao1Path
export (NodePath) var botao2Path
export (NodePath) var botao3Path
export (NodePath) var botao4Path
export (NodePath) var botao5Path
export (NodePath) var botao6Path
export (NodePath) var placarPath
export (NodePath) var videoFrutaPath
export (NodePath) var fruta1Path 
export (NodePath) var fruta2Path
export (NodePath) var fruta3Path 
export (NodePath) var fruta4Path
export (NodePath) var fruta5Path 
export (NodePath) var fruta6Path
export (NodePath) var perguntasDificeisPath
export (NodePath) var timerPath

onready var botao1 = get_node(botao1Path)
onready var botao2 = get_node(botao2Path)
onready var botao3 = get_node(botao3Path)
onready var botao4 = get_node(botao4Path)
onready var botao5 = get_node(botao5Path)
onready var botao6 = get_node(botao6Path)
onready var placar = get_node(placarPath)
onready var video = get_node(videoFrutaPath)
onready var fruta1 = get_node(fruta1Path)
onready var fruta2 = get_node(fruta2Path)
onready var fruta3 = get_node(fruta3Path)
onready var fruta4 = get_node(fruta4Path)
onready var fruta5 = get_node(fruta5Path)
onready var fruta6 = get_node(fruta6Path)
onready var perguntasDificeis = get_node(perguntasDificeisPath)
onready var timer = get_node(timerPath)

var score = 0
var acabou = false
var fruta1Text
var fruta2Text
var fruta3Text
var fruta4Text
var fruta5Text
var fruta6Text
var videoText
var resposta
var penalty = 0

func _ready():
	randomize()
	set_Pergunta()
	
func set_Pergunta():
	var numPerguntas = perguntasDificeis.get_child_count()
	var perguntaAtual
	
	if numPerguntas > 0:
		perguntaAtual = perguntasDificeis.get_child(randi()%numPerguntas)
		fruta1Text = perguntaAtual.fruta1
		fruta2Text = perguntaAtual.fruta2
		fruta3Text = perguntaAtual.fruta3
		fruta4Text = perguntaAtual.fruta4
		fruta5Text = perguntaAtual.fruta5
		fruta6Text = perguntaAtual.fruta6
		videoText = perguntaAtual.video
		fruta1.set_texture(load('res://imagens/'+fruta1Text+'.png'))
		fruta2.set_texture(load('res://imagens/'+fruta2Text+'.png'))
		fruta3.set_texture(load('res://imagens/'+fruta3Text+'.png'))
		fruta4.set_texture(load('res://imagens/'+fruta4Text+'.png'))
		fruta5.set_texture(load('res://imagens/'+fruta5Text+'.png'))
		fruta6.set_texture(load('res://imagens/'+fruta6Text+'.png'))
		video.set_stream(load('res://videos/'+videoText+'.ogv'))
		video.play()
		resposta = perguntaAtual.resposta
	else:
		acabou = true
		global.score = score
		get_tree().change_scene('res://cenas/Fim.tscn')
		print("Acabou")
	
	if perguntaAtual != null:
		perguntasDificeis.remove_child(perguntaAtual)
	

func _on_Fruta1_button_up():
	if fruta1Text == resposta:
		botao1.disabled = true
		botao2.disabled = true
		botao3.disabled = true
		botao4.disabled = true
		botao5.disabled = true
		botao6.disabled = true
		fruta1.set_texture(load('res://imagens/'+fruta1Text+'Certo.png'))
		print("Você acertou, "+fruta1Text)
		score = score + 100 - penalty
		penalty = 0
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		botao1.disabled = true
		fruta1.set_texture(load('res://imagens/'+fruta1Text+'Errado.png'))
		penalty += 10
		print("Você errou, "+fruta1Text)
		placar.set_text(" Pontuação : "+str(score))

func _on_Fruta2_button_up():
	if fruta2Text == resposta:
		botao1.disabled = true
		botao2.disabled = true
		botao3.disabled = true
		botao4.disabled = true
		botao5.disabled = true
		botao6.disabled = true
		fruta2.set_texture(load('res://imagens/'+fruta2Text+'Certo.png'))
		print("Você acertou, "+fruta2Text)
		score = score + 100 - penalty
		penalty = 0
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		botao2.disabled = true
		fruta2.set_texture(load('res://imagens/'+fruta2Text+'Errado.png'))
		penalty += 10
		print("Você errou, "+fruta2Text)
		placar.set_text(" Pontuação : "+str(score))

func _on_Fruta3_button_up():
	if fruta3Text == resposta:
		botao1.disabled = true
		botao2.disabled = true
		botao3.disabled = true
		botao4.disabled = true
		botao5.disabled = true
		botao6.disabled = true
		fruta3.set_texture(load('res://imagens/'+fruta3Text+'Certo.png'))
		print("Você acertou, "+fruta3Text)
		score = score + 100 - penalty
		penalty = 0
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		botao3.disabled = true
		fruta3.set_texture(load('res://imagens/'+fruta3Text+'Errado.png'))
		penalty += 10
		print("Você errou, "+fruta3Text)
		placar.set_text(" Pontuação : "+str(score))


func _on_Fruta4_button_up():
	if fruta4Text == resposta:
		botao1.disabled = true
		botao2.disabled = true
		botao3.disabled = true
		botao4.disabled = true
		botao5.disabled = true
		botao6.disabled = true
		fruta4.set_texture(load('res://imagens/'+fruta4Text+'Certo.png'))
		print("Você acertou, "+fruta4Text)
		score = score + 100 - penalty
		penalty = 0
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		botao4.disabled = true
		fruta4.set_texture(load('res://imagens/'+fruta4Text+'Errado.png'))
		penalty += 10
		print("Você errou, "+fruta4Text)
		placar.set_text(" Pontuação : "+str(score))

func _on_Fruta5_button_up():
	if fruta5Text == resposta:
		botao1.disabled = true
		botao2.disabled = true
		botao3.disabled = true
		botao4.disabled = true
		botao5.disabled = true
		botao6.disabled = true
		fruta5.set_texture(load('res://imagens/'+fruta5Text+'Certo.png'))
		print("Você acertou, "+fruta5Text)
		score = score + 100 - penalty
		penalty = 0
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		botao5.disabled = true
		fruta5.set_texture(load('res://imagens/'+fruta5Text+'Errado.png'))
		penalty += 10
		print("Você errou, "+fruta5Text)
		placar.set_text(" Pontuação : "+str(score))


func _on_Fruta6_button_up():
	if fruta6Text == resposta:
		botao1.disabled = true
		botao2.disabled = true
		botao3.disabled = true
		botao4.disabled = true
		botao5.disabled = true
		botao6.disabled = true
		fruta6.set_texture(load('res://imagens/'+fruta6Text+'Certo.png'))
		print("Você acertou, "+fruta6Text)
		score = score + 100 - penalty
		penalty = 0
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		botao6.disabled = true
		fruta6.set_texture(load('res://imagens/'+fruta6Text+'Errado.png'))
		penalty += 10
		print("Você errou, "+fruta6Text)
		placar.set_text(" Pontuação : "+str(score))

func _on_Timer_timeout():
	set_Pergunta()
	botao1.disabled = false
	botao2.disabled = false
	botao3.disabled = false
	botao4.disabled = false
	botao5.disabled = false
	botao6.disabled = false

func _on_VideoPlayer_finished():
	video.play()
