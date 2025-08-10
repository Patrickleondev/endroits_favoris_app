import 'dart:io';
import 'package:flutter/material.dart';

import '../modele/endroit.dart';
import '../vue/endroit_detail.dart';

class EndroitsList extends StatelessWidget {
  const EndroitsList({super.key, required this.endroits});

  final List<Endroit> endroits;

  @override
  Widget build(BuildContext context) {
    if (endroits.isEmpty) {
      return const Center(
        child: Text(
          "Pas d'endroits favoris pour le moment",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: endroits.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (ctx, index) {
        final e = endroits[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => EndroitDetail(endroit: e),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                // Cercle avec photo (comme dans l'image PDF)
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown[300],
                    image: e.image != null
                        ? DecorationImage(
                            image: FileImage(e.image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: e.image == null
                      ? Icon(
                          Icons.place,
                          color: Colors.white,
                          size: 24,
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                // Nom de l'endroit
                Expanded(
                  child: Text(
                    e.nom,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


