extends Node3D

func _ready():
    for i in range(20):
        var linha = MeshInstance3D.new()
        var malha = BoxMesh.new()

        malha.size = Vector3(0.15, 0.03, 2.0)
        linha.mesh = malha
        linha.position = Vector3(0, 0.02, -i * 4)

        add_child(linha)
