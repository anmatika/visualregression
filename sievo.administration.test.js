// Generated by CoffeeScript 1.10.0
(function() {
  var loginmodule, paths, phantomcss, settings, sievo, x;

  paths = require('./common/sievo.module-paths');

  phantomcss = require('phantomcss');

  settings = require(paths.sievoSettings);

  loginmodule = require(paths.sievoLogin);

  sievo = require(paths.sievoCommon);

  x = require('casper').selectXPath;

  casper.captureAdminMain = function() {
    return this.waitForSelector(x('//*[@id="content"]'), function() {
      return sievo.screenshot('#content', 'admin #content');
    });
  };

  casper.captureAddUser = function() {
    return this.waitForSelector('#addUserForm', function() {
      return sievo.screenshot('#addUserForm', 'admin #addUserForm');
    });
  };

  casper.test.begin('admin visual tests', function(test) {
    settings.init();
    loginmodule.login();
    casper.then(function() {
      return this.click('a[href$=Administration]');
    });
    casper.then(function() {
      return this.captureAdminMain();
    });
    casper.then(function() {
      return this.click('a[href$=AddUser]');
    });
    casper.then(function() {
      return this.captureAddUser();
    });
    casper.then(function() {
      return phantomcss.compareSession();
    });
    return casper.run(function() {
      console.log('\nTHE END.');
      casper.test.done();
      return casper.test.renderResults(true, 0, 'test-results.administration.xml');
    });
  });

}).call(this);
