class TitleScreen extends Screen
    min: 20
    
    update: ->
        return if @min-- > 0
        game.screen = new GameScreen() if keys.space
    
    render: (gfx) ->
        c = gfx.ctx
        
        gfx.clear()
        c.drawImage gfx.title, 180, 10
        # some instructions
        c.fillStyle = "#e0e0e0"
        c.font = "14pt monospace"
        gfx.drawSprite 5, 1, 480, 180
        c.fillText "Collecciona todos las particulas.", 50, 210
        c.fillText "Presiona space para iniciar...", 50, 240