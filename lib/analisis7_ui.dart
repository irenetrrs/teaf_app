import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis5_ui.dart';
import 'welcome_ui.dart';
import 'solucion_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';

class Analisis7UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis6UIState createState() => _Analisis6UIState();
}

class SharedPreferencesHelper {
  //edad
  static Future<String> getEdadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('edad') ?? '';
  }

//adoptado - si no
  static Future<bool> getAdoptadoButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaAdoptado-botonSi') ?? false;
  }

//tiempo acogida - mayor menor
  static Future<bool> getTiempoAcogidaButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaTiempoAcogida-botonmenor') ?? false;
  }

  //dominios - 0 1 2
  static Future<bool> getDominiosButtonState(int buttonNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaDominios-boton$buttonNumber') ?? false;
  }

  //alcohol - si no
  static Future<bool> getAlcoholButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaAlcohol-botonSi') ?? false;
  }

  //etnia - cau afro
  static Future<bool> getEtniaButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaEtnia-botoncau') ?? false;
  }

  //genero - hom muj
  static Future<bool> getGeneroButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaGenero-botonhom') ?? false;
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

  //anomalias
  static Future<bool> getAnomalias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaAnomalías-botonanomaliassi') ?? false;
  }

  //recurrente
  static Future<bool> getRecurrente() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaRecurrente-botonrecurrentesi') ?? false;
  }

  static Future<void> showResumenDialog(BuildContext context) async {
    String edadText = await getEdadText();
    bool adoptado = await getAdoptadoButtonState();
    bool tiempoAcogida = await getTiempoAcogidaButtonState();
    bool dominiosBoton0 = await getDominiosButtonState(0);
    bool dominiosBoton1 = await getDominiosButtonState(1);
    bool dominiosBoton2 = await getDominiosButtonState(2);
    bool alcohol = await getAlcoholButtonState();
    bool etnia = await getEtniaButtonState();
    bool genero = await getGeneroButtonState();
    String pesoText = await getPesoText();
    String tallaText = await getTallaText();
    String perimetroCranealText = await getPerimetroCranealText();
    String distanciaPalpebralText = await getDistanciaPalpebralText();
    int imagenseleccionadafiltrum = await getFiltrum();
    int imagenseleccionadalabio = await getLabioSuperior();
    bool anomalias = await getAnomalias();
    bool recurrente = await getRecurrente();

    // Construye el mensaje del popup
    String popupMessage = 'Edad: $edadText meses\n'
        'Adoptado: ${adoptado ? 'Sí' : 'No'}\n'
        'Tiempo de Acogida: ${tiempoAcogida ? '< 24 meses' : '> 24 meses'}\n'
        'Dominios afectados: ${dominiosBoton0 ? '0 ' : ''}${dominiosBoton1 ? '1 ' : ''}${dominiosBoton2 ? '≥ 2' : ''}\n'
        'Alcohol: $alcohol\n'
        'Etnia: ${etnia ? 'Caucásico' : 'Afroamericano'}\n'
        'Género: ${genero ? 'Hombre' : 'Mujer'}\n'
        'Peso: $pesoText kg\n'
        'Talla: $tallaText cm\n'
        'Perimetro Craneal: $perimetroCranealText cm\n'
        'Distancia Palpebral: $distanciaPalpebralText cm\n'
        'Filtrum: $imagenseleccionadafiltrum \n'
        'Labio superior: $imagenseleccionadalabio \n'
        'Malformaciones craneales: ${anomalias ? 'Sí' : 'No'}\n'
        'Recurrente: ${recurrente ? 'Sí' : 'No'}\n';

    // Muestra el diálogo con el mensaje
    // ignore: use_build_context_synchronously
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.translate('resume')!,),
          content: Text(popupMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.translate('edit')!,),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SolucionUI(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.translate('continue')!,),
            ),
          ],
        );
      },
    );
  }
}

class _Analisis6UIState extends State<Analisis7UI> {
  late AppLanguageProvider appLanguage;
  // Variables para manejar el estado de los botones
  final String malformaciones = 'preguntaMalformaciones';
  bool botonmalformacionessi = false;
  bool botonmalformacionesno = false;
  @override
  void initState() {
    super.initState();
    _loadMalformacionesSelectionFromPrefs();
    setState(() {
      botonmalformacionessi = false;
      botonmalformacionesno = false;
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
                AppLocalizations.of(context)!.translate('evaluation')!,
                style: TextStyle(
                  color: Colors.white,
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
                                AppLocalizations.of(context)!.translate('major_malformations')!,
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
                                          botonmalformacionessi = true;
                                          botonmalformacionesno = false;
                                        });
                                        _saveMalformacionesSelectionToPrefs(
                                            true);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: botonmalformacionessi
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
                                        AppLocalizations.of(context)!.translate('yes')!,
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
                                          botonmalformacionessi = false;
                                          botonmalformacionesno = true;
                                        });
                                        _saveMalformacionesSelectionToPrefs(
                                            false);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: botonmalformacionesno
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
                                        AppLocalizations.of(context)!.translate('no')!,
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
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Manejar la acción de Siguiente
                      if ((botonmalformacionessi || botonmalformacionesno)) {
                        SharedPreferencesHelper.showResumenDialog(context);
                      } else {
                        Fluttertoast.showToast(
                          msg: "Por favor, rellene todos los campos",
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
                        color: Colors.white,
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
  _saveMalformacionesSelectionToPrefs(bool botonmalformacionessi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(
        '$malformaciones-botonmalformacionessi', botonmalformacionessi);
  }

  _loadMalformacionesSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedBotonmalformaciones =
        prefs.getBool('$malformaciones-botonmalformacionessi');

    if (savedBotonmalformaciones != null) {
      setState(() {
        botonmalformacionessi = savedBotonmalformaciones;
        botonmalformacionesno = !savedBotonmalformaciones;
      });
    } else {
      botonmalformacionesno = false;
      botonmalformacionessi = false;
    }
  }
}