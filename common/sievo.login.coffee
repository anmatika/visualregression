paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

exports.loginAndCapture = ->
      casper.start 'http://sievo082.sievofi.local:55555/AnttiM'
      casper.viewport 1024, 768
      casper.then ->
          phantomcss.screenshot '#login-logo', 'login logo'

      casper.then ->
        casper.click '#loginButton'
        casper.waitForSelector '.message', ->
          phantomcss.screenshot '.message', 'error message span'
        , ->
          casper.test.fail 'Should see error message'

        fillCredentialsAndLogin()

        casper.waitForSelector '#navigationMenu', ->
          phantomcss.screenshot '#navigationMenu', 'navigation menu'
        , ->
          casper.test.fail 'Should see navigation menu'

exports.login = ->
      casper.start 'http://sievo082.sievofi.local:55555/AnttiM'
      casper.viewport 1024, 768

      fillCredentialsAndLogin()

      casper.waitForSelector '#navigationMenu', ->
        @echo 'logged in'
      , ->
        casper.test.fail 'login was not succesful'

fillCredentialsAndLogin = ->
      casper.then ->
        casper.fill('form', {
            'UserName': 'anttim'
            'Password': 'anttim'
        }, true)
