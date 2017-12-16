@echo off
echo SIMPLE BLENDER TIMED RENDERER - www.engineerthoughts.com 
timeout /t 3
setlocal enabledelayedexpansion
echo Is the location of your blender software is in "C:\Program Files\Blender Foundation\Blender" 
echo.
set /p condition=press y (case sensitive) and enter. IF no press any other key
if "%condition%"== "y" (
set blenderlocation="C:\Program Files\Blender Foundation\Blender"
) else (
set /p blenderlocation=paste location of the blender software here without quotes)
cd %blenderlocation%
set /p Constant= Enter how many frames per batch ?
set /A framerate =%Constant% 
set /p startframe= enter the starting frame ?
set /p endframe= Enter the end frame ?
set /p time= Enter time between each batch in seconds ?
set /p blenderrender= Enter the location of the .blend file which is to be rendered within quotes ""?
echo your rendered will be stored as per your settings saved in blender 
timeout /t 3
set  Start=%%i
for /l %%i in (%startframe%,%framerate%,%endframe%) do (
set /A End=!framerate! + %%i -1


echo i %%i ,start %Start%,end!End! ,Start frame %startframe%,frame rate %framerate%,end frame %endframe% %blenderrender%
   blender -b %blenderrender%  -E CYCLES -s %Start% -e !End! -a
	timeout /t %time%  
  ) 
    echo "Your System will shutdown in 5 minutes."
   echo	To abort press CONTROL + C to stop it and give y to stop. Thank you for using !!
timeout /t 240
shutdown.exe /s /t 120
echo shutdown in 2 minute. 
echo still if you need to cancel the shutdown please open command prompt and enter shutdown /a 
echo thanks for using 
pause