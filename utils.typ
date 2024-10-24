#let config = json("data.json")

#let defaultProfileRenderer() = {
    return [
        #align(center)[
            = #config.heading.head
            ]

            #let socials = ()
            #for item in config.heading.links {
            socials.push([
                #link(item.link)[
                #item.text
                ]
            ])
            }

            #align(center)[
            #stack(dir: ltr, spacing: 10pt, ..socials)
        ]
    ];
}

#let defaultSkillsRenderer() = {
  if config.skills.enabled {
    v(1pt * config.skills.topMargin)
    return [
      == #config.skills.heading
      #line(length: 100%)
      #for skill in config.skills.items {
          box(
              fill: rgb(config.skills.fill),
              inset: 1pt * config.skills.inset,
              radius: 1pt * config.skills.radius,
          )[*#skill*]
          h(1pt * config.skills.spacing)
      }
    ]
    v(1pt * utils.config.skills.bottomMargin)
  }
}

#let defaultBlockRenderer(index, section, singleBlock) = {
	return [
		#if index > 0 {
			v(1pt * section.blockSpacing)
		}
		#block(breakable: false)[
			#stack(dir: ltr, spacing: 1fr)[
				=== #singleBlock.title
			][
				#singleBlock.subtext
			]
			#eval(singleBlock.subtitle, mode: "markup")
			#for point in singleBlock.points {
				[- #eval(point, mode: "markup")]
			}
		]
	];
}

#let defaultSectionRenderer(item) = {
	let title = item
	let section = config.sections.at(title)
	return [
		#v(1pt * config.sectionSpacing)
		== #title
		#line(length: 100%)
		#for (index, singleBlock) in section.blocks.enumerate() {
			defaultBlockRenderer(index, section, singleBlock)
		}
	]
}