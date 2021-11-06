@ECHO   OFF
SET /P sourceDir="Introduzca el directorio a evaluar: "
SET /P sourceExt="Introduzca la extension de entrada: "
SET /P outExt="Introduzca la extension de salida: "
SET /P shouldDelete="Eliminar archivos originales? (S/N): "

CD "%sourceDir%"
for /r %%i in (*.%sourceExt%) do (
    if %shouldDelete%==S (
        ffmpeg -i "%%i" "%%i.%outExt%" && del "%%i"
    ) else (
        ffmpeg -i "%%i" "%%i.%outExt%"
    )
)