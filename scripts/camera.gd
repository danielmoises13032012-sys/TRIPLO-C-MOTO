extends Camera3D

@export var distancia = 9.0
@export var altura = 5.0
@export var suavidade = 5.0

var alvo: Node3D

func _ready():
    alvo = get_parent().get_node("Moto")

func _process(delta):
    if alvo == null:
        return

    var destino = alvo.global_position
    destino += alvo.global_basis.z * distancia
    destino.y += altura

    global_position = global_position.lerp(
        destino,
        clamp(suavidade * delta, 0.0, 1.0)
    )

    look_at(alvo.global_position + Vector3(0, 1, 0))
