@react.component
let make = (~width, ~height, ~canvasClassName) => {
  <canvas width={width} height={height} className={`game-canvas ${canvasClassName}`} />
}
