import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis5_ui.dart';
import 'analisis4_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

class Analisis6UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis6UIState createState() => _Analisis6UIState();
}

class _Analisis6UIState extends State<Analisis6UI> {
  // Variables para manejar el estado de los botones
  final String anomalias = 'preguntaAnomalías';
  final String recurrente = 'preguntaRecurrente';
  bool botonanomaliassi = false;
  bool botonanomaliasno = false;
  bool botonrecurrentesi = false;
  bool botonrecurrenteno = false;
  @override
  void initState() {
    super.initState();
    _loadAnomaliasSelectionFromPrefs();
    _loadGeneroSelectionFromPrefs();
    setState(() {
      botonanomaliassi = false;
      botonanomaliasno = false;
      botonrecurrentesi = false;
      botonrecurrenteno = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 60, 152, 209),
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
                          builder: (context) => Analisis5UI(),
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
                              'Malformaciones craneales',
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
                                        botonanomaliassi = true;
                                        botonanomaliasno = false;
                                      });
                                      _saveEtniaSelectionToPrefs(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonanomaliassi
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
                                      'Sí',
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
                                        botonanomaliassi = false;
                                        botonanomaliasno = true;
                                      });
                                      _saveEtniaSelectionToPrefs(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonanomaliasno
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
                                      'No',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 13,
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
                              'Recurrente',
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
                                        botonrecurrentesi = true;
                                        botonrecurrenteno = false;
                                      });
                                      _saveGeneroSelectionToPrefs(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonrecurrentesi
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
                                      'Sí',
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
                                        botonrecurrentesi = false;
                                        botonrecurrenteno = true;
                                      });
                                      _saveGeneroSelectionToPrefs(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonrecurrenteno
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
                                      'No',
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

  //para guardar y cargar el estado de la seleccion del boton anomalias
  _saveAnomaliasSelectionToPrefs(bool botoncau) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$anomalias-botonanomaliassi', botonanomaliassi);
  }

  _loadAnomaliasSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedBotonanomalias = prefs.getBool('$anomalias-botonanomaliassi');

    if (savedBotonanomalias != null) {
      setState(() {
        botonanomaliassi = savedBotonanomalias;
        botonanomaliasno = !savedBotonanomalias;
      });
    } else {
      botonanomaliasno = false;
      botonanomaliassi = false;
    }
  }

  //para guardar y cargar el estado de la seleccion del boton genero
  _saveRecurrenteSelectionToPrefs(bool botonhom) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$genero-botonhom', botonhom);
  }

  _loadGeneroSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedBotonhom = prefs.getBool('$genero-botonhom');
    if (savedBotonhom != null) {
      setState(() {
        botonhom = savedBotonhom;
        botonmuj = !savedBotonhom;
      });
    } else {
      botonhom = false;
      botonmuj = false;
    }
  }
}
