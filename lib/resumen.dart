import 'package:flutter/material.dart';
import 'resumen_ui.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResumenUI(diagnosticoResult: '',),
    );
  }
}
