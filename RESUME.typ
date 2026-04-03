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
  hyphenate: false,
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
        // align(horizon, box(width: 25%)[
        //   #align(right + horizon, circle-image("profile.jpeg", radius: 45pt))
        // ]),
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

      socialLink(fa-location-dot, "📍", "Bengaluru"),
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
  if type(label) == str {
    return text(fill: black, weight: "regular", size: 1em, label)
  } else {
    return link(label.url, [#label.label#h(5pt)#fa-up-right-from-square(size: 0.6em)])
  }
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

#let simpleSkillsRenderer(..skills) = {
  let inset = 6pt
  let radius = 3pt
  let fill = rgb("#989DA6")
  let weight = "regular"
  let size = 0.8em
  let index = 0
  return [
    #columns(
      2,
      for item in skills.pos() {
        [
          - #item
          #if (index > skills.pos().len() / 2 - 2) {
            colbreak()
            index = 0
          } else {
            index += 1
          }
        ]
        // [
        //   #box(fill: fill, inset: inset, radius: radius, text(
        //     fill: white,
        //     weight: weight,
        //     size: size,
        //     item,
        //   ))
        // ]
      },
    )
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
        "Senior Software Engineer",
        (label: "Perfios", url: "https://perfios.ai/"),
        "10/2025 - Present",
        [Building Device and Browser *Fingerprinting + Security* Solutions],
        [Designing scalable, high traffic system (150 million requests per client per day with 100ms p95 latency)],
      )
      #v(5pt)
      #workExperience(
        "Software Engineer",
        (label: "Bureau ID", url: "https://bureau.id/"),
        "04/2025 - 10-2025",
        [Reverse Engineered, Designed systems for the *Compliance* Product.],
        [Redesigned Vault and Core API framework to improve development velocity for new apis and introduce customisations],
        [Reverse Engineered malwares as a part of research and development.],
        [Performed audits to secure device and browser fingerprinting systems.],
      )
      #v(5pt)
      #workExperience(
        "Senior Software Engineer",
        (label: "Karza Technologies", url: "https://www.linkedin.com/company/karza-technologies/"),
        "04/2024 - 03/2025",
        [Improved the existing *PDF generation* solution to be *50% faster and 75% cheaper* on lambda.],
        [*Led client integrations* for *on-premise SAAS deployments* while managing third party integrations, *rate limits*, *quota controls*, and *billing*.],
        [Developed *scalable and secure microservices* having sub second latencies for the GST-ITR product. These services assist banks & NBFCs in evaluating and processing GST, income tax returns (ITR); enabling improved credit decision making.],
        [Contributing to the overall *system design* of GST-ITR application, participating in *client calls* to discuss requirements and incorporate them in our application.],
      )
      #v(5pt)
      #workExperience(
        "Software Engineer",
        (label: "Karza Technologies", url: "https://www.linkedin.com/company/karza-technologies/"),
        "07/2022 - 04/2024",
        [Designed and developed a *decision making integration layer* for fetching GST data that is being used across the GST Product which reduces new integration times from month to a day.],
        [*Collaborated* with the data science team to develop an *in-house PDF parsing solution* for GST reports *saving cost* on third party licensing.],
        [Build internal *developer tooling* across the organization to help our workflows and ease local testing.],
        [Created a *plugin system for webhook module* that allows for *OAuth and Encryption support*.],
      )
      #v(5pt)
      #colbreak()
      #sectionHeading("skills")
      #linebreak()

      #simpleSkillsRenderer(
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
        // "Crawling / Scraping",
        "Automated Data Aggregations",
      )

      #sectionHeading("personal projects")
      // #linebreak()

      #projectRenderer(
        "helium",
        ("C++", "Assembly [x86 nasm]"),
        url: "https://github.com/GrayHat12/helium",
        "A compiler that compiles simple high level code directly to assembly",
        "The main aim here was to experience grammar, tokenisers, parsers and abstract syntax trees along with some hands on assembly",
      )
      #v(5pt)
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

// #pagebreak()

// #let overlay(img, color) = layout(bounds => {
//   let size = measure(img, ..bounds)
//   img
//   place(top + left, block(..size, fill: color))
// })

// #set page(
//   margin: 0pt,
//   background: overlay(image("./assets/dil.png", fit: "cover", scaling: "smooth"), white.transparentize(25%)),
// )

// #box(width: 100%, fill: rgb("#232A33"), inset: 0pt, outset: 0pt)[
//   #box(width: 100%, inset: (
//     top: 10pt,
//     left: 4%,
//     right: 4%,
//     bottom: 10pt,
//   ))[
//     #text(
//       fill: white,
//       size: 0.8em,
//       weight: "regular",
//     )[
//       Woah ! Page 2

//       List of some less relevant but good internship experiences.

//       I don't expect people to read through this
//     ]
//   ]
// ]

// #pageWithMargins(
//   columns(
//     2,
//     [
//       #sectionHeading("INTERN EXPERIENCE")
//       #linebreak()
//       #v(5pt)
//       #workExperience(
//         "Software Engineer Intern",
//         (label: "Karza Technologies", url: "https://www.linkedin.com/company/karza-technologies/"),
//         "12/2021 - 07/2022",
//         [Worked on the development of *FIU product* following all compliances.],
//         [Contributed to an *organization level webhook module* implementing *PGP and JWT authentication*.],
//         [*Streamlined the billing systems* *improving dashboard latencies* and *reducing invoicing time* from days to minutes.],
//         [Built an *HA-Proxy monitoring and alert solution* with a desktop application.],
//       )
//       #v(5pt)
//       #workExperience(
//         "Fullstack Engineer Intern",
//         (label: "Fridayy AI", url: "https://www.linkedin.com/company/fridayy-ai/"),
//         "08/2021 - 02/2022",
//         [Worked with the CTO to get build a go to market solution.],
//         [Built a B2B web app along with a rule engine for creating and deploying smart campaign contracts to lambda function.],
//         [Built an SMS categorization and parsing/data extraction module using ML that powered our B2C mobile application],
//         [Built the backend microservices for the B2C application.],
//       )
//       #v(5pt)
//       #workExperience(
//         "Fullstack Engineer Intern",
//         (label: "Referplease", url: "https://www.linkedin.com/company/referplease/"),
//         "03/2021 - 08/2022",
//         [Trained a neural network moderator for the platform.],
//         [Built a web scraping solution to regularly scrape multiple sources and find relevant tech job referral posts, verify them with our moderator and add them to the platform.],
//         [Built a PWA that functions as a mobile, desktop and web app.],
//         [Worked with the founders in assisting our users, technical support, A/B Testing and customer feedback.],
//       )
//       #v(5pt)
//       #workExperience(
//         "Software Engineer Intern",
//         (label: "Chefkart", url: "https://www.linkedin.com/company/chefkart/"),
//         "06/2020 - 09/2020",
//         [First time working on backend.],
//         [Built a web app on ReactJS],
//         [Used Ionic Framework to built a Cross Platform Mobile Application.],
//         [Built multiple Capacitor Plugins to resolve issues with the then available official plugins.],
//       )

//       #colbreak()
//       #align(center)[
//         #image("./assets/sick.png")
//         #v(20pt)
//         Some Images to fill this empty space
//         #v(20pt)
//         #image("./assets/expectations.png")
//         #v(20pt)
//         A cat
//         #v(20pt)
//         #image("./assets/meowdy.png", height: 200pt)
//       ]
//     ],
//   ),
// )
