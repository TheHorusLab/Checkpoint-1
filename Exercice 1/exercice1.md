**Etape 1 : noms des disques**  
![image](https://github.com/user-attachments/assets/92b15274-ebf0-41b6-b2ea-97b0b865d44f)  

commande : fdisk -l  


**Etape 2 : création des partitions**  
![image](https://github.com/user-attachments/assets/761dfcf4-f88f-4880-9d4f-12464b33219b)  

commandes : fdisk /dev/sdb    
options:    
n : nouvelle partition  
p : primaire  
1 : première partition  
+6G : taille de la partition  

n : nouvelle partition  
p : primaire  
2 : deuxième partition  
+4G : taille de la partition  

t : Changement du type de partition  
2 : deuxième partition  
82 : code de partition swap  

**Etape 3 et 4 : formatage et nommage des partitions**  
![image](https://github.com/user-attachments/assets/d626666c-0232-4a94-9ad6-889bcb81b49e)  
![image](https://github.com/user-attachments/assets/a7d550fa-06b0-4e0f-926c-527beb830ff4)  


commandes :  
lsblk -f : affichage des périphériques de stockage avec type de partition  
mkfs.ext4 -L DATA /dev/sdb1 : formatage partition 1 + nommage  
mkswap /dev/sdb2 : formatage partition 2  
mkswap -L SWAP /dev/sdb2 : nommage partition 2  
lsblk -f : vérification  

**Etape 5 : activation swap partition 2**  
![image](https://github.com/user-attachments/assets/fdf39347-1562-432a-8f1e-e29c635da4cc)  

commandes:  
swapon /dev/sdb2 : activation swap partition 2  
swapoff /dev/sda5 : désactivation swap partition 5 du disque principal sda)  
lsblk -f : vérification  

**Etape 6 : création du dossier de montage et montage dans /mnt**  
![image](https://github.com/user-attachments/assets/da6c9b98-8ade-48ce-8e4b-f1ad099f2842)  

commandes:  
mkdir mnt/data  
mount /dev/sdb1 /mnt/data  

**Etape 7 : Affichage des UUID**  
![image](https://github.com/user-attachments/assets/5a14abc2-b0e0-4fba-8d76-f4fa3e2e7213)  

commande:  
blkid  

**Etape 8 : Montage automatique au démarrage avec UID des disques**  
![image](https://github.com/user-attachments/assets/e4a1294b-f4ae-45a1-9ac0-f672b3501b7a)  

commande :  
nano /etc/fstab  
\- édition du fichier fstab et ajout des lignes concernant sdb1 et sdb2  
mount -a /etc/fstab  
\- vérification si erreur dans le fichier fstab  

**Etape 9 : Vérification des disques**  
![image](https://github.com/user-attachments/assets/a9d2beb4-0712-49db-b1cb-fb3861b60429)  

commande :  
fdisk -l  
