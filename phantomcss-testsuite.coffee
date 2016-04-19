phantomcss = require('../../sievo.ppm/node_modules/phantomcss')
login = require('./sievo.login')

casper.test.begin 'Budgeting visual tests', (test) ->
    phantomcss.init
        libraryRoot: '../../sievo.ppm/node_modules/phantomcss'
        screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots')
        failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')

    casper.on 'remote.message', (msg) -> @echo msg
    casper.on 'error', (err) -> @die 'PhantomJS has errored: ' + err
    casper.on 'resource.error', (err) ->
       casper.log 'Resource load error: ' + err, 'warning'

    casper.then ->
      casper.click 'a[href$=Budgeting]'
      casper.waitForText 'Manage budgets', (->
        phantomcss.screenshot '.budgetFrames', 'budget frames'
      ), ->
        casper.test.fail 'should see budget frames'

    casper.then ->
      casper.click '#label-year-2016 a'
      casper.waitForText 'New budget round', (->
        phantomcss.screenshot '#new-budgetround-panel', 'new budget round panel'
      ), ->
        casper.test.fail 'should see new budget round panel'

    casper.then ->
       #compare screenshots
       phantomcss.compareAll()

    ###
    Casper runs tests###
    casper.run ->
      console.log '\nTHE END.'#
      # phantomcss.getExitStatus()
      casper.test.done()

