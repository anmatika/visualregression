paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

exports.init = (opts) ->
    
    defaults =
      screenshotDelay: 0
      baseUrl: casper.cli.options.baseUrl
      libraryRoot: paths.phantomCss
      screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots')
      failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')

    options = _.defaults(opts || {}, defaults)

    phantomcss.init
        libraryRoot: options.libraryRoot
        screenshotRoot: options.screenshotRoot
        failedComparisonsRoot: options.failedComparisonsRoot
   
    exports.screenshotDelay = options.screenshotDelay

    if casper.cli.options.baseUrl?
      exports.baseUrl = options.baseUrl
    else
      casper.echo "ERROR: baseUrl not given when starting casperjs. Check casper.ps1 script."

casper.on 'error', (err) -> @die 'PhantomJS has errored: ' + err
