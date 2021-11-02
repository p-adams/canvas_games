type coords = {x: int, y: int}
@send external getContext: (Dom.element, string) => 'a = "getContext"
@send external fillRect: (Dom.element, int, int, int, int) => 'a = "fillRect"
@send external clearRect: (Dom.element, int, int, int, int) => unit = "clearRect"
@send external beginPath: Dom.element => unit = "beginPath"
@react.component
let make = () => {
  let gameCanvasRef = React.useRef(Js.Nullable.null)
  let (mouseCoords, setMouseCoords) = React.useState(_ => {x: 0, y: 0})

  React.useEffect(() => {
    None
  })

  let drawRect = (x, y) => {
    switch gameCanvasRef.current->Js.Nullable.toOption {
    | Some(dom) => {
        let ctx = getContext(dom, "2d")
        clearRect(ctx, 0, 0, 600, 500)
        beginPath(ctx)
        fillRect(ctx, x, y, 25, 25)
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
      drawRect(mouseCoords.x, mouseCoords.y)
    }
  }
  <div>
    <h2> {React.string("metal detector game")} </h2>
    <GameCanvas
      canvasRef={gameCanvasRef}
      width="600"
      height="500"
      canvasClassName="metal-detector-canvas"
      onMouseMove={onMouseMove}
    />
  </div>
}
