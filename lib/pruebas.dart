import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Generar PDF'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await generatePDF(context);
            },
            child: Text('Generar PDF'),
          ),
        ),
      ),
    );
  }
}

Future<void> generatePDF(BuildContext context) async {
  final pdf = pw.Document();

  // Agrega contenido al PDF
  pdf.addPage(pw.Page(
    build: (pw.Context context) {
      return pw.Center(
        child: pw.Text("¡Hola, mundo!"),
      );
    },
  ));

  // Obtiene la ruta del directorio temporal
  final output = await getTemporaryDirectory();

  // Crea el archivo PDF
  final file = File("${output.path}/example.pdf");

  // Escribe el contenido del PDF al archivo
  await file.writeAsBytes(await pdf.save());

  // Muestra un mensaje al usuario con un botón para abrir manualmente el archivo
  // ignore: use_build_context_synchronously
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('PDF generado'),
        content:
            Text('El PDF se ha generado correctamente. ¿Deseas abrirlo ahora?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              OpenFile.open(file.path);
            },
            child: Text('Abrir PDF'),
          ),
        ],
      );
    },
  );
}

void main() {
  runApp(MyApp2());
}
