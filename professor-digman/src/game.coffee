#game
@game =
    # dialog inicializa en null
    dialog: null
    # screen inicializa en null
    screen: null
    # inicializa el objeto @game
    init: ->
        if not gfx.init()
            alert "No puede establecerse el juego en el canvas :("
            #abortando el juego
            return
        # cargando el game!
        gfx.load ->
            game.reset()
    # detiene el game
    stop: ->
        @running = false
    # inicia el render
    start: ->
        @running = true
    # reseteamos el game
    reset: ->
        @dialog = null
        @screen = new TitleScreen()
        keys.reset()
        # si @runnning es false
        if not @running
            # pone a @running como true
            @start()
            # Mensaje de welcome
            @tick()
    # aplicamos el tick
    tick: ->
        # aborta si @running es false
        return if not @running
        @update()
        @render()
        # window.requestAnimFrame(=> @tick())
        # por el momento requestAnimFrame se pone a prueba
        window.requestAnimFrame (=> @tick()), 33
    # actualiza el canvas
    update: ->
        # si @dialog es true
        if @dialog?
            @dialog.update()
        else
            @screen.update()
    # funcion renderizadora del game
    render: ->
        gfx.clear()
        @screen.render gfx
        # Si existe @dialog.. aplica el @dialog.render
        @dialog.render gfx if @dialog