// Generated by CoffeeScript 1.10.0
(function() {
  var paths, phantomcss;

  paths = require('./sievo.module-paths');

  phantomcss = require(paths.phantomCss);

  exports.init = function() {
    phantomcss.init({
      libraryRoot: paths.phantomCss,
      screenshotRoot: fs.absolute(fs.workingDirectory + '/screenshots'),
      failedComparisonsRoot: fs.absolute(fs.workingDirectory + '/failures')
    });
    casper.on('remote.message', function(msg) {
      return this.echo('remote.message: ' + msg);
    });
    casper.on('step.complete', function(stepResult) {
      if (stepResult) {
        return this.echo(stepResult);
      }
    });
    casper.on('error', function(err) {
      return this.die('PhantomJS has errored: ' + err);
    });
    return casper.on('resource.error', function(err) {
      return casper.log('Resource load error: ' + err, 'warning');
    });
  };

}).call(this);
