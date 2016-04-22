// Generated by CoffeeScript 1.10.0
(function() {
  var debug, loginmodule, paths, phantomcss, settings, sievo;

  paths = require('./common/sievo.module-paths');

  phantomcss = require('phantomcss');

  settings = require(paths.sievoSettings);

  loginmodule = require(paths.sievoLogin);

  debug = require(paths.sievoDebug);

  sievo = require(paths.sievoCommon);

  casper.captureContractsMain = function() {
    return this.waitForResource(/data:image\/png;base64/, function() {
      return sievo.screenshot('#contracts-main-wrapper', 'contracts-main-wrapper');
    }, function() {
      return this.test.fail('should see contract management');
    });
  };

  casper.captureContractDetail = function() {
    return this.waitForResource(/Contracts\/Notification/, function() {
      return sievo.screenshot('#content', 'contracts #content');
    }, function() {
      return this.test.fail('should see contract management');
    });
  };

  casper.captureEditContract = function() {
    return this.waitForResource(/dimension\/getEntitiesOnLevel/, function() {
      return sievo.screenshot('section[ng-controller="EditContractController as main"]', 'contracts editContractController');
    }, function() {
      return this.test.fail('should see edit contract');
    });
  };

  casper.captureTransferOwnership = function() {
    return this.waitForResource(/Contracts\/ContractDetail/, function() {
      return sievo.screenshot('section[ng-controller="TransferOwnershipController as main"]', 'contracts transferOwnership');
    }, function() {
      return this.test.fail('should see contract transfer ownership');
    });
  };

  casper.test.begin('contracs visual tests', function(test) {
    settings.init();
    loginmodule.login();
    debug.enableClickListener();
    casper.then(function() {
      return this.click('a[href$=Contracts]');
    });
    casper.wait(500, function() {
      return casper.then(function() {
        return this.captureContractsMain();
      });
    });
    casper.then(function() {
      return this.click('#contract0');
    });
    casper.then(function() {
      return this.captureContractDetail();
    });
    casper.then(function() {
      return this.click('#action-edit-contract');
    });
    casper.then(function() {
      return this.captureEditContract();
    });
    casper.then(function() {
      return this.back();
    });
    casper.then(function() {
      return this.waitForText('Contract details', function() {
        return this.click('#action-transfer-ownership');
      });
    });
    casper.then(function() {
      return this.captureTransferOwnership();
    });
    casper.then(function() {
      return phantomcss.compareSession();
    });
    return casper.run(function() {
      console.log('\nTHE END.');
      casper.test.done();
      return casper.test.renderResults(true, 0, 'test-results.xml');
    });
  });

}).call(this);
