import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Introduce un nombre'),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(hintText: 'Nombre'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Cierra el cuadro de diálogo sin hacer nada
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Guarda el texto introducido en una variable o realiza alguna acción
            String nombre = _textEditingController.text;
            // Puedes enviar el nombre a donde lo necesites
            Navigator.of(context).pop(
                nombre); // Cierra el cuadro de diálogo y devuelve el nombre
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController
        .dispose(); // Importante: liberar el controlador de texto
    super.dispose();
  }
}