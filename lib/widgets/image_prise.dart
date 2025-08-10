import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePrise extends StatefulWidget {
  const ImagePrise({super.key, required this.onPhotoSelectionne});

  final void Function(File image) onPhotoSelectionne;

  @override
  State<ImagePrise> createState() => _ImagePriseState();
}

class _ImagePriseState extends State<ImagePrise> {
  File? _photoSelectionne;

  Future<void> _prendrePhoto() async {
    final picker = ImagePicker();
    final XFile? photoPrise = await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (photoPrise == null) return;
    setState(() {
      _photoSelectionne = File(photoPrise.path);
    });
    widget.onPhotoSelectionne(_photoSelectionne!);
  }

  @override
  Widget build(BuildContext context) {
    if (_photoSelectionne == null) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: TextButton.icon(
          onPressed: _prendrePhoto,
          icon: const Icon(Icons.camera_alt, color: Colors.blue),
          label: const Text(
            'Prendre photo',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: _prendrePhoto,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            _photoSelectionne!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


