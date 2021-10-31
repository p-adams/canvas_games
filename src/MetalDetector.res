@react.component
let make = () => {
  let gameCanvasRef = React.useRef(Js.Nullable.null)
  React.useEffect(() => {
    None
  })
  <div>
    <h2> {React.string("metal detector game")} </h2>
    <GameCanvas
      canvasRef={gameCanvasRef} width="600" height="500" canvasClassName="metal-detector-canvas"
    />
  </div>
}
