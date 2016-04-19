fs = require('fs')
phantomcss = require('../node_modules/phantomcss')

casper.test.begin 'Budgeting visual tests', (test) ->
    phantomcss.init
        libraryRoot: '../node_modules/phantomcss'
        screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots')
        failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')

    casper.on 'remote.message', (msg) -> @echo msg
    casper.on 'error', (err) -> @die 'PhantomJS has errored: ' + err
    casper.on 'resource.error', (err) ->
       casper.log 'Resource load error: ' + err, 'warning'

    casper.start 'http://sievo082.sievofi.local:55555/AnttiM'
    casper.viewport 1024, 768
    casper.then ->
    	phantomcss.screenshot '#login-logo', 'login logo'

    casper.then ->
      casper.click '#loginButton'
      casper.waitForSelector '.message', (->
    	  phantomcss.screenshot '.message', 'error message span'
      ), ->
    	  casper.test.fail 'Should see error message'

    casper.then ->
      casper.sendKeys('#UserName', 'anttim')
      casper.sendKeys('#Password', 'anttim')
      casper.click '#loginButton'
      casper.waitForSelector '#logoutButton', (->
          phantomcss.screenshot '#navigationMenu', 'navigation menu'
      ), ->
           casper.test.fail 'Should see navigation menu'

    casper.then -> 
       #compare screenshots
       phantomcss.compareAll()

    ###
    Casper runs tests###
    casper.run ->
      console.log '\nTHE END.'#
      # phantomcss.getExitStatus()
      casper.test.done()

