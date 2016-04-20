paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

class Init
    init: ()->
        phantomcss.init
            libraryRoot: paths.phantomCss
            screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots')
            failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')

        casper.on 'remote.message', (msg) -> @echo msg
        casper.on 'error', (err) -> @die 'PhantomJS has errored: ' + err
        casper.on 'resource.error', (err) ->
           casper.log 'Resource load error: ' + err, 'warning'


module.exports = Init

