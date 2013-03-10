#
class GameScreen extends Screen
    # Número de nivel por defecto 0
    levelNumber: 0
    # El constructor inicializa con
    # @player como objeto Player
    # la función @startLevel
    constructor: ->
        @player = new Player()
        @startLevel()
    # Establece el Player
    setPlayer: (x, y, level) ->
        #Estableciendo al player en la correcta posición en el level
        @player.level = level
        @player.x = x
        @player.y = y
    # Actualizar
    update: ->
        #Actualiza el level, player, y chekea las colisiones
        @level.update()
        @player.update()
    # startLevel
    startLevel: ->
        @level = new Level levels[@levelNumber], @
        game.dialog = new LevelDialog(levels[@levelNumber].name)
    #
    levelComplete: ->
        if ++@levelNumber >= levels.length
            game.win()
        else
            @startLevel()
    # render estilo camera
    render: (gfx) ->
        gfx.ctx.save()
        
        gfx.ctx.scale 1.3, 1.3
        
        leftEdge = 210
        offx = if @player.x > leftEdge then -@player.x + leftEdge else 0
        
        gfx.ctx.translate offx, -@player.y + 130

        @level.render gfx
        @player.render gfx
        
        gfx.ctx.restore()
        
        backX = 1 - (@player.x / gfx.w) * 100
        backY = 1 - (@player.y / gfx.h) * 100
        
        # move background
        gfx.ctx.canvas.style.backgroundPosition = "#{backX}px #{backY}px"