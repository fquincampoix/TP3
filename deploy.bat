

@echo on

SET userprofil=%systemdrive%%homepath%
SET tomcatpath=%userprofil%\apache-tomcat-8.5.58\bin

call mvn scm:checkout  -DconnectionUrl=scm:git:https://github.com/fquincampoix/TP3 -DcheckoutDirectory=monappli
echo *********************************************
echo Apres scm:checkout
echo *********************************************

cd %userprofil%\Formation\TP3\monappli

call mvn clean package
echo *********************************************
echo Apres clean package
echo *********************************************

SET src=%userprofil%\Formation\TP3\monappli\monappli-web\target\monappli-web.war
SET dest=%userprofil%\apache-tomcat-8.5.58\webapps\

copy %src% %dest%

call %tomcatpath%\startup.bat

start chrome http://localhost:8080/monappli-web/
