#import "utils.typ"

#set document(
    title: utils.config.document.title,
    author: utils.config.document.author,
    keywords: utils.config.document.keywords,
)

#if utils.config.showLinkUnderlines {
    show link: underline
}

#include "Profile.typ"

#for item in utils.config.renderOrder {
    if item == "$skills" {
        if utils.config.skills.enabled {
            v(10pt)
            include "Skills.typ"
        }
    }
    else {
        let title = item
        let section = utils.config.sections.at(title)
        v(1pt * utils.config.sectionSpacing)
        [
            == #title
            #line(length: 100%)
            #for (index, singleBlock) in section.blocks.enumerate() {
                if index > 0 {
                    v(1pt * section.blockSpacing)
                }
                block(breakable: false)[
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
            }
        ]
    }
}