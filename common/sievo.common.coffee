paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)
settings = require(paths.sievoSettings)

exports.screenshot = (selector, name)->
  phantomcss.screenshot(selector, settings.screenshotDelay, {}, name)
