paths = require('./sievo.module-paths')
phantomcss = require(paths.phantomCss)

class LoginModule
    login: ()->
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
        casper.waitForSelector '#navigationMenu', (->
          phantomcss.screenshot '#navigationMenu', 'navigation menu'
        ), ->
          casper.test.fail 'Should see navigation menu'

module.exports = LoginModule 
