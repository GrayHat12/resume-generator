#import "utils.typ"

== #utils.config.skills.heading
#line(length: 100%)

#let inset = 4pt;
#let radius = 2pt;
#let fill = rgb("#e6e6e6");

#for skill in utils.config.skills.items {
  box(
    fill: rgb(utils.config.skills.fill),
    inset: 1pt * utils.config.skills.inset,
    radius: 1pt * utils.config.skills.radius,
  )[*#skill*]
}