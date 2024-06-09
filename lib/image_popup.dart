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
      insetPadding: EdgeInsets.zero, // Elimina cualquier margen interno
      clipBehavior:
          Clip.antiAliasWithSaveLayer, // Mejora la apariencia de los bordes
      child: SizedBox.expand(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Stack(
            children: [
              // Contenedor para la imagen
              Container(
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
              // Botón de cierre (X) en la esquina superior derecha
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
