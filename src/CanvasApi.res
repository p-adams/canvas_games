type context = {mutable fillStyle: string, mutable font: string}
@send external getContext: (Dom.element, string) => context = "getContext"
@send external fillRect: (context, int, int, int, int) => unit = "fillRect"
@send external clearRect: (context, int, int, int, int) => unit = "clearRect"
@send external beginPath: context => unit = "beginPath"
@send external arc: (context, int, int, int, int, int) => unit = "arc"
@send external stroke: context => unit = "stroke"
@send external fillText: (context, string, int, int) => 'a = "fillText"
