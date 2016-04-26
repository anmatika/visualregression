paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)
settings = require(paths.sievoSettings)

exports.screenshot = (selector, name, ignoreSelector)->
  casper.echo 'taking screenshot, delay: ' + settings.screenshotDelay
  phantomcss.screenshot(selector, settings.screenshotDelay, ignoreSelector, name)
