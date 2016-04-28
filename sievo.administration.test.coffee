paths = require('./common/sievo.module-paths')
phantomcss = require('phantomcss')
settings = require(paths.sievoSettings)
loginmodule = require(paths.sievoLogin)
sievo = require(paths.sievoCommon)
x = require('casper').selectXPath

casper.captureAdminMain = ->
    @waitForSelector x('//*[@id="content"]'), -> sievo.screenshot '#content', 'admin #content'

casper.captureAddUser = ->
    @waitForSelector '#addUserForm', -> sievo.screenshot '#addUserForm', 'admin #addUserForm'

casper.test.begin 'admin visual tests', (test) ->
    settings.init()
    loginmodule.login()

    casper.then -> @click 'a[href$=Administration]'
    casper.then -> @captureAdminMain()

    casper.then -> @click 'a[href$=AddUser]'
    casper.then -> @captureAddUser()

    casper.then -> phantomcss.compareSession()

    casper.run ->
      console.log '\nTHE END.'
      casper.test.done()
      casper.test.renderResults(true, 0, 'test-results.administration.xml')

