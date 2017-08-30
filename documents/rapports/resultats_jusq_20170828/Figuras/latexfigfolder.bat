@echo off
set /p id= "Qual o nome da pasta onde estao as figuras?"
if exist %id%.txt (
    del %id%.txt
)
set /p opc= "H ou h?"
FOR %%f in (.\%id%\*.pdf .\%id%\*.png .\%id%\*.jpg) DO (echo \begin{figure}[%opc%]
echo 	\begin{center}	
echo		\captionsetup{justification=centering,margin=.5cm}
echo 		\includegraphics[width=8cm]{%id%/%%~nxf}
echo 		\caption{\todo{escrevaaquiseucaption}}
echo 		\label{fig:%%~nf}
echo 	\end{center}
echo \end{figure}
echo.)>>%id%.txt
clip<%id%.txt