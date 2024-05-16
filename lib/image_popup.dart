import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  final String imagePath;

  const ImagePopup({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Fondo transparente para el dialogo
      backgroundColor: Colors.transparent,
      // Tamaño del dialogo igual al tamaño de la pantalla
      child: SizedBox.expand(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            // Alineación de la imagen al centro
            alignment: Alignment.center,
            child: SingleChildScrollView(
              // Desplazamiento vertical para la imagen
              child: Image.asset(
                imagePath,
                // Ajustar la imagen al ancho de la pantalla
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
