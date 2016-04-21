# i.e run: ./casperjs.ps1 ./sievo.budgeting.test.js

$exe = "../../sievo.ppm/node_modules/casperjs/bin/casperjs"
#&$exe test $args[0] --verbose --log-level=debug
&$exe test $args[0] --log-level=debug

