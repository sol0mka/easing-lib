require ['createGraph', 'Tween', 'EaseLib'], (createGraph, TWEEN, EaseLib)->
    init = ->
        target = document.getElementById("target")
        target.appendChild document.createElement("br")
        target.appendChild createGraph("Quake.Out", EaseLib.Quake.Out)
        target.appendChild createGraph("Quake.In", EaseLib.Quake.In)
        target.appendChild document.createElement("br")
        target.appendChild createGraph("Quartic.In", TWEEN.Easing.Quartic.In)

    animate = ->
        requestAnimationFrame animate
        TWEEN.update()
    init()
    animate()