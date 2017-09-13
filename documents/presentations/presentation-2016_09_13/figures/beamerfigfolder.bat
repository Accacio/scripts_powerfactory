@echo off
set /p id= "Qual o nome da pasta onde estão as figuras?"
if exist %id%.txt (
    del %id%.txt
)
FOR %%f in (.\%id%\*.pdf .\%id%\*.png .\%id%\*.jpg) DO (
echo \includegraphics[width=8cm]{%id%/%%~nxf}
echo.)>>%id%.txt
clip<%id%.txt