#import "utils.typ"

#set document(
  title: utils.config.document.title,
  author: utils.config.document.author,
  keywords: utils.config.document.keywords,
)

// #set page(
//   margin: (
//     top: 1.5cm,
//     bottom: 1.5cm,
//     x: 2cm,
//   ),
// )

#let linkStyle = none

#if utils.config.showLinkUnderlines {
  linkStyle = underline
}

#show link: linkStyle

#eval("#include " + repr(utils.config.template), mode: "markup")
