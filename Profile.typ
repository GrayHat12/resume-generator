#import "utils.typ"

#align(center)[
  = #utils.config.heading.head
]

#let socials = ()
#for item in utils.config.heading.links {
  socials.push([
    #link(item.link)[
      #item.text
    ]
  ])
}

#align(center)[
  #stack(dir: ltr, spacing: 10pt, ..socials)
]