#------------------------- tradutor.sh ---------------------------------------
#Reeditado 
#!/bin/bash
#Original de:
#Kris Occhipinti
#http://FilmsByKris.com
#Released under the GPLv3
#Adaptado por:
#Luiz Gustavo de Freitas
#20/02/2019

#instala rec
#sudo apt-get -y install sox

#Limpa a tela
clear

#Configuração:
#Determina a língua para tradução final
#no caso, alemão
lng="de"

#Grava temporariamente em um arquivo,
#Especifica um tempo de silencio para iniciar,
#E um tempo de silencio para parar.
rec -r 16000 -t alsa default /tmp/recording.flac silence 1 0.1 5% 5 1.0 5%

#Envia o que foi capturado para o sintetizador,
#e devolve o texto reconhecido.
x=$(wget -q -U "Mozilla/5.0" --post-file /tmp/recording.flac --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=pt-BR&client=chromium"|cut -d\" -f12)

#Exibe o que foi capturado
echo "Esta é a mensagem que foi compreendida com sua fala:"
echo "$x"

#Envia o texto para efetuar a tradução para
#a língua escolhida.
y=$(wget -q -U "Mozilla/5.0" -O - "http://translate.google.com/translate_a/t?client=t&text=$x&sl=auto&tl=$lng"| sed 's/\[\[\[\"//' | cut -d \" -f 1)


#Exibe o texto na língua escolhida
echo "Esta é a mensagem que foi traduzida pelo serviço do Google:"
echo "$y"

#Toca a frase na língua que traduziu
mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=$lng&q=$(echo "$y" | sed 's#\ #\+#g')" > /dev/null 2>&1 ;

#Deixa quem testou feliz e termina.

#------------------------- tradutor.sh ---------------------------------------
