@echo off
setlocal

rem Define o caminho da pasta compartilhada
set "caminho_compartilhado=\\lucida\papel$"

rem Define o caminho da pasta local
set "caminho_local=C:\bginfo"

rem Define os nomes dos arquivos a serem copiados
set "arquivo1=Bginfo64.exe"
set "arquivo2=bgljd.bgi"
set "arquivo3=papel.jpg"

rem Verifica se a pasta local existe, e se não, cria-a
if not exist "%caminho_local%" (
    mkdir "%caminho_local%"
)

rem Copia os arquivos da pasta compartilhada para a pasta local
copy "%caminho_compartilhado%\%arquivo1%" "%caminho_local%\%arquivo1%" /Y > NUL
copy "%caminho_compartilhado%\%arquivo2%" "%caminho_local%\%arquivo2%" /Y > NUL
copy "%caminho_compartilhado%\%arquivo3%" "%caminho_local%\%arquivo3%" /Y > NUL

rem Pega a data e hora atual
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (
    set "data=%%a/%%b/%%c"
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hora=%%a:%%b"
)

rem Escreve uma mensagem de conclusão no arquivo de log com data e hora
echo Log (%data% - %hora%): Arquivos copiados com sucesso! >> C:\bginfo\log.txt

start "" "%caminho_local%\%arquivo1%" /timer:0 /silent /nolicprompt "%caminho_local%\%arquivo2%"

endlocal