import 'dart:io';
import 'package:uuid/uuid.dart';

class Endroit {
  // créer une constante instance de la classe Uuid
  static const Uuid _uuid = Uuid();

  Endroit({required this.nom, this.image}) : id = _uuid.v4();

  final String id;
  final String nom;
  final File? image; // Image optionnelle pour l'endroit
}


