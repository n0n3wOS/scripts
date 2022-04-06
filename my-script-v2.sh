#! /bin/bash
#################################################
#                                               #
# Título: ScriptAdmin Simples                   #
# Autor: LG                                     #
# e-mail: luisgarcia@luisgarcia.com.pt          #
# Data: 06/04/22                                #
# Versão: 2.0                                   #
# Objetivo: Simplificar Administração de Redes  #
#                                               #
#################################################
function pausa(){
        read -p "Pressione uma tecla para continuar..." 
        menu
}
function sair(){
        echo "Deseja sair? s/n"
        read varop
        if [ $varop == "s" ] || [ $varop == "S"  ]
        then
                exit 0
        else
                pausa
        fi
}
function incorreta(){
        echo "Opção incorreta"
        pausa
}
function atualizar(){
        sudo apt-get update
        pausa
}
function instalar(){
        echo "Qual o serviço que pretende instalar?"
        read varservico
        sudo apt-get install $varservico -y
        pausa
}
function reiniciar(){
        echo "Digite o serviço que pretende reiniciar e pressione Q após visualizar output"
        read varservico
        sudo systemctl restart $varservico
        sudo systemctl status $varservico
        pausa
}
function encerrar(){
        read -p "Pressione uma tecla para encerrar"
        shutdown 0
        pausa
}
function ver_ip(){
        ip -4 -br a show eth0
        pausa
}
function pingar(){
        echo "Digite o endereço ip pretendido..."
        read varip
        ping $varip -c 4
        pausa
}
function menu(){
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
        echo "# 0. Sair do Script                         #"
        echo "#                                           #"
        echo "# Digite o nº da opção pretendida           #"
        echo "#                                           #"
        echo "#############################################"
        # Ler a opção selecionada
        read varop
        # Tratar a opção selecionada
        case $varop in
                1)
                ver_ip
                ;;
                2)
                pingar
                ;;
                3)
                atualizar
                ;;
                4)
                instalar
                ;;
                5)
                reiniciar
                ;;
                6)
                encerrar
                ;;
                0)
                sair
                ;;
                *)
                incorreta
                ;;
        esac
}
menu
