paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)
InitModule = require(paths.sievoInit)
LoginModule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)

casper.test.begin 'Budgeting visual tests', (test) ->
    new InitModule().init()
    new LoginModule().login()
    debug.enableClickListener()

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

    casper.run ->
      console.log '\nTHE END.'#
      # phantomcss.getExitStatus()
      casper.test.done()

