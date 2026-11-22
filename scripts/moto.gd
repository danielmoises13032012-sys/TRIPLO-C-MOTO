extends CharacterBody3D

@export var velocidade_maxima = 25.0
@export var aceleracao = 12.0
@export var rotacao = 2.0

var velocidade = 0.0
var acelerar_toque = false
var travar_toque = false
var esquerda_toque = false
var direita_toque = false

func _physics_process(delta):
    if Input.is_action_pressed("ui_up") or acelerar_toque:
        velocidade += aceleracao * delta
    elif Input.is_action_pressed("ui_down") or travar_toque:
        velocidade -= aceleracao * delta
    else:
        velocidade = move_toward(velocidade, 0.0, 5.0 * delta)

    velocidade = clamp(velocidade, -8.0, velocidade_maxima)

    var direcao = Input.get_axis("ui_right", "ui_left")

    if esquerda_toque:
        direcao = 1.0
    elif direita_toque:
        direcao = -1.0

    rotate_y(direcao * rotacao * delta)

    velocity = -transform.basis.z * velocidade
    move_and_slide()
