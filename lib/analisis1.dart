import 'package:flutter/material.dart';
import 'analisis1_ui.dart';

class Analisis1 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis1State createState() => _Analisis1State();
}

class _Analisis1State extends State<Analisis1> {
  int edadEnMeses = 0;

  void incrementarEdad() {
    setState(() {
      edadEnMeses++;
    });
  }

  void decrementarEdad() {
    if (edadEnMeses > 0) {
      setState(() {
        edadEnMeses--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Analisis1UI(
      edadEnMeses: edadEnMeses,
      incrementarEdad: incrementarEdad,
      decrementarEdad: decrementarEdad,
    );
  }
}
