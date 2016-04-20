# path = require('path')
# process = require('process')
# root = casper.cli.get('root')
paths = require('./common/sievo.module-paths')
phantomcss = require('phantomcss')
InitModule = require(paths.sievoInit)
LoginModule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)

openBudgeting = ()->
      casper.click 'a[href$=Budgeting]'
      casper.waitForText 'Manage budgets', (->
        phantomcss.screenshot '.budgetFrames', 'budget frames'
      ), ->
        casper.test.fail 'should see budget frames'

createNewBudgetRound = ()->
      casper.click '#label-year-2016 a'
      casper.waitForText 'New budget round', (->
        phantomcss.screenshot '#new-budgetround-panel', 'new budget round panel'
      ), ->
        casper.test.fail 'should see new budget round panel'

casper.test.begin 'Budgeting visual tests', (test) ->
    # @echo process.env.PWD
    
    new InitModule().init()
    new LoginModule().login()
    debug.enableClickListener()

    casper.then ->
      openBudgeting()

    casper.then ->
      createNewBudgetRound()

    casper.then ->
       #compare screenshots
       phantomcss.compareAll()

    casper.run ->
      console.log '\nTHE END.'#
      phantomcss.getExitStatus()
      casper.test.done()

