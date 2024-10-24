#import "utils.typ"

#set document(
    title: utils.config.document.title,
    author: utils.config.document.author,
    keywords: utils.config.document.keywords,
)

#if utils.config.showLinkUnderlines {
    show link: underline
}

#eval("#include "+repr(utils.config.template), mode: "markup")