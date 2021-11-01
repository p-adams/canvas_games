type coords = {x: int, y: int}
@react.component
let make = () => {
  let gameCanvasRef = React.useRef(Js.Nullable.null)
  let (mouseCoords, setMouseCoords) = React.useState(_ => {x: 0, y: 0})
  React.useEffect(() => {
    None
  })
  let onMouseMove = e => {
    let x = ReactEvent.Mouse.clientX(e)
    let y = ReactEvent.Mouse.clientY(e)
    setMouseCoords(_prev => {x: x, y: y})
    Js.log(`x: ${Belt.Int.toString(x)} y: ${Belt.Int.toString(y)}`)
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
