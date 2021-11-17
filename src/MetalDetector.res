type coords = {x: int, y: int}
type canvasDimensions = {width: int, height: int}
type metal = {x: int, y: int, color: string, detected: bool}
let tiles = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
let getRandomInt = (min, max) => {
  Js.Math.random_int(min, max)
}
let getRandomColor = () => {
  let colors = ["#173F5F", "#20639B", "#3CAEA3", "#F6D55C", "#ED553B"]
  colors[Js.Math.random_int(0, Belt.Array.length(colors))]
}
@react.component
let make = () => {
  let gameCanvasRef = React.useRef(Js.Nullable.null)
  let (mouseCoords, setMouseCoords) = React.useState(_ => {x: 0, y: 0})
  let dimensions = React.useRef({width: 600, height: 500})
  let (metals, setMetals) = React.useState(_ => [])
  React.useEffect0(() => {
    Js.Array2.forEach(tiles, rows => {
      Js.Array2.forEach(rows, _ => {
        setMetals(_prev =>
          Js.Array2.concat(
            _prev,
            [
              {
                x: getRandomInt(0, 600),
                y: getRandomInt(0, 500),
                color: getRandomColor(),
                detected: false,
              },
            ],
          )
        )
      })
    })
    None
  })

  let detect = (detectorX, detectorY) => {
    Js.Array2.forEach(metals, metal => {
      let distance = Js.Math.hypot(
        (detectorX - metal.x)->Belt.Int.toFloat,
        (detectorY - metal.y)->Belt.Int.toFloat,
      )
      if distance < 60->Belt.Int.toFloat {
        // TODO:  redraw metal with its color property
        Js.log(distance)
      }
    })
  }
  let drawDetector = (x, y) => {
    switch gameCanvasRef.current->Js.Nullable.toOption {
    | Some(dom) => {
        let ctx = CanvasApi.getContext(dom, "2d")
        CanvasApi.clearRect(ctx, 0, 0, dimensions.current.width, dimensions.current.height)
        Js.Array2.forEach(metals, metal => {
          CanvasApi.beginPath(ctx)
          ctx.fillStyle = "white" // Todo: assign color once detected
          CanvasApi.fillRect(ctx, metal.x, metal.y, 20, 20)
        })
        CanvasApi.beginPath(ctx)
        CanvasApi.arc(ctx, x, y - 20, 20, 0, 3 * Js.Math._PI->Belt.Float.toInt)
        CanvasApi.stroke(ctx)
        detect(x, y)
      }

    | None => ()
    }
  }

  let onMouseMove = e => {
    let x = ReactEvent.Mouse.clientX(e)
    let y = ReactEvent.Mouse.clientY(e)

    setMouseCoords(_prev => {
      x: x - ReactEvent.Mouse.target(e)["offsetLeft"],
      y: y - ReactEvent.Mouse.target(e)["offsetTop"],
    })
    if mouseCoords.x > 0 && mouseCoords.y > 0 {
      drawDetector(mouseCoords.x, mouseCoords.y)
    }
  }
  <div>
    <h2> {React.string("metal detector game")} </h2>
    <GameCanvas
      canvasRef={gameCanvasRef}
      width={dimensions.current.width}
      height={dimensions.current.height}
      canvasClassName="metal-detector-canvas"
      onMouseMove={onMouseMove}
    />
  </div>
}
