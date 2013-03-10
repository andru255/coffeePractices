gfx =
    # coordenadas para manejar el sprite
    tileW: 24
    tileH: 24
    init: ->
        #canvasDOM = document.getElementById "canvas"
        # algo un poco mas contemporaneo
        canvas = document.querySelector "#canvas"
        # @ctx = canvasDOM.getContext "2d"
        # Pero que pasaría si no encuentra el tag?... aja! aqui una solución bien chevere
        # @ctx = canvasDOM.getContext "2d" if canvasDOM != null
        #return @ctx == null
        # esta forma nos ayuda a detener la ejecución en caso no encuentre el elemento
        # pero se puede hacer algo mucho mas bacan
        @ctx = canvas?.getContext? "2d"
        return false if not @ctx
        #@ctx?
        # usando el operador "?" es como una condicional si una variable realmente tiene asignado un valor
        # como el canvas tiene width y height
        @w = canvas.width
        @h = canvas.height
        true
    # haciendo limpieza del drawing del canvas
    clear: -> gfx.ctx.clearRect 0, 0, @w, @h
    # función onload para la carga de los resources
    load: (onload) ->
        @sprites = new Image()
        @sprites.src = "resources/sprites.png"
        # cuando llamamos al load quiere decir que la carga de las imágenes está lista
        # como se ve el parámetro load está siendo utilizado como callBack
        @sprites.onload = -> onload()
        #
        @title = new Image()
        @title.src = "resources/title.png"
    # hace el trabajo
    drawSprite: (col, row, x, y, w = 1, h = 1, scale = 1) ->
        w *= @tileW
        h *= @tileH
        @ctx.drawImage @sprites,
                    col * w, row * h, w, h,
                    x, y, w * scale, h * scale