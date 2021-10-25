import canvas, dom

proc onLoad() {.exportc.} =
    var canvas = document.getElementById("canvas").EmbedElement
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight
    var ctx = canvas.getContext("2d")
    ctx.fillStyle = "#1d4099"
    ctx.fillRect(0, 0, window.innerWidth, window.innerHeight)