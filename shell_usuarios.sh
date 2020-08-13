#!/bin/bash
#Autor: LuizGutsavo
#Data: 10/12/2018
#Algoritimo para tratar usuarios no linux

raiz()
{

echo "Digite um número: "
read num

#Iniciando o contador com 1 pois não existe divisão por zero
i=1


while [ $i -lt $num ]
do

#Variável calc significa cálculo e calc2, cálculo2
#A variável calc fará a divisão do número passado pelo
#usuário e o contador. Em seguida este valor será multiplicado
#por ele mesmo na variável calc2.


    calc=$(($num / $i))
    calc2=$(($calc * $calc ))


#Aqui é realizado o teste que caso seja verdadeiro a
#condição $calc2 for igual a $num, haverá uma interrupção
#no loop (com o comando break) e será mostrado o comando
#echo logo abaixo


        if [ $calc2 -eq $num ]
        then
            break
        fi
    i=$(($i + 1))
done

echo "A raiz quadrada de $num é: $calc"

}

raiz

Algoritmo 017: 

#!/bin/bash
#Autor: k666
#Data: 27/01/2013
#Algoritmo utilizado para criar, alterar e apagar
#contas de usuário do sistema Linux

menu()
{

echo _____________________________
echo
echo CADASTRAR USUÁRIOS NO SISTEMA
echo _____________________________
echo
echo
echo " 1 - Cadastrar "
echo " 2 - Procurar "
echo " 3 - Apagar "
echo " 0 - Sair "

echo "Escolha uma das opções acima: "
read op

case $op in
    1) cadastrar ;;
    2) procurar ;;
    3) apagar ;;
    0) exit ;;
    *) Opção inválida ;;
esac

}


cadastrar()
{

echo -n  "Nome completo: "
read nome

echo -n "Informe o nome para Login: "
read login

echo -n "Cargo: "
read cargo

#Comando para criar contas no Linux

useradd -d /home/$login -m -c "$nome - $cargo" -s /bin/bash $login

passwd $login

#Limpa a tela e volta ao menu principal

clear

menu

}

procurar()
{

echo -n "Informe o login do usuário: "
read login

cat /etc/passwd | grep -i $login

sleep 4
clear

menu

}

apagar()
{

echo -n "Informe o login do usuário: "
read login

echo -n "Apagar o diretório /home do usuário? (s ou n) "
read op

    if [ $op = "s" ]
    then
        userdel -r $login
    else
        userdel $login
    fi
sleep 3
clear

menu

}

#Chamando a função

menu
