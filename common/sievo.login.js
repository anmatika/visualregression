// Generated by CoffeeScript 1.10.0
(function() {
  var fillCredentialsAndLogin, paths, phantomcss, settings;

  paths = require('./sievo.module-paths');

  settings = require(paths.sievoSettings);

  phantomcss = require(paths.phantomCss);

  exports.login = function() {
    casper.start(settings.baseUrl);
    casper.viewport(1024, 768);
    fillCredentialsAndLogin();
    return casper.waitForSelector('#navigationMenu', function() {
      return this.echo('Logged in.');
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
