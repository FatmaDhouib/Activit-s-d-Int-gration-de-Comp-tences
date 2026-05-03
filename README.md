# Spring Boot 4 + Mobile App (Flutter & React Native)

Ce projet complet démontre la création d'une API REST avec Spring Boot (Java 21) et son intégration avec deux applications mobiles (Flutter et React Native). L'API et la base de données PostgreSQL sont orchestrées via Docker Compose.

## Structure du Projet

- `api-spring-boot/`: Le code source de l'API REST Spring Boot, avec son Dockerfile.
- `docker-compose.yml`: Le fichier pour orchestrer la base de données PostgreSQL et l'API Spring Boot.
- `mobile-app-flutter/`: L'application mobile développée avec Flutter.
- `mobile-app-react-native/`: L'application mobile développée avec React Native (Expo).

## 1. Démarrer le Backend (Docker)

Assurez-vous que Docker et Docker Compose sont installés sur votre machine.

1. Ouvrez un terminal à la racine du projet.
2. Exécutez la commande suivante pour construire et démarrer les conteneurs :

   ```bash
   docker compose up --build
   ```

3. L'API sera accessible à l'adresse: `http://localhost:8080/api/etudiants`
   - La base de données PostgreSQL est exposée sur le port `5432`.
   - La base de données est initialisée automatiquement avec 5 étudiants.

## 2. Lancer l'Application Mobile (Flutter)

Assurez-vous d'avoir installé le SDK Flutter.

1. Naviguez vers le dossier Flutter :
   ```bash
   cd mobile-app-flutter
   ```
2. Installez les dépendances :
   ```bash
   flutter pub get
   ```
3. Lancez l'application sur un émulateur ou un appareil physique :
   ```bash
   flutter run
   ```
   *Note: L'application utilise `http://10.0.2.2:8080/api/etudiants` par défaut, qui est l'alias de `localhost` pour l'émulateur Android. Modifiez l'URL dans `lib/main.dart` si vous testez sur un appareil iOS ou physique.*

## 3. Lancer l'Application Mobile (React Native / Expo)

Assurez-vous d'avoir installé Node.js et npm.

1. Naviguez vers le dossier React Native :
   ```bash
   cd mobile-app-react-native
   ```
2. Installez les dépendances (si ce n'est pas déjà fait) :
   ```bash
   npm install
   ```
3. Lancez le serveur Expo :
   ```bash
   npx expo start
   ```
   *Note: Scannez le QR Code avec l'application Expo Go sur votre téléphone, ou appuyez sur `a` pour l'émulateur Android ou `i` pour le simulateur iOS. L'URL cible est aussi `10.0.2.2` dans `App.js` par défaut.*
