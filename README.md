# 1 WHAT IS THIS

Visual regression testing with PhantomCSS.

# 2 HOW TO RUN

Navigate with Powershell to
C:\Development\Current\SievoWeb\Sievo.Ppm\ScriptTests\VisualRegression
and refer to 2.1 and 2.2.

## 2.1 TO RUN 1 TEST

    Run ./casperjs.ps1 <testname>
    i.e  ./casperjs.ps1 ./sievo.contracts.test.js

## 2.2 TO RUN ALL TESTS

    Run ./casperjs.ps1 -RunAll

# 3 HOW IT WORKS

PhantomCSS runs top of CasperJS which is PhantomJS utility. 

PhantomCSS takes screenshots from given selectors.
If the particular screenshot is the first of given selector it is called baseline. When the second round of screenshots are taken, baselines are compared to them.
If any differences are found PhantomCSS reports differences, writes failure in test-results.<testname>.xml and creates screenshotname.fail.png.

# 4 TEST RESULTS

* Screenshots are found ./screenshot 
* and failures in /.failures.
* Test results are written in test-results.<testname>.xml
