paths = require('./sievo.module-paths')
settings = require(paths.sievoSettings)
phantomcss = require(paths.phantomCss)

exports.login = ->
      casper.start settings.baseUrl
      casper.viewport 1024, 768

      fillCredentialsAndLogin()

      casper.waitForSelector '#navigationMenu', ->
        @echo 'Logged in.'
      , ->
        casper.test.fail 'login was not succesful'

fillCredentialsAndLogin = ->
      casper.then ->
        casper.fill('form', {
            'UserName': 'anttim'
            'Password': 'anttim'
        }, true)
