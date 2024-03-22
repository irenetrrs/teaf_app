import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'resumen_ui.dart';
import 'analisis5_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

// ignore: must_be_immutable
class SolucionUI extends StatelessWidget {
  Future<void> resetPreferences(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

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
  static Future<int> getDominiosButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('preguntaDominios-selectedIndex') ?? -1;
  }

  static String getDominiosText(int index) {
    switch (index) {
      case 0:
        return '0';
      case 1:
        return '1';
      case 2:
        return '≥ 2';
      default:
        return 'No seleccionado';
    }
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

// Método para obtener las respuestas y realizar el diagnóstico
  Future<String> diagnostico() async {
    // Obtener las respuestas
    String edad = await getEdadText();
    bool adoptado = await getAdoptadoButtonState();
    bool tiempoAcogida = await getTiempoAcogidaButtonState();
    int dominios = await getDominiosButtonState();
    bool alcohol = await getAlcoholButtonState();
    bool etnia = await getEtniaButtonState();
    bool genero = await getGeneroButtonState();
    String peso = await getPesoText();
    String talla = await getTallaText();
    String perimetroCraneal = await getPerimetroCranealText();
    String distanciaPalpebral = await getDistanciaPalpebralText();
    int filtrum = await getFiltrum();
    int labioSuperior = await getLabioSuperior();

    // Realizar el diagnóstico basado en las respuestas obtenidas
    if (tiempoAcogida) {
      // si el tiempo de acogida es <24meses
      return 'INCOMPLETO';
    } else if (!alcohol) {
      // si no ha bebido alcohol
      return 'NO FASD';
    } else if (dominios >= 2) {
      //si los dominios son >2
      return 'ARND';
    } else {
      return 'ARBD';
    }
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
                Expanded(
                  child: Column(
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
              'Diagnóstico',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 200.0, // Diámetro del círculo
              height: 200.0, // Diámetro del círculo
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Forma circular
              ),
              child: Center(
                child: FutureBuilder<String>(
                  future:
                      diagnostico(), // Llama a la función diagnostico() para obtener el Future<String>
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Si el Future está en espera, muestra un indicador de carga
                      return CircularProgressIndicator();
                    } else {
                      if (snapshot.hasError) {
                        // Si ocurre un error, muestra un mensaje de error
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Si la llamada al Future es exitosa, muestra el texto resultante
                        // y un círculo de color correspondiente al resultado del diagnóstico
                        Color circleColor = Colors.transparent;
                        if (snapshot.data == 'INCOMPLETO') {
                          circleColor = Colors.orange;
                        } else if (snapshot.data == 'NO FASD') {
                          circleColor = Colors.blue;
                        } else if (snapshot.data == 'ARND') {
                          circleColor = Colors.green;
                        } else if (snapshot.data == 'ARBD') {
                          circleColor = Colors.red;
                        }

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: circleColor,
                              ),
                            ),
                            Text(
                              snapshot.data ?? 'Diagnóstico no disponible',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        );
                      }
                    }
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Mostrar el pop-up al tocar la imagen
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Información sobre el resultado'),
                      content: Text(
                          'Más información sobre el diagnóstico en /link/'),
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
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Manejar la acción de Atrás
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SolucionUI(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF001254)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Descargar datos',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Manejar la acción de Atrás
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResumenUI(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF001254)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Resumen',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Volver a Inicio'),
                        content: Text(
                            'Si vuelve a la página de Inicio, se eliminarán los datos introducidos durante el diagnóstico. ¿Estás seguro de volver a Inicio?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Cerrar el cuadro de diálogo
                            },
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Resetear los valores y cerrar el cuadro de diálogo
                              resetPreferences(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InicioUI(),
                                ),
                              );
                              // Puedes navegar a la pantalla de inicio o hacer cualquier otra acción necesaria después de resetear
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                  // Manejar la acción de Atrás
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF001254)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Inicio',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
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
