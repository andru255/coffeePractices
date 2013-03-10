class Player extends Entity
    constructor: ->
        # Se puede hacer un override a la clase padre
        # super level, x, y
        # Pero tambien se puede hacer algo mas chevere, con esto pasan toooodos los params automaticamente
        super
        @dir = "RIGHT"
        
    update: ->
        xo = yo = 0

        if not @falling
            if keys.left
                xo -= @speed
                @dir = "LEFT"
            
            if keys.right
                xo += @speed
                @dir = "RIGHT"
        
        yo += @speed if keys.down and @onLadder
        yo -= @speed if keys.up and @onLadder and not @onTopOfLadder
        
        @dig() if keys.space
        
        # @x -= @speed if keys.left
        # @x += @speed if keys.right
        # @y += @speed if keys.down
        # @y -= @speed if keys.up
        console.info "#{xo}, #{yo}"
        @move xo, yo
        
    render: (gfx) ->
        fy = fx = 0
        isLeft = @dir is "LEFT"
        
        if @falling
            fx = 1 if isLeft
            fy = 2
        else
            fx = 2 if isLeft
            fx += utils.counter 2 if keys.left or keys.right
        
        gfx.drawSprite fx, fy, @x, @y
    
    dig: ->
        return if utils.now() - @lastDig < (6 * 1000) # 6 segundos
        
        @level.digAt @dir, @x, @y
        @lastDig = utils.now()