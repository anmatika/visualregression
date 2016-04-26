# we are dependent on phantomjs so append it into path (this might be evil... TODO: consider alternatives)
$env:Path += ";../../node_modules/phantomjs-prebuilt/lib/phantom/bin/"

# load 'visualregression' environment
cmd.exe /c '\development\tarmo\scripts\load-environment.cmd visualregression DoNotFlush'

# run casperjs test <testname>
&'../../node_modules/casperjs/bin/casperjs' test $args --includes=../../Scripts/lodash.compat.min.js --baseUrl=$env:SIEVO_BASE_URL

