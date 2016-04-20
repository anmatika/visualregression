$exe = "../../sievo.ppm/node_modules/casperjs/bin/casperjs"
$scriptPath = $MyInvocation.MyCommand.Path 
$arguments = "test sievo.budgeting.test.js"
&$exe $arguments

