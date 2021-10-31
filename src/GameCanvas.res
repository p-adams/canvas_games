@react.component
let make = (~width, ~height, ~canvasClassName, ~canvasRef) => {
  <canvas
    ref={ReactDOM.Ref.domRef(canvasRef)}
    width={width}
    height={height}
    className={`game-canvas ${canvasClassName}`}
  />
}
