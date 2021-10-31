@react.component
let make = () => {
  <div>
    <h2> {React.string("metal detector game")} </h2>
    <GameCanvas width="600" height="500" canvasClassName="metal-detector-canvas" />
  </div>
}
