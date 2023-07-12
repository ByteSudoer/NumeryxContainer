# Numeryx Container

## Installation

Executez cette pour le deploiement ou à chaque modification du fichier **Dockerfile**:
```bash 
docker compose build
```
Pour lancer le container:
```bash
docker compose up
```
Pour relancer le container:
```bash
docker compose restart
```
Pour supprimer le container:
```bash
docker compose rm
```

Changez cette ligne dans le fichier `.env` pour connecter MySQL avec php/Symfony
```.env
# Exmpl DATABASE_URL="mysql://{user}:{password}@127.0.0.1:3306/{db_name}"
DATABASE_URL="mysql://root:root@127.0.0.1:3306/sys"
```

## Les ports utilisés
Pour lancez PHPMyadmin port 80.
- Lien [phpmyadmin](http://127.0.0.1/)

Pour lancez Symfony port 8000 
- Lien [Welcome](http://127.0.0.1:8000/)

Pour le serveur SQL : 3036
### Connexions par défaut:
#### PHPMyadmin

- Server: mysql
- Username: root
- Password: root

### Les Versions
- PHP/Symfony: `6.2`.
- MySQL: dernière version LTS.
- PHPMyAdmin: dernière version LTS.