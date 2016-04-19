(function() {
  var fs, phantomcss;

  fs = require('fs');

  phantomcss = require('../node_modules/phantomcss');

  casper.test.begin('Budgeting visual tests', function(test) {
    phantomcss.init({
      libraryRoot: '../node_modules/phantomcss',
      screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots'),
      failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')
    });
    casper.on('remote.message', function(msg) {
      return this.echo(msg);
    });
    casper.on('error', function(err) {
      return this.die('PhantomJS has errored: ' + err);
    });
    casper.on('resource.error', function(err) {
      return casper.log('Resource load error: ' + err, 'warning');
    });
    casper.start('http://sievo082.sievofi.local:55555/AnttiM');
    casper.viewport(1024, 768);
    casper.then(function() {
      return phantomcss.screenshot('#login-logo', 'login logo');
    });
    casper.then(function() {
      casper.click('#loginButton');
      return casper.waitForSelector('.message', (function() {
        return phantomcss.screenshot('.message', 'error message span');
      }), function() {
        return casper.test.fail('Should see error message');
      });
    });
    casper.then(function() {
      casper.sendKeys('#UserName', 'anttim');
      casper.sendKeys('#Password', 'anttim');
      casper.click('#loginButton');
      return casper.waitForSelector('#logoutButton', (function() {
        return phantomcss.screenshot('#navigationMenu', 'navigation menu');
      }), function() {
        return casper.test.fail('Should see navigation menu');
      });
    });
    casper.then(function() {
      return phantomcss.compareAll();
    });

    /*
    Casper runs tests
     */
    return casper.run(function() {
      console.log('\nTHE END.');
      return casper.test.done();
    });
  });

}).call(this);

//# sourceMappingURL=phantomcss-testsuite.js.map
