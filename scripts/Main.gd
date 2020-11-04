extends Node2D
onready var player = $player
onready var vie = $Vie

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Plateforme_horizontal/AnimationPlayer.play("plateforme_horizontal")
	$Plateforme_verticale/AnimationPlayer.play("plateforme_verticale")
	$Plateforme_verticale2/AnimationPlayer.play("plateforme_vericale2")
	$Plateforme_horizontal2/AnimationPlayer.play("plateforme_horizontale_2")


func _on_Area2D_body_entered(body):
	player.position.x = 10
	player.position.y = 10
	player.nombreVie -= 1
