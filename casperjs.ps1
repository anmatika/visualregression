# i.e run: ./casperjs.ps1 ./sievo.budgeting.test.js
$env:Path += ";../../sievo.ppm/node_modules/phantomjs-prebuilt/lib/phantom/bin/"
$exe = "../../sievo.ppm/node_modules/casperjs/bin/casperjs"

#&$exe test $args[0] --log-level=debug
&$exe test $args[0]

