paths = require('./common/sievo.module-paths')
phantomcss = require('phantomcss')
settings = require(paths.sievoSettings)
loginmodule = require(paths.sievoLogin)
debug = require(paths.sievoDebug)
sievo = require(paths.sievoCommon) 

casper.captureContractsMain = ->
      @waitForResource /data:image\/png;base64/, ->
         sievo.screenshot '#contracts-main-wrapper', 'contracts-main-wrapper'
      , -> @test.fail 'should see contract management'

casper.captureContractDetail = ->
      @waitForResource /Contracts\/Notification/, ->
        sievo.screenshot '#content', 'contracts #content'
      , -> @test.fail 'should see contract management'

casper.captureEditContract = ->
      @waitForResource /dimension\/getEntitiesOnLevel/, ->
        sievo.screenshot 'section[ng-controller="EditContractController as main"]', 'contracts editContractController'
      , ->
        @test.fail 'should see edit contract'

casper.captureTransferOwnership = ->
      @waitForResource /Contracts\/ContractDetail/, ->
        sievo.screenshot 'section[ng-controller="TransferOwnershipController as main"]', 'contracts transferOwnership'
      , ->
        @test.fail 'should see contract transfer ownership'

casper.test.begin 'contracs visual tests', (test) ->
    settings.init()
    loginmodule.login()
    debug.enableClickListener()

    casper.then -> @click 'a[href$=Contracts]'
    casper.wait 500, -> casper.then -> @captureContractsMain()

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
      casper.test.renderResults(true, 0, 'test-results.xml')

