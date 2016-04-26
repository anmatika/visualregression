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
      return sievo.screenshot('#contracts-main-wrapper', 'contracts-main-wrapper', '.slick-headerrow');
    });
  };

  casper.captureContractDetail = function() {
    return this.waitForResource(/Contracts\/Notification/, function() {
      return sievo.screenshot('#content', 'contracts #content', '.attribute-value');
    });
  };

  casper.captureEditContract = function() {
    return this.waitForResource(/dimension\/getEntitiesOnLevel/, function() {
      return sievo.screenshot('section[ng-controller="EditContractController as main"]', 'contracts editContractController');
    });
  };

  casper.captureTransferOwnership = function() {
    this.wait(500);
    return this.waitForResource(/Contracts\/ContractDetail/, function() {
      return sievo.screenshot('section[ng-controller="TransferOwnershipController as main"]', 'contracts transferOwnership');
    });
  };

  casper.test.begin('contracs visual tests', function(test) {
    settings.init({
      screenshotDelay: 250
    });
    loginmodule.login();
    debug.enableHttpListeners();
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

//# sourceMappingURL=sievo.contracts.test.js.map
