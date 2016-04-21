// Generated by CoffeeScript 1.10.0
(function() {
  var fillCredentialsAndLogin, paths, phantomcss;

  paths = require('./sievo.module-paths');

  phantomcss = require(paths.phantomCss);

  exports.loginAndCapture = function() {
    casper.start('http://sievo082.sievofi.local:55555/AnttiM');
    casper.viewport(1024, 768);
    casper.then(function() {
      return phantomcss.screenshot('#login-logo', 'login logo');
    });
    return casper.then(function() {
      casper.click('#loginButton');
      casper.waitForSelector('.message', function() {
        return phantomcss.screenshot('.message', 'error message span');
      }, function() {
        return casper.test.fail('Should see error message');
      });
      fillCredentialsAndLogin();
      return casper.waitForSelector('#navigationMenu', function() {
        return phantomcss.screenshot('#navigationMenu', 'navigation menu');
      }, function() {
        return casper.test.fail('Should see navigation menu');
      });
    });
  };

  exports.login = function() {
    casper.start('http://sievo082.sievofi.local:55555/AnttiM');
    casper.viewport(1024, 768);
    fillCredentialsAndLogin();
    return casper.waitForSelector('#navigationMenu', function() {
      return this.echo('logged in');
    }, function() {
      return casper.test.fail('login was not succesful');
    });
  };

  fillCredentialsAndLogin = function() {
    return casper.then(function() {
      return casper.fill('form', {
        'UserName': 'anttim',
        'Password': 'anttim'
      }, true);
    });
  };

}).call(this);
