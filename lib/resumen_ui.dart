import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'package:teaf_app/patient_details_ui.dart';
import 'package:teaf_app/solucion_ui.dart';
import 'welcome_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'diagnostico_helper.dart';
import 'package:open_file/open_file.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';
import 'dialog.dart';
import 'package:path_provider/path_provider.dart';

class SharedPreferencesHelper {
  //dominios - 0 1 2
  static Future<bool> getDominiosButtonState(int buttonNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaDominios-boton$buttonNumber') ?? false;
  }

  static Future<int> dominios() async {
    bool dominiosBoton0 = await getDominiosButtonState(0);
    bool dominiosBoton1 = await getDominiosButtonState(1);
    bool dominiosBoton2 = await getDominiosButtonState(2);
    int dominios = 0;
    if (dominiosBoton0) {
      dominios = 0;
    }
    if (dominiosBoton1) {
      dominios = 1;
    }
    if (dominiosBoton2) {
      dominios = 2;
    }
    return dominios;
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

_launchURL(String url) async {
  Uri url0 = Uri.parse(url);
  // ignore: deprecated_member_use
  if (await canLaunch(url0.toString())) {
    // ignore: deprecated_member_use
    await launch(url0.toString());
  } else {
    throw 'Could not launch $url0';
  }
}

Future<void> _saveAsFile(
  BuildContext context,
  Future<Uint8List> Function(PdfPageFormat) build, // Cambio aquí
  PdfPageFormat pageFormat,
) async {
  final bytes =
      await build(pageFormat); // Esperar a que se complete la función build

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('Save as file ${file.path} ...');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

// ignore: must_be_immutable
class ResumenUI extends StatelessWidget {
  late AppLanguageProvider appLanguage;
  @override
  Widget build(BuildContext context) {
    DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();
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
                            AppLocalizations.of(context)!.translate('appName')!,
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
                        builder: (context) => WelcomeUI(),
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
              AppLocalizations.of(context)!.translate('summary')!,
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
              child: FutureBuilder<String>(
                future: diagnosticoHelper.diagnostico(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Si el Future está en espera, muestra un indicador de carga
                    return CircularProgressIndicator();
                  } else {
                    // Si la llamada al Future es exitosa, muestra el texto resultante
                    // del diagnóstico sin cambiar la forma del botón
                    return ElevatedButton(
                      onPressed: () {
                        _launchURL('https://cursoteaf.com/');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      child: Text(
                        snapshot.data ??
                            AppLocalizations.of(context)!
                                .translate('diagnosis_not_available')!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                },
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
                              AppLocalizations.of(context)!
                                  .translate('height')!,
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
                                  return Text(
                                    AppLocalizations.of(context)!
                                        .translate('error')!,
                                  );
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
                                  return Text(
                                    AppLocalizations.of(context)!
                                        .translate('error')!,
                                  );
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
                              AppLocalizations.of(context)!
                                  .translate('weight')!,
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
                                  return Text('Error');
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
                              AppLocalizations.of(context)!
                                  .translate('palpebral_distance')!,
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
                                  return Text('Error');
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
                              AppLocalizations.of(context)!
                                  .translate('alcohol')!,
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
                              AppLocalizations.of(context)!
                                  .translate('filtrum')!,
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
                                  return Text('Error');
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
                                  return Text(
                                    AppLocalizations.of(context)!
                                        .translate('error')!,
                                  );
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
                              AppLocalizations.of(context)!
                                  .translate('upper_lip')!,
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
                              AppLocalizations.of(context)!
                                  .translate('neurobehavioral')!,
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
                              future: SharedPreferencesHelper.dominios(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                    AppLocalizations.of(context)!
                                        .translate('error')!,
                                  );
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
                                    AppLocalizations.of(context)!
                                        .translate('error')!,
                                  );
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
                              AppLocalizations.of(context)!
                                  .translate('head_circumference_short')!,
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyDialog();
                      },
                    ).then((value) {
                      // El cuadro de diálogo ha sido cerrado, puedes manejar el valor devuelto aquí
                      if (value != null) {
                        // Aquí puedes hacer algo con el valor devuelto, como guardarlo en algún lugar
                        print('El nombre introducido es: $value');
                        // Navegar a la página PatientDetails
                        diagnosticoHelper.savePatient(context, value);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PatientDetailsScreen(patientName: value),
                          ),
                        );
                      }
                    });
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
                GestureDetector(
                  onTap: () {
                    _saveAsFile;
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
                          'img/descargar.png',
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
