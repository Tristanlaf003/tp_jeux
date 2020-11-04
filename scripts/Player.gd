extends KinematicBody2D

export var nombreVie = 3
onready var vie = $NombreVie
var velocity = Vector2()
export var speed = 200
export var gravity = 1100
export var impulsion = -400
var is_jumping = true

#physique, collition, déplacement
func _physics_process(delta):
	vie.text = "Vie : " + str(nombreVie)
	velocity.y += gravity * delta #Permet de mettre la gravité
	_ctrl_player()
	velocity = move_and_slide(velocity,Vector2(0,-1))
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Plateforme_final":
			get_tree().change_scene("res://scene/Victoire.tscn")
	if nombreVie <= 0:
		get_tree().change_scene("res://scene/Defaite.tscn")

func _ctrl_player():
	var droite = Input.is_action_pressed("ui_right") #donne un true or false
	var gauche = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up") #Barre d'espace
	
	velocity.x = 0 #Permet de mettre la vitesse à 0
	if droite: #Permet d'aller vers la droite
		velocity.x += speed
	if gauche: #Permet d'aller vers la gauche
		velocity.x -= speed
	if jump and is_on_floor(): #Verififer si le personnage est sur le sol
		is_jumping = true
		velocity.y = impulsion

