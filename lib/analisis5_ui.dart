import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'analisis4_ui.dart';
import 'solucion_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

class Analisis5UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis5UIState createState() => _Analisis5UIState();
}

class _Analisis5UIState extends State<Analisis5UI> {
  late SharedPreferences prefs;
  int imagenseleccionadafiltrum =
      -1; // Índice de la imagen seleccionada en la columna 1
  int imagenseleccionadalabio =
      -1; // Índice de la imagen seleccionada en la columna 2
  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      imagenseleccionadafiltrum =
          prefs.getInt('imagenseleccionadafiltrum') ?? -1;
      imagenseleccionadalabio = prefs.getInt('imagenseleccionadalabio') ?? -1;
    });
  }

  void savePreferences() {
    prefs.setInt('imagenseleccionadafiltrum', imagenseleccionadafiltrum);
    prefs.setInt('imagenseleccionadalabio', imagenseleccionadalabio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001254),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Encabezado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Acción a realizar cuando se hace clic en el botón
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Analisis4UI(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/atras.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                // Logo y nombre en una Columna
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        // Acción a realizar cuando se hace clic en el botón
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeUI(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('img/logo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'VisualTEAF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Icono de apagado
                InkWell(
                  onTap: () {
                    // Acción a realizar cuando se hace clic en el botón
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUI(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/off.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 50.0,
                    height: 50.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Evaluación',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 50,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 310,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Filtrum',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Labio superior',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5, // Número de filas
                                  (rowIndex) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      2, // Número de imágenes por fila
                                      (columnIndex) {
                                        final imageName =
                                            columnIndex == 0 ? 'f' : 'l';
                                        final imageNumber = rowIndex + 1;
                                        final fullImageName =
                                            '$imageName$imageNumber';
                                        final isSelected = columnIndex == 0
                                            ? imagenseleccionadafiltrum ==
                                                rowIndex + 1
                                            : imagenseleccionadalabio ==
                                                rowIndex + 1;

                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (columnIndex == 0) {
                                                imagenseleccionadafiltrum =
                                                    imagenseleccionadafiltrum ==
                                                            rowIndex + 1
                                                        ? -1
                                                        : rowIndex + 1;
                                              } else {
                                                imagenseleccionadalabio =
                                                    imagenseleccionadalabio ==
                                                            rowIndex + 1
                                                        ? -1
                                                        : rowIndex + 1;
                                              }
                                            });
                                            print(
                                                'Filtrum: $imagenseleccionadafiltrum');
                                            print(
                                                'Labio superior: $imagenseleccionadalabio');
                                            savePreferences();
                                          },
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'img/$fullImageName.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                width: 5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Manejar la acción de Siguiente
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SolucionUI(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF001254)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Siguiente',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
