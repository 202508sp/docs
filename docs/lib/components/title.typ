#let head(title, body) = [
  #set page(
    header: context {
      if counter(page).get().first() == 1 {
        (
          [
            #align(right)[#title]
          ]
        )
      }
    }
  )
  #body
]