extends CharacterBody2D

var SPEED = 15
var screensize = Vector2(1920, 1080)
var moviment = "Correr_baixo"


#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screensize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Correr_esquerda", "Correr_direita", "Correr_cima", "Correr_baixo")
	position += velocity * delta * SPEED
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	if velocity.length() > 0:
		if velocity.x > 0:
			$AnimatedSprite2D.animation = "Correr_direita"
			moviment = "Parado_direita"
		elif velocity.x < 0:
			$AnimatedSprite2D.animation = "Correr_esquerda"
			moviment = "Parado_esquerda"
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = "Correr_baixo"
			moviment = "Parado_baixo"
		elif velocity.y < 0:
			$AnimatedSprite2D.animation = "Correr_cima"
			moviment = "Parado_cima"

		$AnimatedSprite2D.play()
	else:
		if $AnimatedSprite2D.animation != moviment:
			$AnimatedSprite2D.animation = moviment
		$AnimatedSprite2D.play()
