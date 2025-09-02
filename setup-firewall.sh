#!/bin/bash

echo "🔥 Configurando Firewall da VM para acesso externo..."
echo "🌐 IP da VM: 191.96.251.155"

# Verificar se o UFW está instalado
if ! command -v ufw &> /dev/null; then
    echo "📦 Instalando UFW..."
    sudo apt update
    sudo apt install -y ufw
fi

# Verificar status atual do UFW
echo "📊 Status atual do firewall:"
sudo ufw status

# Configurar regras para permitir acesso externo
echo "🔓 Configurando regras de firewall..."

# Permitir SSH (porta 22)
sudo ufw allow 22/tcp

# Permitir acesso ao backend (porta 3000)
sudo ufw allow 3000/tcp

# Permitir acesso ao frontend (porta 4200)
sudo ufw allow 4200/tcp

# Permitir acesso HTTP (porta 80) se usar nginx
sudo ufw allow 80/tcp

# Permitir acesso ao PostgreSQL se necessário (porta 5432)
# sudo ufw allow 5432/tcp

# Habilitar o firewall
echo "✅ Habilitando firewall..."
sudo ufw --force enable

# Mostrar status final
echo ""
echo "🎉 Firewall configurado com sucesso!"
echo ""
echo "📊 Regras ativas:"
sudo ufw status numbered

echo ""
echo "🌐 URLs de acesso externo:"
echo "   Frontend: http://191.96.251.155:4200"
echo "   Backend API: http://191.96.251.155:3000/api"
echo ""
echo "⚠️  IMPORTANTE:"
echo "   - As portas 3000 e 4200 estão abertas para acesso externo"
echo "   - O firewall está ativo e protegendo a VM"
echo "   - Apenas as portas necessárias estão abertas"
echo ""
echo "🔧 Para verificar se as portas estão acessíveis:"
echo "   telnet 191.96.251.155 3000"
echo "   telnet 191.96.251.155 4200"
