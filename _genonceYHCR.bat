@ECHO OFF
REM ****************************************************************************************
REM **
REM ** The purpose of this script is to get fsh working with FHIR STU3 (normally it only supports R4)
REM ** The running of fsh (sushi) has been decoupled from the running of the IG publisher tool
REM ** (This has been done by putting fsh in a separate "fsh-tank", not the standard folders that sushi creates)
REM **
REM ** This script puts it all back together again:
REM **  - Runs sushi
REM **  - ===> Runs a custom script that adjusts the R4 fsh outputs to be STU3 compatible
REM **  - Copies the resulting structure definitions etc into the input folder to drive the IG publisher
REM **  - Runs the IG Publisher tool (this supports any FHIR version, given the correct inputs)
REM **
REM ****************************************************************************************

SET input_resources_path=%CD%\input\resources
SET input_includes_path=%CD%\input\includes
SET input_pagecontent_path=%CD%\input\pagecontent
SET input_intro-notes_path=%CD%\input\intro-notes
SET input_images_path=%CD%\input\images
SET original_cd=%CD%

REM Run the sushi tool to process the fsh files and generate FHIR definition artefacts (initally R4)
call sushi "%CD%\fsh-tank"
ECHO .
ECHO .


REM Install any node dependency packages
ECHO Installing node dependencies
cd fsh-tank\scripts\convert-stu3
echo %CD%
call npm install
cd %original_cd%

cd fsh-tank\scripts\tweak-website
echo %CD%
call npm install
cd %original_cd%
ECHO .
ECHO .


REM Here we call a script that does conversion
call node "%CD%\fsh-tank\scripts\convert-stu3"
ECHO .
ECHO .


ECHO Copying latest STU3 fsh outputs into IG input folder

REM Delete the old files (do it twice as just sometimes there is a lock the first time)
if exist "%input_resources_path%" rd /s /q "%input_resources_path%"
if exist "%input_resources_path%" rd /s /q "%input_resources_path%"

if exist "%input_includes_path%" rd /s /q "%input_includes_path%"
if exist "%input_includes_path%" rd /s /q "%input_includes_path%"

if exist "%input_pagecontent_path%" rd /s /q "%input_pagecontent_path%"
if exist "%input_pagecontent_path%" rd /s /q "%input_pagecontent_path%"

if exist "%input_intro-notes_path%" rd /s /q "%input_intro-notes_path%"
if exist "%input_intro-notes_path%" rd /s /q "%input_intro-notes_path%"

if exist "%input_images_path%" rd /s /q "%input_images_path%"
if exist "%input_images_path%" rd /s /q "%input_images_path%"


REM Copy the new files that fish has just generated
xcopy "%CD%\fsh-tank\fsh-generated-STU3\resources" "%input_resources_path%" /E /y /I /q
xcopy "%CD%\fsh-tank\fsh-generated-STU3\includes" "%input_includes_path%" /E /y /I /q
xcopy "%CD%\fsh-tank\input\pagecontent" "%input_pagecontent_path%" /E /y /I /q
xcopy "%CD%\fsh-tank\input\intro-notes" "%input_intro-notes_path%" /E /y /I /q
xcopy "%CD%\fsh-tank\input\images" "%input_images_path%" /E /y /I /q

REM Overcopy the proper original Care Connect resources to replace our round-tripped fsh generated approximations
xcopy "%CD%\fsh-tank\careconnect-STU3" "%input_resources_path%" /E /y /I /q


ECHO Running the publisher tool
ECHO .
ECHO .

call "%CD%\_genonce"


REM Here we call a script that tweaks the website to hide CareConnect content
ECHO .
ECHO .
call node "%CD%\fsh-tank\scripts\tweak-website"


