import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis1_ui.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'package:teaf_app/solucion_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

class SharedPreferencesHelper {
  //dominios - 0 1 2
  static Future<bool> getDominiosButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaDominios-boton0') ?? false;
  }

  //alcohol - si no
  static Future<bool> getAlcoholButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaAlcohol-botonSi') ?? false;
  }

  //peso
  static Future<String> getPesoText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preguntaPeso') ?? '';
  }

  //talla
  static Future<String> getTallaText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preguntaTalla') ?? '';
  }

  //perimetro craneal
  static Future<String> getPerimetroCranealText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preguntaPerimetroCraneal') ?? '';
  }

  //distancia palpebral
  static Future<String> getDistanciaPalpebralText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('distanciaPalpebral') ?? '';
  }

  //filtrum
  static Future<int> getFiltrum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('imagenseleccionadafiltrum') ?? -1;
  }

  //labio superior
  static Future<int> getLabioSuperior() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('imagenseleccionadalabio') ?? -1;
  }
}

class ResumenUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 152, 209),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
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
                        builder: (context) => SolucionUI(),
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
              'Resumen',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 50,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'TEAF negativo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 310,
              height: 74,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/altura.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Altura',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19,
                            top: 40,
                            child: FutureBuilder<String>(
                              future: SharedPreferencesHelper.getTallaText(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error obteniendo la altura');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'} cm',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 165,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 37,
                            child: FutureBuilder<String>(
                              future: SharedPreferencesHelper.getPesoText(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error obteniendo el peso');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'} kg',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/peso.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Peso',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 310,
              height: 74,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 37,
                            child: FutureBuilder<String>(
                              future: SharedPreferencesHelper
                                  .getDistanciaPalpebralText(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Error obteniendo la distancia palpebral');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'} cm',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/distancia.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Distancia',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19,
                            top: 40,
                            child: Image.asset(
                              'img/distancia.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 165,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 37,
                            child: FutureBuilder<bool>(
                              future: SharedPreferencesHelper
                                  .getAlcoholButtonState(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Error obteniendo la información');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/alcohol.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Alcohol',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 310,
              height: 74,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/filtrum.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Filtrum',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19,
                            top: 40,
                            child: FutureBuilder<int>(
                              future: SharedPreferencesHelper.getFiltrum(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error obteniendo la referencia');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 165,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 37,
                            child: FutureBuilder<int>(
                              future:
                                  SharedPreferencesHelper.getLabioSuperior(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error obteniendo la referencia');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/labio.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Labio superior',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 310,
              height: 74,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/cerebro.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'Neuroconductual',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19,
                            top: 40,
                            child: FutureBuilder<bool>(
                              future: SharedPreferencesHelper
                                  .getDominiosButtonState(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Error obteniendo la información');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 165,
                    top: 0,
                    child: SizedBox(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 145,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB35B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 37,
                            child: FutureBuilder<String>(
                              future: SharedPreferencesHelper
                                  .getPerimetroCranealText(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Error obteniendo el perímetro craneal');
                                } else {
                                  return Text(
                                    '${snapshot.data ?? 'N/A'} cm',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Font Awesome 5 Free',
                                      fontWeight: FontWeight.w900,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 14,
                            child: Image.asset(
                              'img/perimetro.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 10,
                            child: Text(
                              'P. Craneal',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Font Awesome 5 Free',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Analisis1UI(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 176, 176, 176),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 12,
                        child: Image.asset(
                          'img/editar.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Stack(
                  children: [
                    Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 176, 176, 176),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 12,
                      child: Image.asset(
                        'img/descargar.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InicioUI(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 176, 176, 176),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 12,
                        child: Image.asset(
                          'img/papelera.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
