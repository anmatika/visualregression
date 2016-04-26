paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

enableClickListener = ()->
  casper.on 'click', (resource, request) ->
      @echo "clicked: " + resource

enableHttp200Listener = ()->
  casper.on 'http.status.200', (resource) ->
      @echo "http 200: " + resource.url

enableHttp404Listener = ()->
  casper.on 'http.status.404', (resource) ->
      @echo "http 404: " + resource.url

exports.enableClickListener = enableClickListener
exports.enableHttp200Listener = enableHttp200Listener
exports.enableHttp404Listener = enableHttp404Listener
exports.enableHttpListeners = ()->
  enableHttp200Listener()
  enableHttp404Listener()
