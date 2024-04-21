import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/analisis3_ui.dart';
import 'analisis5_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class Analisis4UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis4UIState createState() => _Analisis4UIState();
}

class _Analisis4UIState extends State<Analisis4UI> {
  final String pesoText = 'preguntaPeso';
  final String tallaText = 'preguntaTalla';
  final String perimetroCranealText = 'preguntaPerimetroCraneal';
  final String distanciaPalpebralText = 'distanciaPalpebral';

  TextEditingController pesoController = TextEditingController();
  TextEditingController tallaController = TextEditingController();
  TextEditingController perimetroCranealController = TextEditingController();
  TextEditingController distanciaPalpebralController = TextEditingController();

  List<String> urls = [
    'https://vimeo.com/766536749', //peso
    'https://vimeo.com/766536770', //talla
    'https://vimeo.com/766536717', //perímetro craneal
    'https://vimeo.com/766536975', //distancia palpebral
  ];

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
    _loadTextFieldsFromPrefs();
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
                          builder: (context) => Analisis3UI(),
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
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 310,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 350,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Peso',
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
                                              Text('Información sobre el peso'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Visualice el siguiente vídeo para obtener más información sobre cómo medir el peso:'),
                                              GestureDetector(
                                                onTap: () {
                                                  _launchURL(urls[
                                                      0]); // Llama a la función para abrir el enlace
                                                },
                                                child: Text(
                                                  'Vimeo - Peso',
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255,
                                                        4,
                                                        60,
                                                        105), // Estilo para que parezca un enlace
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
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
                                        image: AssetImage('img/pregunta.png'),
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            controller: pesoController,
                            decoration: InputDecoration(
                              hintText: 'kg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 310,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Talla',
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
                                              'Información sobre la talla'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Visualice el siguiente vídeo para obtener más información sobre cómo medir la estatura:'),
                                              GestureDetector(
                                                onTap: () {
                                                  _launchURL(urls[
                                                      1]); // Llama a la función para abrir el enlace
                                                },
                                                child: Text(
                                                  'Vimeo - Talla',
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255,
                                                        4,
                                                        60,
                                                        105), // Estilo para que parezca un enlace
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
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
                                        image: AssetImage('img/pregunta.png'),
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            controller: tallaController,
                            decoration: InputDecoration(
                              hintText: 'cm',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 310,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Perímetro craneal',
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
                                              'Información sobre el perímetro craneal'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Use una cinta métrica que no se pueda estirar. Rodee firmemente la cabeza con la cinta métrica alrededor de la circunferencia más ancha posible. La parte más ancha de la frente encima de las cejas, por encima de las orejas, la parte más prominente de la nuca. Visualice el siguiente vídeo para obtener más información sobre cómo medir el perímetro craneal:'),
                                              GestureDetector(
                                                onTap: () {
                                                  _launchURL(urls[
                                                      2]); // Llama a la función para abrir el enlace
                                                },
                                                child: Text(
                                                  'Vimeo - Perímetro Craneal',
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255,
                                                        4,
                                                        60,
                                                        105), // Estilo para que parezca un enlace
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
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
                                        image: AssetImage('img/pregunta.png'),
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            controller: perimetroCranealController,
                            decoration: InputDecoration(
                              hintText: 'cm',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 310,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Distancia palpebral',
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
                                              'Información sobre la distancia palpebral'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Visualice el siguiente vídeo para obtener más información sobre cómo medir la distancia palpebral:'),
                                              GestureDetector(
                                                onTap: () {
                                                  _launchURL(urls[
                                                      3]); // Llama a la función para abrir el enlace
                                                },
                                                child: Text(
                                                  'Vimeo - Distancia Palpebral',
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255,
                                                        4,
                                                        60,
                                                        105), // Estilo para que parezca un enlace
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
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
                                        image: AssetImage('img/pregunta.png'),
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            controller: distanciaPalpebralController,
                            decoration: InputDecoration(
                              hintText: 'mm',
                            ),
                          ),
                        ),
                      ],
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
                      // Manejar la acción de Siguiente
                      _saveTextFieldsToPrefs();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Analisis5UI(),
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

  // Guardar datos introducidos en Shared Preferences
  _saveTextFieldsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(pesoText, pesoController.text);
    prefs.setString(tallaText, tallaController.text);
    prefs.setString(perimetroCranealText, perimetroCranealController.text);
    prefs.setString(distanciaPalpebralText, distanciaPalpebralController.text);
  }

  // Cargar datos introducidos desde Shared Preferences
  _loadTextFieldsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      pesoController.text = prefs.getString(pesoText) ?? '';
      tallaController.text = prefs.getString(tallaText) ?? '';
      perimetroCranealController.text =
          prefs.getString(perimetroCranealText) ?? '';
      distanciaPalpebralController.text =
          prefs.getString(distanciaPalpebralText) ?? '';
    });
  }
}
