import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inicio_ui.dart';
import 'analisis2_ui.dart';
import 'welcome_ui.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';
import 'diagnostico_helper.dart';

// ignore: must_be_immutable
class Analisis1UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis1UIState createState() => _Analisis1UIState();
}

class _Analisis1UIState extends State<Analisis1UI> {
  late AppLanguageProvider appLanguage;
  // Variables para manejar el estado de los botones
  final String? edadText = 'edad';
  final String adoptado = 'preguntaAdoptado';
  final String tiempoacogida = 'preguntaTiempoAcogida';
  bool botonSi = false;
  bool botonNo = false;
  bool botonmenor = false;
  bool botonmayor = false;
  TextEditingController edadController = TextEditingController();

  DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();
  @override
  void initState() {
    super.initState();
    _loadAdoptadoSelectionFromPrefs();
    _loadTiempoAcogidaSelectionFromPrefs();
    _loadTextFieldsFromPrefs();
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
        backgroundColor: Color.fromARGB(255, 53, 133, 182),
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
                      width: 30.0,
                      height: 30.0,
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
                              AppLocalizations.of(context)!
                                  .translate('appName')!,
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
                  // Icono de idiomas
                  InkWell(
                    child: Container(
                      child: diagnosticoHelper.buildLanguageMenu(
                          context), // Llama a la función para construir el menú de idiomas
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                AppLocalizations.of(context)!.translate('evaluation')!,
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
              Expanded(
                child: SingleChildScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('age')!,
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
                                              AppLocalizations.of(context)!
                                                  .translate('infoAge')!,
                                            ),
                                            content: Text(
                                              AppLocalizations.of(context)!
                                                  .translate('infoAgeText')!,
                                            ),
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
                                      color: Colors.grey[
                                          300], // Color gris del rectángulo
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Bordes redondeados
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0), // Espaciado interno
                                    child: TextField(
                                      controller: edadController,
                                      decoration: InputDecoration(
                                        hintText: AppLocalizations.of(context)!
                                            .translate('months')!,
                                      ),
                                      keyboardType: TextInputType
                                          .number, // Especificar el tipo de teclado como numérico
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ], // Aplicar la restricción de solo números enteros positivos
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('adopted')!,
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
                                        AppLocalizations.of(context)!
                                            .translate('yes')!,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 64, 64, 66),
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
                                        AppLocalizations.of(context)!
                                            .translate('no')!,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 64, 64, 66),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('receptionTime')!,
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
                                        _saveTiempoAcogidaSelectionToPrefs(
                                            true);
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
                                        AppLocalizations.of(context)!
                                            .translate('less24')!,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 64, 64, 66),
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
                                        // Acción cuando se presiona el botón ">24"
                                        setState(() {
                                          botonmayor = true;
                                          botonmenor = false;
                                        });
                                        _saveTiempoAcogidaSelectionToPrefs(
                                            false);
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
                                        AppLocalizations.of(context)!
                                            .translate('more24')!,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 64, 64, 66),
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
                    ],
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
                      int?
                          edad; // Obtén el valor del controlador como un String
                      String texto = edadController
                          .text; // Intenta convertir el texto a un entero
                      edad = int.tryParse(texto);
                      print(edad);
                      if (edadController.text.isNotEmpty &&
                          (botonSi || botonNo) &&
                          (botonmayor || botonmenor)) {
                        if (edad! <= 240 && edad >= 24) {
                          // Manejar la acción de Siguiente
                          _saveTextFieldsToPrefs();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Analisis2UI(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg:
                                'Por favor, introduce un valor entre 24 y 240 meses',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Color(0xFF262f36),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .translate('please')!,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Color(0xFF262f36),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF262f36)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.translate('next')!,
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

  //para guardar y cargar el dato de edad
  _saveTextFieldsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(edadText!, edadController.text);
  }

  _loadTextFieldsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      edadController.text = prefs.getString(edadText!) ?? '';
    });
  }

  //para guardar y cargar el estado de la seleccion del boton adoptado
  _saveAdoptadoSelectionToPrefs(bool botonSi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$adoptado-botonSi', botonSi);
  }

  _loadAdoptadoSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedAdoptadoSelection = prefs.getBool('$adoptado-botonSi');

    if (savedAdoptadoSelection != null) {
      setState(() {
        botonSi = savedAdoptadoSelection;
        botonNo = !savedAdoptadoSelection;
      });
    } else {
      setState(() {
        botonSi = false; // Si no hay datos guardados, establecer como falso
        botonNo = false; // Si no hay datos guardados, establecer como falso
      });
    }
  }

  //para guardar y cargar el estado de la seleccion del boton tiempoacogida
  _saveTiempoAcogidaSelectionToPrefs(bool botonmenor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$tiempoacogida-botonmenor', botonmenor);
  }

  _loadTiempoAcogidaSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedTiempoAcogidaSelection =
        prefs.getBool('$tiempoacogida-botonmenor');

    if (savedTiempoAcogidaSelection != null) {
      setState(() {
        botonmenor = savedTiempoAcogidaSelection;
        botonmayor = !savedTiempoAcogidaSelection;
      });
    } else {
      setState(() {
        botonmenor = false; // Si no hay datos guardados, establecer como falso
        botonmayor = false; // Si no hay datos guardados, establecer como falso
      });
    }
  }
}
