@react.component
let make = (~width: int, ~height: int, ~canvasClassName, ~canvasRef, ~onMouseMove) => {
  <canvas
    ref={ReactDOM.Ref.domRef(canvasRef)}
    width={width->Belt.Int.toString}
    height={height->Belt.Int.toString}
    className={`game-canvas ${canvasClassName}`}
    onMouseMove={onMouseMove}
  />
}
