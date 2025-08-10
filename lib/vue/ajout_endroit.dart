import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/endroits_utilisateurs.dart';
import '../widgets/image_prise.dart';

class AjoutEndroit extends ConsumerStatefulWidget {
  const AjoutEndroit({super.key});

  static const String routeName = '/ajout-endroit';

  @override
  ConsumerState<AjoutEndroit> createState() => _AjoutEndroitState();
}

class _AjoutEndroitState extends ConsumerState<AjoutEndroit> {
  final TextEditingController _nomController = TextEditingController();
  File? _imageSelectionnee;

  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  void _enregistreEndroit() {
    final nom = _nomController.text.trim();
    if (nom.isEmpty) return;
    ref.read(endroitsProvider.notifier).ajoutEndroit(nom, image: _imageSelectionnee);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Text(
          "Ajout d'un nouveau endroit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Label "Nom d'endroit"
            const Text(
              "Nom d'endroit",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Champ de texte avec bordure bleue (sans placeholder)
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[400]!, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[600]!, width: 2),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[400]!, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Widget pour la prise de photo
            ImagePrise(
              onPhotoSelectionne: (image) {
                setState(() {
                  _imageSelectionnee = image;
                });
              },
            ),
            const SizedBox(height: 32),
            // Bouton d'ajout avec style exact du PDF
            ElevatedButton.icon(
              onPressed: _enregistreEndroit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[500],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                'Ajouter un nouveau endroit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


