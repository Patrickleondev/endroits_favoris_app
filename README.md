# Application Endroits Favoris

## Description

Cette application Flutter a été développée dans le cadre de la formation DCLIC niveau avancé. Elle permet de gérer et organiser vos endroits favoris en prenant des photos et en sauvegardant les informations importantes de chaque lieu.

## Fonctionnalités

### Page Principale (EndroitsInterface)
- **AppBar amber** : Interface moderne avec titre "Mes endroits favoris"
- **Liste des endroits** : Affichage des lieux avec photos circulaires et noms
- **Navigation intuitive** : Accès direct aux détails et ajout de nouveaux endroits
- **Interface vide** : Message informatif quand aucun endroit n'est enregistré

### 📸 Ajout d'Endroits (AjoutEndroit)
- **Prise de photo** : Utilisation de l'appareil photo pour capturer des images
- **Saisie du nom** : Champ de texte stylisé pour nommer l'endroit
- **Interface intuitive** : Design cohérent avec boutons d'action clairs
- **Validation** : Vérification des données avant sauvegarde

###  Détails d'Endroits (EndroitDetail)
- **Affichage plein écran** : Photos affichées en haute résolution
- **Informations complètes** : Nom et détails de l'endroit
- **Navigation fluide** : Retour facile vers la liste principale

###  Gestion des Données
- **État global** : Utilisation de Riverpod pour la gestion d'état
- **Persistance locale** : Sauvegarde des photos sur l'appareil
- **Identifiants uniques** : Génération automatique d'ID avec UUID
- **Architecture modulaire** : Code organisé et maintenable

## Architecture Technique

### Structure du Projet

```
lib/
├── main.dart                    # Point d'entrée de l'application
├── modele/
│   └── endroit.dart            # Modèle de données Endroit
├── providers/
│   └── endroits_utilisateurs.dart # Provider Riverpod pour l'état global
├── vue/
│   ├── ajout_endroit.dart      # Page d'ajout d'un nouvel endroit
│   └── endroit_detail.dart     # Page de détails d'un endroit
└── widgets/
    ├── endroits_list.dart      # Widget liste des endroits
    └── image_prise.dart        # Widget de prise de photo
```

### Technologies Utilisées

- **Flutter** : Framework de développement mobile
- **Riverpod** : Gestion d'état réactive et robuste
- **Image Picker** : Capture et sélection d'images
- **UUID** : Génération d'identifiants uniques
- **Material Design 3** : Interface utilisateur moderne

### Dépendances

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_riverpod: ^2.6.1
  uuid: ^4.5.1
  image_picker: ^1.1.2
```

## Installation et Configuration

### Prérequis
- Flutter SDK (version 3.8.1 ou supérieure)
- Dart SDK (version 3.8.1 ou supérieure)
- Android Studio ou VS Code avec extension Flutter
- Émulateur Android ou appareil physique avec caméra

### Étapes d'installation

1. **Cloner le projet** :
   ```bash
   git clone https://github.com/Patrickleondev/endroits_favoris_app.git
   cd endroits_favoris_app
   ```

2. **Installer les dépendances** :
   ```bash
   flutter pub get
   ```

3. **Vérifier la configuration** :
   ```bash
   flutter doctor
   ```

4. **Configuration Android (obligatoire)** :
   
   L'application nécessite des permissions pour accéder à la caméra. Vérifiez que le fichier `android/app/src/main/AndroidManifest.xml` contient :
   
   ```xml
   <uses-permission android:name="android.permission.CAMERA" />
   <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
   ```

5. **Lancer l'application** :
   ```bash
   flutter run
   ```

### Compilation APK

Pour générer un APK de production :

```bash
flutter build apk --release
```

L'APK sera généré dans : `build/app/outputs/flutter-apk/app-release.apk`

## Guide d'Utilisation

### Démarrage Rapide

1. **Lancement** : Ouvrez l'application pour voir la liste de vos endroits favoris
2. **Premier ajout** : Appuyez sur le bouton "+" pour ajouter votre premier endroit
3. **Prise de photo** : Utilisez le bouton "Prendre photo" pour capturer une image
4. **Nommage** : Saisissez le nom de votre endroit favori
5. **Sauvegarde** : Appuyez sur "Ajouter un nouveau endroit" pour confirmer

###  Gestion des Photos

- **Qualité optimisée** : Les photos sont automatiquement redimensionnées (largeur max: 600px)
- **Format supporté** : JPG/JPEG recommandé pour une meilleure compatibilité
- **Stockage** : Les images sont sauvegardées localement sur l'appareil
- **Affichage** : Photos affichées en cercles dans la liste, plein écran dans les détails

### 📋 Navigation

- **Liste principale** : Appuyez sur un endroit pour voir ses détails
- **Ajout** : Bouton flottant "+" en bas à droite
- **Retour** : Utilisez la flèche de retour dans chaque AppBar
- **Détails** : Appuyez sur une photo pour l'agrandir

## Fonctionnalités Détaillées

###  Modèle de Données (Endroit)

```dart
class Endroit {
  final String id;        // Identifiant unique généré automatiquement
  final String nom;       // Nom de l'endroit saisi par l'utilisateur
  final File? image;      // Photo optionnelle de l'endroit
}
```

###  Gestion d'État (Riverpod)

- **StateNotifier** : Gestion réactive de la liste des endroits
- **Provider global** : Accessible depuis toute l'application
- **Méthodes disponibles** :
  - `ajoutEndroit(String nom, {File? image})` : Ajouter un nouvel endroit
  - État automatiquement mis à jour dans toute l'interface

###  Capture d'Images

- **Source** : Appareil photo de l'appareil
- **Résolution** : Optimisée automatiquement pour l'affichage mobile
- **Gestion d'erreurs** : Annulation gracieuse si l'utilisateur ferme l'appareil photo
- **Interface** : Bouton stylisé avec feedback visuel

## Configuration Avancée

### Android NDK

Si vous rencontrez des erreurs de compilation, vérifiez la configuration NDK dans `android/app/build.gradle.kts` :

```kotlin
android {
    namespace = "com.example.endroits_favoris"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13599879" // Ajustez selon votre installation
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
}
```

### Permissions iOS

Pour iOS, ajoutez dans `ios/Runner/Info.plist` :

```xml
<key>NSCameraUsageDescription</key>
<string>Cette application a besoin d'accéder à la caméra pour prendre des photos de vos endroits favoris.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Cette application a besoin d'accéder à vos photos pour sélectionner des images.</string>
```

## Résolution de Problèmes

### Erreurs Communes

1. **Permission caméra refusée** :
   - Vérifiez les permissions dans les paramètres de l'appareil
   - Redémarrez l'application après avoir accordé les permissions

2. **Erreur de compilation NDK** :
   - Vérifiez que votre version NDK est compatible
   - Nettoyez le projet avec `flutter clean`

3. **Plugin image_picker non trouvé** :
   - Exécutez `flutter pub get`
   - Redémarrez votre IDE

4. **Photos ne s'affichent pas** :
   - Vérifiez les permissions de stockage
   - Testez sur un appareil physique plutôt qu'un émulateur

### Commandes de Dépannage

```bash
# Nettoyer le projet
flutter clean

# Nettoyer le cache Pub
flutter pub cache clean --force

# Réinstaller les dépendances
flutter pub get

# Analyser le code
flutter analyze

# Tester l'application
flutter test
```

## Tests et Qualité

### Tests Unitaires

```bash
flutter test
```

### Analyse Statique

```bash
flutter analyze
```

### Performance

```bash
flutter run --profile
```

## Améliorations Futures

### Fonctionnalités Suggérées

- **🗺️ Géolocalisation** : Ajouter les coordonnées GPS des endroits
- **🏷️ Catégories** : Organiser les endroits par type (restaurant, monument, etc.)
- **🔍 Recherche** : Fonction de recherche par nom
- **📤 Partage** : Partager vos endroits favoris
- **☁️ Synchronisation** : Sauvegarde cloud des données
- **📱 Widget** : Widget d'accueil pour accès rapide
- **🎨 Thèmes** : Personnalisation de l'interface
- **📊 Statistiques** : Nombre d'endroits, photos prises, etc.

### Améliorations Techniques

- **🗃️ Base de données** : Migration vers SQLite pour la persistance
- **🔄 State Management** : Migration vers BLoC si l'application grandit
- **🧪 Tests** : Ajout de tests d'intégration et de widgets
- **🚀 CI/CD** : Pipeline d'intégration continue
- **📈 Analytics** : Suivi d'utilisation et métriques

## Contribution

### Signaler un Bug

1. Vérifiez que le bug n'est pas déjà signalé
2. Créez une issue sur GitHub avec :
   - Description détaillée du problème
   - Étapes de reproduction
   - Captures d'écran
   - Informations sur l'environnement (OS, version Flutter, etc.)

### Contribuer au Code

1. Fork le projet
2. Créez une branche pour votre fonctionnalité
3. Suivez les conventions de code Flutter
4. Ajoutez des tests si applicable
5. Créez une Pull Request avec description détaillée





## Changelog

### Version 1.0.0
- ✅ Interface de liste des endroits favoris
- ✅ Ajout d'endroits avec photos
- ✅ Détails des endroits en plein écran
- ✅ Gestion d'état avec Riverpod
- ✅ Design Material 3 cohérent
- ✅ Support Android et iOS
- ✅ Documentation complète

<img width="623" height="1280" alt="image" src="https://github.com/user-attachments/assets/2008d24e-6e41-4a45-8011-b1840bbcf754" />


<img width="623" height="1280" alt="image" src="https://github.com/user-attachments/assets/5cd840b7-7da2-4fdd-9319-0de6c6ebeee8" />


---

