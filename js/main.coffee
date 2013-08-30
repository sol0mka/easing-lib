init = ->
    createGraph = (t, f, c) ->
        div = document.createElement("div")
        div.style.display = "inline-block"
        div.style.width = "200px"
        div.style.height = "120px"
        canvas = document.createElement("canvas")
        canvas.width = 180
        canvas.height = 100
        context = canvas.getContext("2d")
        context.fillStyle = "rgb(250,250,250)"
        context.fillRect 0, 0, 180, 100
        context.lineWidth = 0.5
        context.strokeStyle = "rgb(230,230,230)"
        context.beginPath()
        context.moveTo 0, 20
        context.lineTo 180, 20
        context.moveTo 0, 80
        context.lineTo 180, 80
        context.closePath()
        context.stroke()
        context.lineWidth = 2
        context.strokeStyle = "rgb(255,127,127)"
        position =
            x: 5
            y: 80

        position_old =
            x: 5
            y: 80

        new TWEEN.Tween(position).to(
            x: 175
        , 2000).easing(TWEEN.Easing.Linear.None).start()
        new TWEEN.Tween(position).to(
            y: 20
        , 2000).easing(f).onUpdate(->
            context.beginPath()
            context.moveTo position_old.x, position_old.y
            context.lineTo position.x, position.y
            context.closePath()
            context.stroke()
            position_old.x = position.x
            position_old.y = position.y
        ).start()
    div.appendChild document.createTextNode(t)
    div.appendChild document.createElement("br")
    div.appendChild canvas
    div
    target = document.getElementById("target")
    target.appendChild createGraph("Linear.None", TWEEN.Easing.Linear.None)
    target.appendChild document.createElement("br")
    target.appendChild createGraph("Quadratic.In", TWEEN.Easing.Quadratic.In)
    target.appendChild createGraph("Quadratic.Out", TWEEN.Easing.Quadratic.Out)
    target.appendChild createGraph("Quadratic.InOut", TWEEN.Easing.Quadratic.InOut)
    target.appendChild createGraph("Cubic.In", TWEEN.Easing.Cubic.In)
    target.appendChild createGraph("Cubic.Out", TWEEN.Easing.Cubic.Out)
    target.appendChild createGraph("Cubic.InOut", TWEEN.Easing.Cubic.InOut)
    target.appendChild document.createElement("br")
    target.appendChild createGraph("Quartic.In", TWEEN.Easing.Quartic.In)
    target.appendChild createGraph("Quartic.Out", TWEEN.Easing.Quartic.Out)
    target.appendChild createGraph("Quartic.InOut", TWEEN.Easing.Quartic.InOut)
    target.appendChild createGraph("Quintic.In", TWEEN.Easing.Quintic.In)
    target.appendChild createGraph("Quintic.Out", TWEEN.Easing.Quintic.Out)
    target.appendChild createGraph("Quintic.InOut", TWEEN.Easing.Quintic.InOut)
    target.appendChild document.createElement("br")
    target.appendChild createGraph("Sinusoidal.In", TWEEN.Easing.Sinusoidal.In)
    target.appendChild createGraph("Sinusoidal.Out", TWEEN.Easing.Sinusoidal.Out)
    target.appendChild createGraph("Sinusoidal.InOut", TWEEN.Easing.Sinusoidal.InOut)
    target.appendChild createGraph("Exponential.In", TWEEN.Easing.Exponential.In)
    target.appendChild createGraph("Exponential.Out", TWEEN.Easing.Exponential.Out)
    target.appendChild createGraph("Exponential.InOut", TWEEN.Easing.Exponential.InOut)
    target.appendChild document.createElement("br")
    target.appendChild createGraph("Circular.In", TWEEN.Easing.Circular.In)
    target.appendChild createGraph("Circular.Out", TWEEN.Easing.Circular.Out)
    target.appendChild createGraph("Circular.InOut", TWEEN.Easing.Circular.InOut)
    target.appendChild createGraph("Elastic.In", TWEEN.Easing.Elastic.In)
    target.appendChild createGraph("Elastic.Out", TWEEN.Easing.Elastic.Out)
    target.appendChild createGraph("Elastic.InOut", TWEEN.Easing.Elastic.InOut)
    target.appendChild document.createElement("br")
    target.appendChild createGraph("Back.In", TWEEN.Easing.Back.In)
    target.appendChild createGraph("Back.Out", TWEEN.Easing.Back.Out)
    target.appendChild createGraph("Back.InOut", TWEEN.Easing.Back.InOut)
    target.appendChild createGraph("Bounce.In", TWEEN.Easing.Bounce.In)
    target.appendChild createGraph("Bounce.Out", TWEEN.Easing.Bounce.Out)
    target.appendChild createGraph("Bounce.InOut", TWEEN.Easing.Bounce.InOut)
animate = ->
    requestAnimationFrame animate
    TWEEN.update()
init()
animate()