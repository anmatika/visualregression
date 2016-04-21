paths = require('./common/sievo.module-paths')
phantomcss = require(paths.phantomCss)
initmodule = require(paths.sievoInit)
loginmodule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)

casper.captureBudgetingMain = ->
      @waitForText 'Manage budgets', ->
        phantomcss.screenshot '.budgetFrames', 'budget frames'
      , -> @test.fail 'should see budget frames'

casper.captureNewBudgetRound = ->
      @waitForResource /w*dimensionsToExclude=Time\b/, ->
          phantomcss.screenshot '#new-budgetround-panel', 'new budget round panel'
      , -> @test.fail 'ajax request left hanging'

casper.captureNewFrame = ->
      @waitForText 'New budget frame', ->
          phantomcss.screenshot '#new-budgetframe', 'new budget frame'
      , -> @test.fail 'New budget frame wont open'

casper.test.begin 'Budgeting visual tests', (test) ->
    initmodule.init()
    loginmodule.login()
    debug.enableClickListener()

    casper.then -> @click 'a[href$=Budgeting]'
    casper.then -> @captureBudgetingMain()
    casper.then -> @click '#label-year-2016 a'
    casper.then -> @captureNewBudgetRound()
    casper.back()
    casper.then -> @click '#round-id-1 a'
    casper.then -> @captureNewFrame()

    #casper.then -> phantomcss.compareAll()
    casper.then -> phantomcss.compareSession()

    casper.run ->
      console.log '\nTHE END.'#
      #phantomcss.getExitStatus()
      casper.test.done()

