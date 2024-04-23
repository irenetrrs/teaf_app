import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis1_ui.dart';
import 'analisis3_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Analisis2UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis2UIState createState() => _Analisis2UIState();
}

class _Analisis2UIState extends State<Analisis2UI> {
  // Variables para manejar el estado de los botones
  final String dominios = 'preguntaDominios';
  final String alcohol = 'preguntaAlcohol';
  bool boton0 = false;
  bool boton1 = false;
  bool boton2 = false;
  bool botonSi = false;
  bool botonNo = false;

  _launchURL(String url) async {
    Uri url0 = Uri.parse(url);
    if (await launchUrl(url0)) {
      await launchUrl(url0);
    } else {
      throw 'Could not launch $url0';
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDominiosSelectionFromPrefs();
    _loadAlcoholSelectionFromPrefs();
    // Establecer todas las variables de estado en false inicialmente
    setState(() {
      boton0 = false;
      boton1 = false;
      boton2 = false;
      botonNo = false;
      botonSi = false;
    });
  }

  // Función para obtener el estado de los botones de dominios
  Future<bool> getDominiosButtonState(int buttonNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('$dominios-boton$buttonNumber') ?? false;
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
                          builder: (context) => Analisis1UI(),
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
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 310,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                            width: 310,
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Número de dominios afectados',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Mostrar el pop-up al tocar la imagen
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Información sobre los dominios'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Visualice el siguiente vídeo para obtener más información sobre los dominios afectados:'),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _launchURL(
                                                          'https://vimeo.com/845544703'); // Llama a la función para abrir el enlace
                                                    },
                                                    child: Text(
                                                      'Vimeo - Dominios Afectados',
                                                      style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255,
                                                            4,
                                                            60,
                                                            105), // Estilo para que parezca un enlace
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end, // Esto alineará el botón "Cerrar" a la derecha
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cerrar'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('img/pregunta.png'),
                                            fit: BoxFit.cover,
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
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Acción cuando se presiona el botón "Sí"
                                  setState(() {
                                    boton0 = true;
                                    boton1 = false;
                                    boton2 = false;
                                  });
                                  _saveDominiosSelectionToPrefs(
                                      true, false, false);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: boton0
                                      ? Colors
                                          .orange // Color cuando está botonado
                                      : Color(0xFFDFDFDF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fixedSize: Size.fromHeight(50.0),
                                ),
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    color: Color(0xFF68696C),
                                    fontSize: 25,
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
                                  // Acción cuando se presiona el botón "No"
                                  setState(() {
                                    boton0 = false;
                                    boton1 = true;
                                    boton2 = false;
                                  });
                                  _saveDominiosSelectionToPrefs(
                                      false, true, false);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: boton1
                                      ? Colors
                                          .orange // Color cuando está botonado
                                      : Color(0xFFDFDFDF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fixedSize: Size.fromHeight(50.0),
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Color(0xFF68696C),
                                    fontSize: 25,
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
                                  // Acción cuando se presiona el botón "No"
                                  setState(() {
                                    boton0 = false;
                                    boton1 = false;
                                    boton2 = true;
                                  });
                                  _saveDominiosSelectionToPrefs(
                                      false, false, true);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: boton2
                                      ? Colors
                                          .orange // Color cuando está botonado
                                      : Color(0xFFDFDFDF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fixedSize: Size.fromHeight(50.0),
                                ),
                                child: Text(
                                  '≥ 2',
                                  style: TextStyle(
                                    color: Color(0xFF68696C),
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Positioned(
                          left: 3,
                          top: 164,
                          child: SizedBox(
                            width: 303,
                            child: Column(
                              children: [
                                Text(
                                  'Consumo de alcohol en el embarazo',
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
                                            botonNo = false;
                                            botonSi = true;
                                          });
                                          _saveAlcoholSelectionToPrefs(true);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: botonSi
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
                                            fontSize: 25,
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
                                            botonNo = true;
                                            botonSi = false;
                                          });
                                          _saveAlcoholSelectionToPrefs(false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: botonNo
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
                                            fontSize: 25,
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if ((boton0 || boton1 || boton2) &&
                          (botonNo || botonSi)) {
                        // Manejar la acción de Atrás
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Analisis3UI(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Por favor, rellene todos los campos",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Color.fromARGB(255, 4, 0, 115),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
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

//para guardar y cargar el estado de la seleccion del boton dominios
  _saveDominiosSelectionToPrefs(bool boton0, bool boton1, bool boton2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$dominios-boton0', boton0);
    prefs.setBool('$dominios-boton1', boton1);
    prefs.setBool('$dominios-boton2', boton2);
  }

  _loadDominiosSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedBoton0 = prefs.getBool('$dominios-boton0') ?? false;
    bool savedBoton1 = prefs.getBool('$dominios-boton1') ?? false;
    bool savedBoton2 = prefs.getBool('$dominios-boton2') ?? false;

    setState(() {
      boton0 = savedBoton0;
      boton1 = savedBoton1;
      boton2 = savedBoton2;
    });
  }

  //para guardar y cargar el estado de la seleccion del boton alcohol
  _saveAlcoholSelectionToPrefs(bool botonSi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$alcohol-botonSi', botonSi);
  }

  _loadAlcoholSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedBotonSi = prefs.getBool('$alcohol-botonSi');

    if (savedBotonSi != null) {
      setState(() {
        botonSi = savedBotonSi;
        botonNo = !savedBotonSi;
      });
    } else {
      botonNo = false;
      botonSi = false;
    }
  }
}
