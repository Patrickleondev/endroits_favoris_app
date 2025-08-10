import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modele/endroit.dart';

class EndroitsUtilisateur extends StateNotifier<List<Endroit>> {
  EndroitsUtilisateur() : super(const []);

  void ajoutEndroit(String nom, {File? image}) {
    final nouveau = Endroit(nom: nom, image: image);
    state = [nouveau, ...state];
  }
}

// création d'un fournisseur
// ce provider utilise EndroitsUtilisateur et une liste d'endroits
final endroitsProvider =
    StateNotifierProvider<EndroitsUtilisateur, List<Endroit>>(
  (ref) => EndroitsUtilisateur(),
);


