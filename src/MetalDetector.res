type coords = {x: int, y: int}
type canvasDimensions = {width: int, height: int}
let tiles = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
let getRandomInt = (min, max) => {
  Js.Math.random_int(min, max)
}
@react.component
let make = () => {
  let gameCanvasRef = React.useRef(Js.Nullable.null)
  let (mouseCoords, setMouseCoords) = React.useState(_ => {x: 0, y: 0})
  let dimensions = React.useRef({width: 600, height: 500})
  let (metalCoords, setMetalCoords) = React.useState(_ => [])
  React.useEffect0(() => {
    Js.Array2.forEach(tiles, rows => {
      Js.Array2.forEach(rows, _ => {
        setMetalCoords(_prev =>
          Js.Array2.concat(
            _prev,
            [
              {
                x: getRandomInt(0, 600),
                y: getRandomInt(0, 500),
              },
            ],
          )
        )
      })
    })
    None
  })

  let drawDetector = (x, y) => {
    switch gameCanvasRef.current->Js.Nullable.toOption {
    | Some(dom) => {
        let ctx = CanvasApi.getContext(dom, "2d")
        CanvasApi.clearRect(ctx, 0, 0, dimensions.current.width, dimensions.current.height)
        CanvasApi.beginPath(ctx)
        CanvasApi.arc(ctx, x, y - 20, 20, 0, 3 * Js.Math._PI->Belt.Float.toInt)
        CanvasApi.stroke(ctx)
        Js.Array2.forEach(metalCoords, coords => {
          CanvasApi.beginPath(ctx)
          ctx.fillStyle = "green"
          CanvasApi.fillRect(ctx, coords.x, coords.y, 20, 20)
        })
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
