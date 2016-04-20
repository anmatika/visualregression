fs = require('fs')
# process = require('process')
exec = require('child_process').exec;
console.log('__dirname: ', __dirname);
console.log('process.cwd(): ', process.cwd());
#spawn = require('child_process').spawn;
#ls = spawn('ls', ['-lh', '/usr']); 
exec("c:\\development\\current\\sievoweb\\sievo.ppm\\node_modules\\casperjs\\bin\\casperjs", ['test', 'budgeting\\sievo.budgeting.test.js'],
(err, stdout, stderr) ->
  if err
    console.log(err)
    return
  console.log stdout)

