paths = require('./common/sievo.module-paths')
phantomcss = require('phantomcss')
initmodule = require(paths.sievoInit)
loginmodule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)

casper.captureContractsMain = ->
      @waitForResource /Contracts\/Notification/, ->
        #have to wait a bit for slick grid rendering
        @wait 100, -> phantomcss.screenshot '#contracts-main-wrapper', 'contracts-main-wrapper'
      , ->
        @test.fail 'should see contract management'

casper.captureContractDetail = ->
      @waitForResource /Contracts\/Notification/, ->
        phantomcss.screenshot '#content', 'contracts #content'
      , ->
        @test.fail 'should see contract management'

casper.captureEditContract = ->
      @waitForResource /dimension\/getEntitiesOnLevel/, ->
        phantomcss.screenshot 'section[ng-controller="EditContractController as main"]', 'contracts editContractController'
      , ->
        @test.fail 'should see edit contract'

casper.captureTransferOwnership = ->
      @waitForResource /Contracts\/ContractDetail/, ->
        phantomcss.screenshot 'section[ng-controller="TransferOwnershipController as main"]', 'contracts transferOwnership'
      , ->
        @test.fail 'should see contract transfer ownership'

casper.test.begin 'contracs visual tests', (test) ->
    initmodule.init()
    loginmodule.login()
    debug.enableClickListener()

    casper.then -> @click 'a[href$=Contracts]'
    casper.then -> @captureContractsMain()

    casper.then -> @click '#contract0'
    casper.then -> @captureContractDetail()

    casper.then -> @click '#action-edit-contract'
    casper.then -> @captureEditContract()
    casper.then -> @back()

    casper.then -> @waitForText 'Contract details', -> @click '#action-transfer-ownership'
    casper.then -> @captureTransferOwnership()

    casper.then -> phantomcss.compareSession()

    casper.run ->
      console.log '\nTHE END.'#
      casper.test.done()

