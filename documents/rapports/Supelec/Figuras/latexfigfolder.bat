setlocal ENABLEDELAYEDEXPANSION
@echo off
cls
set /p id= "Folder Name:"
set "id=!id:%cd%=.!"
echo %id%
if exist %id%.txt (
    del %id%.txt
)
set /p opc= "Float type is t, p, b, !, h or H?"
FOR %%f in (%id%\*.pdf %id%\*.png %id%\*.jpg %id%\*.eps) DO (echo \begin{figure}[%opc%]
echo 	\begin{center}	
echo 		\includegraphics[width=8cm]{"%id:\=/%/%%~nf"}
echo 		\caption{\todo{escrevaaquiseucaption}}
echo 		\label{fig:%%~nf}
echo 	\end{center}
echo \end{figure}
echo.)>>%id%.txt
clip<%id%.txt