#!/bin/bash

# vérification si arguments présent, si pas argument, le script s'arrête
if [ $# -eq 0 ]
then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

#si arguments présent alors on vérifie que chaque utilisateur existe
cd /

for user in $@
do
        if cat "/etc/passwd" | grep $user > /dev/null

#si utilisateur existe : on affiche un message : utilisateur $user existe déjà
#et le script continue

        then
                echo "utilisateur $user existe déjà"
        else
        sudo useradd $user
                echo "le compte $user a été créé"

#pour chaque création, on vérifie  si ca c'est bien passé

                if [ $?="0" ]

#si la création a bien été faite, on affiche le message : utilisateur $user a été crée
#le script continu

                then
                        echo  "L'utilisateur $user a été crée"

#sinon afficher un message erreur : erreur a la création de l'utilisateur $user
#le script continu

                else
                        echo "Erreur à la création de l'utilisateur $user"      
                fi
        fi
done
