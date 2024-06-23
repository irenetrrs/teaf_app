import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis6_ui.dart';
import 'analisis4_ui.dart';
import 'solucion_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'diagnostico_helper.dart';

class Analisis5UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis5UIState createState() => _Analisis5UIState();
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
  } //labio superior

  static Future<int> getLabioSuperior() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('imagenseleccionadalabio') ?? -1;
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
        'Labio superior: $imagenseleccionadalabio \n';

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

class _Analisis5UIState extends State<Analisis5UI> {
  DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();
  late SharedPreferences prefs;
  late bool isCaucasian;
  late List<String> filtrumImages;
  late List<String> labioSuperiorImages;
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
    isCaucasian = await SharedPreferencesHelper
        .getEtniaButtonState(); // Obtiene el valor de etnia
    filtrumImages = isCaucasian
        ? ['fc5', 'fc4', 'fc3', 'fc2', 'fc1'] // Imágenes para caucásicos
        : ['fa5', 'fa4', 'fa3', 'fa2', 'fa1']; // Imágenes para afroamericanos
    labioSuperiorImages = isCaucasian
        ? ['lc5', 'lc4', 'lc3', 'lc2', 'lc1'] // Imágenes para caucásicos
        : ['la5', 'la4', 'la3', 'la2', 'la1']; // Imágenes para afroamericanos
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
    DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();
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

            ///cuerpo
            Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Filtrum',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) {
                              final reversedIndex = 5 - index;
                              final imageName = isCaucasian
                                  ? filtrumImages[index]
                                  : filtrumImages[index];
                              final isSelected =
                                  imagenseleccionadafiltrum == reversedIndex;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    imagenseleccionadafiltrum =
                                        isSelected ? -1 : reversedIndex;
                                  });
                                  savePreferences();
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('img/$imageName.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.orange
                                          : Colors.transparent,
                                      width: 5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Labio superior',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) {
                              final reversedIndex = 5 - index;
                              final imageName = isCaucasian
                                  ? labioSuperiorImages[
                                      index] // Aquí debes usar labioSuperiorImages
                                  : labioSuperiorImages[index]; // También aquí

                              final isSelected =
                                  imagenseleccionadalabio == reversedIndex;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    imagenseleccionadalabio =
                                        isSelected ? -1 : reversedIndex;
                                  });
                                  savePreferences();
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('img/$imageName.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.orange
                                          : Colors.transparent,
                                      width: 5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    // Verificar si se ha seleccionado una imagen para Filtrum y Labio superior
                    if (imagenseleccionadafiltrum != -1 &&
                        imagenseleccionadalabio != -1) {
                      // Obtener datos del paciente
                      String perimetroUsuario = await SharedPreferencesHelper
                          .getPerimetroCranealText();
                      String edad = await SharedPreferencesHelper.getEdadText();
                      String generoPaciente =
                          await SharedPreferencesHelper.getGeneroButtonState()
                              ? 'Hombre'
                              : 'Mujer';

                      // Verificar el perímetro craneal del usuario
                      bool perimetroValido =
                          await diagnosticoHelper.verificarPerimetroCraneal(
                              perimetroUsuario, edad, generoPaciente);

                      if (perimetroValido) {
                        // ignore: use_build_context_synchronously
                        SharedPreferencesHelper.showResumenDialog(context);
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => Analisis6UI(),
                          ),
                        );
                      }
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
                        WidgetStateProperty.all(Color(0xFF001254)),
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
      ),
    );
  }
}
