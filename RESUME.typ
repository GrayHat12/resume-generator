#import "utils.typ"

#set document(
    title: utils.config.document.title,
    author: utils.config.document.author,
    keywords: utils.config.document.keywords,
)

#let linkStyle = none

#if utils.config.showLinkUnderlines {
    linkStyle = underline
}

#show link: linkStyle

#eval("#include "+repr(utils.config.template), mode: "markup")