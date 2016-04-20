paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

exports.enableClickListener = ()->
  casper.on 'click', (resource, request) ->
      @echo "clicked: " + resource
