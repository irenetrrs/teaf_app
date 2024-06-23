import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis5_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';
import 'solucion_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Analisis6UI extends StatefulWidget {
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
        'Alcohol: ${alcohol ? 'Sí' : 'No'}\n'
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
          title: Text('Resumen'),
          content: Text(popupMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Editar'),
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
              child: Text('Continuar'),
            ),
          ],
        );
      },
    );
  }
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
    _loadRecurrenteSelectionFromPrefs();
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
                                'Malformaciones craneales (RM)',
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
                                        _saveAnomaliasSelectionToPrefs(true);
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
                                          botonanomaliassi = false;
                                          botonanomaliasno = true;
                                        });
                                        _saveAnomaliasSelectionToPrefs(false);
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
                                'Fiebre recurrente',
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
                                        _saveRecurrenteSelectionToPrefs(true);
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
                                        // Acción cuando se presiona el botón "No"
                                        setState(() {
                                          botonrecurrentesi = false;
                                          botonrecurrenteno = true;
                                        });
                                        _saveRecurrenteSelectionToPrefs(false);
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
                      if ((botonanomaliasno || botonanomaliassi) &&
                          (botonrecurrenteno || botonrecurrentesi)) {
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
                          WidgetStateProperty.all(Color(0xFF262f36)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
  _saveAnomaliasSelectionToPrefs(bool botonanomaliassi) async {
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

  //para guardar y cargar el estado de la seleccion del boton recurrente
  _saveRecurrenteSelectionToPrefs(bool botonrecurrentesi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$recurrente-botonrecurrentesi', botonrecurrentesi);
  }

  // Para cargar el estado del botón "Recurrente"
  _loadRecurrenteSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedBotonrecurrente = prefs.getBool('$recurrente-botonrecurrentesi');
    if (savedBotonrecurrente != null) {
      setState(() {
        botonrecurrentesi = savedBotonrecurrente;
        botonrecurrenteno = !savedBotonrecurrente;
      });
    } else {
      botonrecurrentesi = false;
      botonrecurrenteno = false;
    }
  }
}
