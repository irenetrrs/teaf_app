import 'package:flutter/material.dart';
import 'analisis5_ui.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Analisis5UI(),
    );
  }
}

class AnalisisLogic {
  int selectedImageColumn1 = -1;
  int selectedImageColumn2 = -1;

  void selectImage(int column, int index) {
    if (column == 1) {
      selectedImageColumn1 = index;
      selectedImageColumn2 = -1; // Desseleccionar de la otra columna
    } else {
      selectedImageColumn2 = index;
      selectedImageColumn1 = -1; // Desseleccionar de la otra columna
    }
  }
}
