# 1 WHAT IS THIS

It's visual regression testing with PhantomCSS.

# 2 HOW TO RUN 

Navigate with Powershell to 
C:\Development\Current\SievoWeb\Sievo.Ppm\ScriptTests\VisualRegression

And run ./casperjs.ps1 <testname>
i.e  ./casperjs.ps1 ./sievo.contracts.test.js

# 3 HOW IT WORKS

PhantomCSS runs top of CasperJS which is PhantomJS utility. PhantomCSS takes screenshots from given selectors.
If the particular screenshot is the first of given selector it is called baseline. When the second round of screenshots are taken, baselines are compared to them.
If any differences are found PhantomCSS reports differences, and creates screenshotname.fail.png.

Screenshots are found ./screenshot and failures in /.failures.

