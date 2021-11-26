type fillStyle = string
type font = string
type context = {mutable fillStyle: fillStyle, mutable font: font}
@send external getContext: (Dom.element, string) => context = "getContext"
@send external fillRect: (context, int, int, int, int) => unit = "fillRect"
@send external clearRect: (context, int, int, int, int) => unit = "clearRect"
@send external beginPath: context => unit = "beginPath"
@send external closePath: context => unit = "closePath"
@send external arc: (context, int, int, int, int, int) => unit = "arc"
@send external stroke: context => unit = "stroke"
@send external fillText: (context, string, int, int) => unit = "fillText"
@send external isPointInPath: (context, int, int) => bool = "isPointInPath"
