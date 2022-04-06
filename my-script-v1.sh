#! /bin/bash
#################################################
#                                               #
# Título: ScriptAdmin Simples                   #
# Autor: LG                                     #
# e-mail: luisgarcia@luisgarcia.com.pt          #
# Data: 06/04/22                                #
# Versão: 1.0                                   #
# Objetivo: Simplificar Administração de Redes  #
#                                               #
#################################################
clear
# Menu para o script
echo "#############################################"
echo "#                                           #"
echo "#                 M E N U                   #"
echo "#                                           #"
echo "# 1. Informação acerca do Endereço IP       #"
echo "# 2. Testar comunicação com um Endereço IP  #"
echo "# 3. Atualizar o Sistema                    #"
echo "# 4. Instalar Serviço                       #"
echo "# 5. Reiniciar Serviço                      #"
echo "# 6. Encerrar Sistema                       #"
echo "#                                           #"
echo "# Digite o nº da opção pretendida           #"
echo "#                                           #"
echo "#############################################"
# Ler a opção selecionada
read varop
# Tratar a opção selecionada
case $varop in
        1)
        ip -4 -br a show eth0
        ;;
        2)
        echo "Qual o IP que pretende testar?"
        read varip
        ping $varip -c 4
        ;;
        3)
        sudo apt-get update
        ;;
        4)
        echo "Qual o serviço que pretende instalar?"
        read varservico
        sudo apt-get install $varservico -y
        ;;
        5)
        echo "Digite o serviço que pretende reiniciar e pressione Q após visualizar output"
        read varservico
        sudo systemctl restart $varservico
        sudo systemctl status $varservico
        ;;
        6)
        read -p "Pressione uma tecla para encerrar"
        shutdown 0
        ;;
        *)
        echo "Opção incorreta!"
        ;;
esac
