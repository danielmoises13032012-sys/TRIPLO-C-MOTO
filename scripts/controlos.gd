extends CanvasLayer

var moto: Node3D

func criar_botao(nome, texto, propriedade, posicao):
    var botao = Button.new()
    botao.name = nome
    botao.text = texto
    botao.position = posicao
    botao.size = Vector2(120, 80)
    botao.add_theme_font_size_override("font_size", 20)
    add_child(botao)

    botao.button_down.connect(func():
        if is_instance_valid(moto):
            moto.set(propriedade, true)
    )

    botao.button_up.connect(func():
        if is_instance_valid(moto):
            moto.set(propriedade, false)
    )

func _ready():
    moto = get_parent().get_node("Moto")

    var tamanho = get_viewport().get_visible_rect().size

    criar_botao("Esquerda", "◀", "esquerda_toque",
        Vector2(20, tamanho.y - 110))

    criar_botao("Direita", "▶", "direita_toque",
        Vector2(150, tamanho.y - 110))

    criar_botao("Acelerar", "ACELERAR", "acelerar_toque",
        Vector2(tamanho.x - 140, tamanho.y - 200))

    criar_botao("Travar", "TRAVAR", "travar_toque",
        Vector2(tamanho.x - 140, tamanho.y - 110))
