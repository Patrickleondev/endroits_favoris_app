import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/endroits_utilisateurs.dart';
import 'vue/ajout_endroit.dart';
import 'widgets/endroits_list.dart';

void main() {
  runApp(const ProviderScope(child: MonApplication()));
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Endroits favoris',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const EndroitsInterface(),
      routes: {
        AjoutEndroit.routeName: (_) => const AjoutEndroit(),
      },
    );
  }
}

class EndroitsInterface extends ConsumerWidget {
  const EndroitsInterface({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final endroitsUtilisateur = ref.watch(endroitsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600], // Couleur jaune exacte comme dans l'image
        title: const Text(
          'Mes endroits préférés',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AjoutEndroit.routeName);
            },
            icon: const Icon(Icons.add, color: Colors.white),
            tooltip: 'Ajouter',
          )
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50], // Fond gris clair comme dans l'image
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EndroitsList(endroits: endroitsUtilisateur),
      ),
    );
  }
}
