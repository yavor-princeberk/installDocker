#!/bin/bash 
while true; do
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt-get install -y software-properties-common python-software-properties https-transport
        sudo apt-get update
        sudo apt-get install apt-transport-https
        apt-cache policy docker-ce
        echo "Press Q to exit, enter to continue \n"
        read input
        if [[ $input = "q" ]] || [[ $input = "Q" ]]
                then break
        fi
        sudo apt-get install -y docker-ce
        sudo systemctl status docker
        read input
        echo -en "Adding user deploy - Press Q to exit, enter to continue \n"
        if [[ $input = "q" ]] || [[ $input = "Q" ]]
                then break
        fi
        sudo adduser deploy
        sudo usermod -a -G docker deploy
        echo -en "I will reboot - Press Q to exit, enter to continue \n"
        read input
        if [[ $input = "q" ]] || [[ $input = "Q" ]]
                then break
        fi
        sudo reboot

done
