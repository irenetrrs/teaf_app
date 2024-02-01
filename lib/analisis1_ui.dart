import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inicio_ui.dart';
import 'analisis2_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

// ignore: must_be_immutable
class Analisis1UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis1UIState createState() => _Analisis1UIState();
}

class _Analisis1UIState extends State<Analisis1UI> {
  // Variables para manejar el estado de los botones
  final String adoptado = 'preguntaAdoptado';
  final String tiempoacogida = 'preguntaTiempoAcogida';
  bool botonSi = false;
  bool botonNo = false;
  bool botonmenor = false;
  bool botonmayor = false;
  @override
  void initState() {
    super.initState();
    _loadAdoptadoSelectionFromPrefs();
    _loadTiempoAcogidaSelectionFromPrefs();
    setState(() {
      botonSi = false;
      botonNo = false;
      botonmenor = false;
      botonmayor = false;
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
                          builder: (context) => InicioUI(),
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
                height: 30,
              ),
              SizedBox(
                width: 303,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Positioned(
                      left: 3,
                      top: 164,
                      child: SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Edad',
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
                                          title:
                                              Text('Información sobre la Edad'),
                                          content: Text(
                                              'En los menores de 3 años de edad, el estudio neurocognitivo se basa en el retraso en el desarrollo. Además, en los menores de 6 años y en los mayores de 18 años no se puede realizar el estudio conductal.'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Aceptar'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('img/pregunta.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 303.0, // Ancho del rectángulo
                                  height: 50.0, // Alto del rectángulo
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .grey[300], // Color gris del rectángulo
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Bordes redondeados
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0), // Espaciado interno
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Meses',
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
                      height: 30,
                    ),
                    Positioned(
                      left: 3,
                      top: 164,
                      child: SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '¿Adoptado/Acogido?',
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
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "Sí"
                                      setState(() {
                                        botonSi = true;
                                        botonNo = false;
                                      });
                                      _saveAdoptadoSelectionToPrefs(true);
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
                                      // Acción cuando se presiona el botón "No"
                                      setState(() {
                                        botonSi = false;
                                        botonNo = true;
                                      });
                                      _saveAdoptadoSelectionToPrefs(false);
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
                    Positioned(
                      left: 3,
                      top: 164,
                      child: SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tiempo de acogida',
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
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "<24"
                                      setState(() {
                                        botonmenor = true;
                                        botonmayor = false;
                                      });
                                      _saveTiempoAcogidaSelectionToPrefs(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonmenor
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
                                      '< 24 meses',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 20,
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
                                      // Acción cuando se presiona el botón ">24"
                                      setState(() {
                                        botonmayor = true;
                                        botonmenor = false;
                                      });
                                      _saveTiempoAcogidaSelectionToPrefs(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonmayor
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
                                      '≥ 24 meses',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
                                        fontSize: 20,
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
                          builder: (context) => Analisis2UI(),
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

  //para guardar y cargar el estado de la seleccion del boton adoptado
  _saveAdoptadoSelectionToPrefs(bool botonSi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$adoptado-botonSi', botonSi);
  }

  _loadAdoptadoSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedAdoptadoSelection = prefs.getBool('$adoptado-botonSi') ?? false;

    setState(() {
      botonSi = savedAdoptadoSelection;
      botonNo = !savedAdoptadoSelection;
    });
  }

  //para guardar y cargar el estado de la seleccion del boton tiempoacogida
  _saveTiempoAcogidaSelectionToPrefs(bool botonmenor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$tiempoacogida-botonmenor', botonmenor);
  }

  _loadTiempoAcogidaSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedTiempoAcogidaSelection =
        prefs.getBool('$tiempoacogida-botonmenor') ?? false;

    setState(() {
      botonmenor = savedTiempoAcogidaSelection;
      botonmayor = !savedTiempoAcogidaSelection;
    });
  }
}
