import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis2_ui.dart';
import 'analisis4_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

class Analisis3UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis3UIState createState() => _Analisis3UIState();
}

class _Analisis3UIState extends State<Analisis3UI> {
  // Variables para manejar el estado de los botones
  final String etnia = 'preguntaEtnia';
  final String genero = 'preguntaGenero';
  bool botoncau = false;
  bool botonafro = false;
  bool botonhom = false;
  bool botonmuj = false;
  @override
  void initState() {
    super.initState();
    _loadEtniaSelectionFromPrefs();
    _loadGeneroSelectionFromPrefs();
    setState(() {
      botonafro = false;
      botoncau = false;
      botonhom = false;
      botonmuj = false;
    });
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
                          builder: (context) => Analisis2UI(),
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
                      // Puedes ajustar el tamaño del contenedor según tus necesidades
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
                              // Puedes ajustar el tamaño del contenedor según tus necesidades
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
                      // Puedes ajustar el tamaño del contenedor según tus necesidades
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
                height: 50,
              ),
              SizedBox(
                width: 310,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      top: 164,
                      child: SizedBox(
                        width: 303,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Etnia',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "Sí"
                                      setState(() {
                                        botoncau = true;
                                        botonafro = false;
                                      });
                                      _saveEtniaSelectionToPrefs(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botoncau
                                          ? Colors
                                              .orange // Color cuando está botonado
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      'Caucásico',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "Sí"
                                      setState(() {
                                        botoncau = false;
                                        botonafro = true;
                                      });
                                      _saveEtniaSelectionToPrefs(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonafro
                                          ? Colors
                                              .orange // Color cuando está botonado
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      'Afroamericano',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Positioned(
                      left: 3,
                      top: 164,
                      child: SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Género',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "Sí"
                                      setState(() {
                                        botonhom = true;
                                        botonmuj = false;
                                      });
                                      _saveGeneroSelectionToPrefs(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonhom
                                          ? Colors
                                              .orange // Color cuando está botonado
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      'Hombre',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "Sí"
                                      setState(() {
                                        botonhom = false;
                                        botonmuj = true;
                                      });
                                      _saveGeneroSelectionToPrefs(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonmuj
                                          ? Colors
                                              .orange // Color cuando está botonado
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      'Mujer',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      // Manejar la acción de Atrás
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Analisis4UI(),
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
        ));
  }

  //para guardar y cargar el estado de la seleccion del boton etnia
  _saveEtniaSelectionToPrefs(bool botoncau) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$etnia-botoncau', botoncau);
  }

  _loadEtniaSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedBotoncau = prefs.getBool('$etnia-botoncau') ?? false;

    setState(() {
      botoncau = savedBotoncau;
      botonafro = !savedBotoncau;
    });
  }

  //para guardar y cargar el estado de la seleccion del boton genero
  _saveGeneroSelectionToPrefs(bool botonhom) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$genero-botonhom', botonhom);
  }

  _loadGeneroSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedBotonhom = prefs.getBool('$genero-botonhom') ?? false;

    setState(() {
      botonhom = savedBotonhom;
      botonmuj = !savedBotonhom;
    });
  }
}
