#catching dom
formDom =
    txtAdd: 'item'
    btnAdd: 'agregar'
#class functions of form
FormMant =
    add: (e)->
        console.log "Agregando!"
        e.preventDefault()
#init
window.onload = ->
    console.log formDom
    console.info FormMant
    document.getElementById(formDom.btnAdd).addEventListener('click', FormMant.add)
    
    #canvas
    ctx = document.getElementById("canvas").getContext("2d")
    ctx.fillStyle = "#000000"
    ctx.fillRect 0, 0, ctx.canvas.width, ctx.canvas.height
    noise = () ->
        for x in [1..20]
            for y in [0..10]
                color = Math.floor(Math.random() * 360)
                ctx.fillStyle = "hsl(#{color}, 60%, 50%)"
                ctx.fillRect x * 15, y *15, 14, 14
    setInterval noise, 100