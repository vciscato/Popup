Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# URL da imagem na internet
$imageUrl = "https://wallpaper-nmd.s3.amazonaws.com/Wallpaper_1920x1080.png"

# Caminho temporário para salvar a imagem
$tempImagePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "imagem_temp.jpg")

# Baixar a imagem
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($imageUrl, $tempImagePath)

# Criar o formulário
$form = New-Object System.Windows.Forms.Form
$form.Text = "Mensagem da CIPA - ATENÇÃO!"
$form.Size = New-Object System.Drawing.Size(500, 400)
$form.StartPosition = "CenterScreen"

# Configurar o PictureBox
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.ImageLocation = $tempImagePath
$pictureBox.SizeMode = "StretchImage"
$pictureBox.Dock = "Fill"

$form.Controls.Add($pictureBox)

# Mostrar o formulário
$null = $form.ShowDialog()

# Remover a imagem temporária após fechar o formulário
Remove-Item $tempImagePath
