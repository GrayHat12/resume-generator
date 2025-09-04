#import "@preview/fontawesome:0.5.0": *

#set document(
  author: "Rahul Singh",
  title: "Rahul Singh - Resume",
)

#set page(
  width: 8.26in,
  height: 11.69in,
  margin: (
    top: 0%,
    left: 0%,
    right: 0%,
    bottom: 0%,
  ),
  header: [],
  number-align: center,
  footer: context [
    #counter(page).display(
      "1/1",
      both: true,
    )
  ],
)

#let pageWithMargins(content) = {
  return layout(size => {
    return box(
      width: 100%,
      inset: (
        // top: size.height * 0.05,
        left: 4%,
        right: 4%,
        bottom: size.height * 0.05,
      ),
      // fill: blue,
      content,
    )
  })
}

#set text(
  font: "Lexend",
  size: 9.328487pt,
)

#v(0pt)

#let circle-image(image_path, radius: 10pt) = {
  let img = image(image_path)
  let size = 2 * radius
  box(
    width: size,
    height: size,
    inset: 0pt,
    radius: radius,
    clip: true,
    img,
    stroke: 3pt + rgb("#459399"),
  )
}

#let socialLink(icon, url, label) = {
  return stack(dir: ltr, spacing: 8pt, align(horizon, icon(fill: white, solid: true)), align(horizon, text(
    fill: white,
    size: 0.8em,
    weight: "regular",
  )[#link(
    url,
    label,
  )]))
}

#box(width: 100%, fill: rgb("#313C4D"), outset: 0pt, inset: 0pt)[
  #layout(size => {
    return box(width: 100%, inset: (
      top: size.height * 0.03,
      left: 4%,
      right: 4%,
      bottom: size.height * 0.02,
    ))[
      #stack(
        dir: ltr,
        spacing: 1fr,
        box(width: 75%)[
          #text(fill: white, weight: "medium", size: 2em)[Rahul Singh]
          #linebreak()
          #v(0.1pt)
          #text(fill: rgb("#459399"), weight: "medium", size: 1em)[Senior Software Engineer]

          #text(
            fill: white,
            weight: "light",
            size: 0.8em,
          )[Senior Software Engineer with more than 3 years of experience specializing in designing and building
            robust backend systems. Proficient with AWS and similar cloud service offerings. Experience securing and breaking Fingerprinting and Security SDKs. Passionate about designing solutions.]
        ],
        align(horizon, box(width: 25%)[
          #align(right + horizon, circle-image("handsome.png", radius: 45pt))
        ]),
      )
    ]
  })
]
#v(-12.7pt)
#box(width: 100%, fill: rgb("#232A33"), inset: 0pt, outset: 0pt)[
  #box(width: 100%, inset: (
    top: 10pt,
    left: 4%,
    right: 4%,
    bottom: 10pt,
  ))[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 10pt,
      socialLink(fa-envelope, "mailto:rahul.works.sde@gmail.com", "rahul.works.sde@gmail.com"),
      socialLink(fa-mobile, "tel:+919818559742", "+91 9818559742"),

      socialLink(fa-location-dot, "", "Bengaluru"),
      socialLink(fa-linkedin, "https://www.linkedin.com/in/grayhat/", "linkedin.com/in/grayhat"),

      socialLink(fa-github, "https://github.com/grayhat12", "github.com/grayhat12"),
      socialLink(
        fa-stack-overflow,
        "https://stackoverflow.com/users/12036506/gray-hat",
        "stackoverflow.com/users/12036506/gray-hat",
      ),
    )
  ]
]

// #v(10pt)

#let sectionHeading(label) = {
  return text(fill: rgb("#459399"), weight: "bold", size: 1.25em)[#underline(
    upper(label),
    background: true,
    evade: true,
    extent: 1pt,
    offset: 5pt,
    stroke: 2pt,
  )]
}

#let sectionTitle(label) = {
  return text(fill: black, weight: "semibold", size: 1.1em, label)
}

#let sectionSubTitle(label) = {
  return text(fill: black, weight: "regular", size: 1em, label)
}

#let titleMetadata(label, weight: "light") = {
  return text(fill: rgb("#459399"), weight: weight, style: "italic", size: 0.7em, label)
}

#set list(marker: text(rgb("#459399"), [•]))
#set par(justify: true)

#let workExperience(role, company, timeline, ..tasks) = {
  return [
    #sectionTitle(role)
    #linebreak()
    #sectionSubTitle(company)
    #linebreak()
    #titleMetadata(timeline)
    #linebreak()
    #titleMetadata("Achievements/Tasks")

    #text(size: 0.8em, weight: "light")[
      #for item in tasks.pos() {
        [
          - #item

        ]
      }
    ]
  ]
}

#let skillsRenderer(..skills) = {
  let inset = 6pt
  let radius = 3pt
  let fill = rgb("#989DA6")
  let weight = "regular"
  let size = 0.8em
  return [
    #for item in skills.pos() {
      [
        #box(fill: fill, inset: inset, radius: radius, text(
          fill: white,
          weight: weight,
          size: size,
          item,
        ))
      ]
    }
  ]
}

#let projectRenderer(name, url: none, tech, ..points) = {
  let techSubtitle = ""
  if tech.len() > 0 {
    techSubtitle = tech.join(", ")
  } else { techSubtitle = none }
  // techSubtitle = none
  // url = none
  if techSubtitle != none {
    techSubtitle = [#"-" (#techSubtitle)]
  }
  if url != none {
    url = [#h(5pt) #link(url, fa-up-right-from-square(size: 0.8em))]
  }
  return [
    // #stack(dir: ltr, text(name), techSubtitle, url)
    #box(width: 100%)[
      #text(name) #techSubtitle #url
    ]
    #text(size: 0.8em, weight: "light")[
      #for item in points.pos() {
        [
          - #item

        ]
      }
    ]
  ]
}

#pageWithMargins(
  columns(
    2,
    [
      #sectionHeading("WORK EXPERIENCE")
      #linebreak()

      #workExperience(
        "Software Engineer",
        "Bureau ID",
        "04/2025 - Present",
        [Building Compliance Product],
        [Designing Vault and Core API framework.],
        [Auditing and securing device and browser fingerprinting systems.],
      )
      #v(5pt)
      #workExperience(
        "Senior Software Engineer",
        "Karza Technologies",
        "04/2024 - 03/2025",
        [Improved the existing *PDF generation* solution to be *50% faster and 75% cheaper* on lambda.],
        [*Led client integrations* for *on-premise SAAS deployments* while managing third party integrations, *rate limits*, *quota controls*, and *billing*.],
        [Developed *scalable and secure microservices* having sub second latencies for the GST-ITR product. These services assist banks & NBFCs in evaluating and processing GST, income tax returns (ITR); enabling improved credit decision making.],
        [Contributing to the overall *system design* of GST-ITR application, participating in *client calls* to gather requirements and later incorporating them in our application.],
      )
      #v(5pt)
      #workExperience(
        "Software Engineer",
        "Karza Technologies",
        "07/2022 - 04/2024",
        [Designed and developed a *decision making integration layer* for fetching GST data that is being used across the GST Product.],
        [*Collaborated* with the data science team to develop an *in-house PDF parsing solution* for GST reports *saving cost* on third party licensing.],
        [Worked on *dev-tools* across the organization to help our workflows and ease local testing.],
        [Created a *plugin system for webhook module* that allows for *OAuth and Encryption support*.],
      )
      #v(5pt)
      #workExperience(
        "Software Engineer Intern",
        "Karza Technologies",
        "12/2021 - 07/2022",
        [Worked on the development of *FIU product* following all compliances.],
        [Contributed to an *organization level webhook module* implementing *PGP and JWT authentication*.],
        [*Streamlined the billing systems* *improving dashboard latencies* and *reducing invoicing time* from days to minutes.],
        [Built an *HA-Proxy monitoring and alert solution* with a desktop application.],
      )
      #colbreak()
      #sectionHeading("skills")
      #linebreak()

      #skillsRenderer(
        "AWS Lambda / SQS / EC2 / ECS",
        // "Docker",
        "Flask",
        // "Git",
        "Golang",
        "Microservices",
        "MongoDB",
        "Rabbit MQ",
        "ReactJs",
        "Redis",
        "Reverse Engineering",
        "Device Fingerprinting",
        "Rust",
        "Browser Fingerprinting",
        "Serverless",
        "Crawling / Scraping",
      )

      #sectionHeading("personal projects")
      // #linebreak()

      #projectRenderer(
        "goga",
        ("Golang",),
        url: "https://github.com/GrayHat12/goga",
        "A generic framework for neural network training implementing a evolutionary algorithm.",
        "The main aim was to create a generic framework in an efficient language which I can use in any of my NEAT based projects.",
      )
      #v(5pt)
      #projectRenderer(
        "LinkedIn Greeter",
        ("Python", "RabbitMQ", "Ollama", "Puppeteer"),
        url: "https://github.com/GrayHat12/lnkd-llm-service",
        "Scalable solution with cost analysis for a service that given a linkedin profile, scrapes their last 5 posts and uses a Large Language Model to generates a customised connection request.",
        "The main purpose was to design an open source system and explore LLM based implementations.",
      )
      #v(5pt)
      #projectRenderer(
        "PymHash",
        ("Rust",),
        url: "https://github.com/GrayHat12/pymhash",
        "Simple efficient Image Hashing Library which can be used to identify or categorise similar images even with different rotations.",
        "The main aim was to learn Rust.",
      )
      #v(5pt)
      #sectionHeading("education")

      // #linebreak()

      #sectionTitle("B.Tech Computer Science and Engineering")
      #sectionSubTitle("Sharda University")
      #linebreak()
      #stack(dir: ltr, spacing: 1fr, titleMetadata("07/2018 - 07/2022"), titleMetadata("Greater Noida"))

      // #sectionHeading("languages")
      // #linebreak()

      // #grid(
      //   columns: (1fr, 1fr),
      //   box[
      //     English
      //     #linebreak()
      //     #titleMetadata("Full Professional Proficiency")
      //   ],
      //   box[
      //     Hindi
      //     #linebreak()
      //     #titleMetadata("Full Professional Proficiency")
      //   ],
      // )
    ],
  ),
)
