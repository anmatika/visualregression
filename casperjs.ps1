param (
  [switch] $RunAll
)

$tests = @(
   "sievo.contracts.test.js",
   "sievo.budgeting.test.js",
   "sievo.administration.test.js"
 )

# we are dependent on phantomjs so append it into path (this might be evil... TODO: consider alternatives)
$env:Path += ";../../node_modules/phantomjs-prebuilt/lib/phantom/bin/"

# load 'visualregression' environment
cmd.exe /c '\development\tarmo\scripts\load-environment.cmd visualregression DoNotFlush'

If ($RunAll) {
  Write-Host Running All Tests -foregroundcolor "magenta"
  foreach ($test in $tests)
  {
	Write-Host Running $test -foregroundcolor "green"
	&'../../node_modules/casperjs/bin/casperjs' test $test --includes=../../Scripts/lodash.compat.min.js --baseUrl=$env:SIEVO_BASE_URL
  }
}
Else {
# run casperjs test <testname>
  Write-Host Running $args -foregroundcolor "green"
  &'../../node_modules/casperjs/bin/casperjs' test $args --includes=../../Scripts/lodash.compat.min.js --baseUrl=$env:SIEVO_BASE_URL
 }

