paths = require('./common/sievo.module-paths')
phantomcss = require(paths.phantomCss)
settings = require(paths.sievoSettings)
loginmodule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)
sievo = require(paths.sievoCommon)

casper.captureBudgetingMain = (screenshotName)->
    @waitForText 'Manage budgets', -> sievo.screenshot '.budgetFrames', screenshotName

casper.captureNewBudgetRound = ->
    @waitForResource /w*dimensionsToExclude=Time\b/, -> sievo.screenshot '#new-budgetround-panel', 'new budget round panel'

casper.createNewBudgetRound = ->
    @fill '#createForm', { 'Description': 'Foo' }, false
    @click '#createButton'

casper.createNewBudgetFrame = ->
    @fill '#createForm', { 'Description': 'Bar' }, false
    @click '#createButton'

casper.captureNewFrame = ->
    @waitForText 'New budget frame', -> sievo.screenshot '#new-budgetframe', 'new budget frame'

casper.test.begin 'Budgeting visual tests', (test) ->
    settings.init()
    loginmodule.login()
    debug.enableHttpListeners()

    casper.then -> @click 'a[href$=Budgeting]'
    casper.then -> @captureBudgetingMain 'budgeting main initial'
    casper.then -> @click '#label-year-2016 a'
    casper.then -> @captureNewBudgetRound()
    casper.then -> @createNewBudgetRound()
    casper.then -> @captureBudgetingMain 'budgeting main - round added'
    casper.then -> @waitForSelector '#round-id-1', -> @click '#round-id-1 a'
    casper.then -> @captureNewFrame()
    casper.then -> @createNewBudgetFrame()
    casper.then -> @click '#okButton'
    casper.then -> @captureBudgetingMain 'budgeting main - frame added'

    casper.then -> phantomcss.compareSession()

    casper.run ->
      console.log '\nTHE END.'
      casper.test.done()
      casper.test.renderResults(true, 0, 'test-results.xml')
