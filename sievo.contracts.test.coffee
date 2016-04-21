paths = require('./common/sievo.module-paths')
phantomcss = require('phantomcss')
initmodule = require(paths.sievoInit)
loginmodule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)

casper.captureContractsMain = ->
      @waitForResource /Contracts\/Notification/, ->
        phantomcss.screenshot '#contracts-main-wrapper', 'contracts-main-wrapper'
      , ->
        @test.fail 'should see contract management'

casper.captureContractDetail = ->
      @waitForResource /Contracts\/Notification/, ->
        phantomcss.screenshot '#content', 'contracts #content'
      , ->
        @test.fail 'should see contract management'

casper.test.begin 'contracs visual tests', (test) ->
    initmodule.init()
    loginmodule.login()
    debug.enableClickListener()

    casper.then -> casper.click 'a[href$=Contracts]'
    casper.then -> @captureContractsMain()

    casper.then -> casper.click '#contract0'
    casper.then -> @captureContractDetail()

    casper.then -> phantomcss.compareSession()

    casper.run ->
      console.log '\nTHE END.'#
      casper.test.done()

