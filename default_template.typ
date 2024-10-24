#import "utils.typ"

#utils.defaultProfileRenderer()

#for item in utils.config.renderOrder {
    if item == "$skills" {
        utils.defaultSkillsRenderer()
    }
    else {
        utils.defaultSectionRenderer(item)
    }
}