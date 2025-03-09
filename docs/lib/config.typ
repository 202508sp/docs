#import "components/title.typ": head
#import "@preview/whalogen:0.1.0": ce as whalogen

#let ce(body) = [ $#whalogen(body)$ ]

#let light(body) = [
  #highlight(
    top-edge: "x-height",
    fill: rgb("#ffff00"),
    [*#body*]
  )
]

#let conf(
    title: none,
    doc,
) = {
    set heading(numbering: "1.")
    show heading: it => {
        pad(
          top: 10pt,
          bottom: -25pt,
          [#it\ ]
        )

        if it.level <= 2 {
            line(length: 100%, stroke: rgb("#eee"))
        }

        pad(bottom: -15pt, [])

        if it.level > 2 {
            pad(bottom: -5pt, [])
        }
    }

    set text(
        font: (
            "LINE Seed JP App_TTF",
            "LINE Seed Sans App",
            "M+ 1p",
            "Noto Sans CJK JP",
            "Meiryo",
        ),
    )

  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true): it => {
    let lines = it.text.split("\n")
    grid(
        columns: (auto, 1fr),
        column-gutter: 1em,
        box(
          align(right)[
            #for i in range(0, lines.len()) {
                text(fill: rgb("#949494"),str(i + 1)) + linebreak()
            }],
        ),
        it
    )
  }
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(250),
    stroke: 0.7pt + rgb("#dddddd"),
    inset: 10pt,
    radius: 4pt,
  )
  show raw: set text(
    font: (
      "M+ 1c",
      "Source Code Pro"
    ),
  )

  set table(
    inset: 10pt,
    fill: (_, y) => if calc.even(y) and y != 0 { rgb("#f8f8f8") },
    stroke: 0.7pt + rgb("#dddddd")
  )
  show table.cell.where(y:0): strong

  import "@preview/quick-maths:0.1.0": shorthands
  show: shorthands.with(
    ($+-$, $plus.minus$),
    ($|-$, math.tack),
    ($<=$, math.arrow.l.double)
  )

    head(title)[
        #doc
    ]
}