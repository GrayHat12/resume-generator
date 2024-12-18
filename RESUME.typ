#set document(
    title: "Rahul's Resume",
    author: "Rahul Singh",
    keywords: ("resume", "rahul", "sde", "backend", "engineer"),
)

#set text(
    font: "Calibri"
)

#set page(
    footer: context [
    #stack(dir: ltr, spacing: 1fr)[][
        #align(center)[
            #text(8pt)[
                #show link: underline
                The Resume is maintained at #link("https://github.com/GrayHat12/resume-generator")[GrayHat12/resume-generator]
            ]
        ]
    ][
        #align(right)[
            #text(8pt)[
                #counter(page).display(
                "1 / 1",
                both: true,
                )
            ]
        ]
    ]
    ]
)

#include "Profile.typ"

#v(1pt)

#include "Skills.typ"

#v(1pt)

#include "Experience.typ"

#v(1pt)

#include "Projects.typ"

// #v(1pt)

// #include "Education.typ"