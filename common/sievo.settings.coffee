paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

exports.init = ->
    phantomcss.init
        libraryRoot: paths.phantomCss
        screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots')
        failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')

    casper.on 'remote.message', (msg) -> @echo 'remote.message: ' + msg
    casper.on 'step.complete', (stepResult) -> @echo stepResult if stepResult
    #casper.on 'onComplete', (allTests, noOfFails, noOfErrors) ->
      #allTests.forEach (test) ->
        #console.log test.filename, test.mismatch if test.fail

    casper.on 'error', (err) -> @die 'PhantomJS has errored: ' + err
    #casper.on 'resource.received', (r) -> @echo r
    casper.on 'resource.error', (err) ->
       casper.log 'Resource load error: ' + err, 'warning'

exports.screenshotDelay = 250
