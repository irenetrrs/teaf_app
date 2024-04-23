import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'resumen_ui.dart';
import 'analisis5_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SolucionUI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SolucionUIState createState() => _SolucionUIState();
}

class _SolucionUIState extends State<SolucionUI> {
  List<Map<String, dynamic>> maleHeightData = [];
  List<Map<String, dynamic>> femaleHeightData = [];
  List<Map<String, dynamic>> maleWeightData = [];
  List<Map<String, dynamic>> femaleWeightData = [];
  List<Map<String, dynamic>> distanciaPalpebralData = [];
  List<Map<String, dynamic>> perimetroCranealHombresData = [];
  List<Map<String, dynamic>> perimetroCranealMujeresData = [];
  int percentiles = 0;
  int rasgos = 0;
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
    loadData();
  }

  double roundToNearestHalf(double number) {
    if (number % 1 == 0) {
      // Si el número es entero
      return number +
          0.5; // Redondear al siguiente más cercano por arriba que sea .5
    } else if (number == 24) {
      return 24;
    } else {
      return number; // Si el número ya tiene decimales, no es necesario redondear}
    }
  }

  double roundToNearest(double number) {
    if (number % 1 != 0) {
      // Si el número es entero
      return number +
          0.5; // Redondear al siguiente más cercano por arriba que sea .5
    } else {
      return number; // Si el número ya tiene decimales, no es necesario redondear}
    }
  }

  Future<void> loadData() async {
    try {
      String maleRawDataHeight =
          await rootBundle.loadString('data/maleheight.csv');
      String femaleRawDataHeight =
          await rootBundle.loadString('data/femaleheight.csv');
      String maleRawDataWeight =
          await rootBundle.loadString('data/maleweight.csv');
      String femaleRawDataWeight =
          await rootBundle.loadString('data/femaleweight.csv');
      String distanciaPalpebralRawData =
          await rootBundle.loadString('data/distanciapalpebral.csv');
      String perimetroCranealHombresRawData =
          await rootBundle.loadString('data/perimetrocranealhombres.csv');
      String perimetroCranealMujeresRawData =
          await rootBundle.loadString('data/perimetrocranealmujeres.csv');

      maleHeightData = _parseCSV(maleRawDataHeight);
      femaleHeightData = _parseCSV(femaleRawDataHeight);
      maleWeightData = _parseCSV(maleRawDataWeight);
      femaleWeightData = _parseCSV(femaleRawDataWeight);
      distanciaPalpebralData = _parseCSV(distanciaPalpebralRawData);
      perimetroCranealHombresData = _parseCSV(perimetroCranealHombresRawData);
      perimetroCranealMujeresData = _parseCSV(perimetroCranealMujeresRawData);
      //print(maleRawDataWeight);
      //print(femaleRawDataWeight);
      //print(maleRawDataHeight);
      //print(femaleRawDataHeight);
      setState(() {
        // Notify the UI that data has been loaded
      });
    } catch (e) {
      print("Error loading CSV: $e");
    }
  }

  List<Map<String, dynamic>> _parseCSV(String rawData) {
    List<List<dynamic>> csvList = CsvToListConverter().convert(rawData);
    List<String> headers =
        List<String>.from(csvList[0].map((e) => e.toString()));
    csvList.removeAt(0);

    List<Map<String, dynamic>> data = [];

    for (var row in csvList) {
      Map<String, dynamic> rowData = {};
      for (int i = 0; i < row.length; i++) {
        rowData[headers[i]] = row[i];
      }
      data.add(rowData);
    }

    return data;
  }

////////////////FUNCIÓN PARA OBTENER LA ALTURA A PARTIR DEL CSV//////////////////
  String? getHeightFromAgeAndGender(String age, String gender) {
    double userAge = double.tryParse(age) ?? -1;

    // Redondear la edad al siguiente más cercano por arriba que sea .5
    num roundedAge = roundToNearestHalf(userAge);
    //print('Edad redondeada $roundedAge');
    List<Map<String, dynamic>> selectedData =
        (gender.toLowerCase() == 'male') ? maleHeightData : femaleHeightData;
    //print(selectedData);
    for (var row in selectedData) {
      String rowAgeString = row['Age (in months)'].toString();
      double rowAge = double.tryParse(rowAgeString) ?? -1;
      if (rowAge == roundedAge) {
        return row['10th Percentile Stature (in centimeters)'].toString();
      }
    }

    return null;
  }
///////////////////////////////////////////////////////////////////////////

////////////////FUNCIÓN PARA OBTENER EL PESO A PARTIR DEL CSV//////////////////
  String? getWeightFromAgeAndGender(String age, String gender) {
    double userAge = double.tryParse(age) ?? -1;

    // Redondear la edad al siguiente más cercano por arriba que sea .5
    num roundedAge = roundToNearestHalf(userAge);
    //print('Edad redondeada $roundedAge');
    List<Map<String, dynamic>> selectedData =
        (gender.toLowerCase() == 'male') ? maleWeightData : femaleWeightData;
    //print(selectedData);
    for (var row in selectedData) {
      String rowAgeString = row['Age (in months)'].toString();
      double rowAge = double.tryParse(rowAgeString) ?? -1;
      if (rowAge == roundedAge) {
        return row['10th Percentile Weight (in kilograms)'].toString();
      }
    }

    return null;
  }
///////////////////////////////////////////////////////////////////////////

////////////////FUNCIÓN PARA OBTENER LA DIST PALPEBRAL A PARTIR DEL CSV//////////////////
  String? getDistanceFromAge(String age) {
    double userAge = double.tryParse(age) ?? -1;

    // Redondear la edad al siguiente más cercano por arriba que sea .5
    num roundedAge = roundToNearest(userAge);
    print('Edad redondeada $roundedAge');

    for (var row in distanciaPalpebralData) {
      String rowAgeString = row['Age (in months)'].toString();
      double rowAge = double.tryParse(rowAgeString) ?? -1;
      if (rowAge == roundedAge) {
        return row['Length (in milimeters)'].toString();
      }
    }

    return null;
  }
//////////////////////////////////////////////////////////////////////////////

///////////////////FUNCIÓN PARA OBTENER EL PER CRANEAL A PARTIR DEL CSV//////////////////
  String? getPerimeterFromAgeAndGender(String age, String gender) {
    double userAge = double.tryParse(age) ?? -1;

    // Redondear la edad al siguiente más cercano por arriba que sea .5
    num roundedAge = roundToNearest(userAge);
    //print('Edad redondeada $roundedAge');
    List<Map<String, dynamic>> selectedData = (gender.toLowerCase() == 'male')
        ? perimetroCranealHombresData
        : perimetroCranealMujeresData;
    //print(selectedData);
    for (var row in selectedData) {
      String rowAgeString = row['Age (in months)'].toString();
      double rowAge = double.tryParse(rowAgeString) ?? -1;
      if (rowAge == roundedAge) {
        return row['Head Circumference (in milimetres)'].toString();
      }
    }

    return null;
  }
///////////////////////////////////////////////////////////////////////////

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

// Método para obtener las respuestas y realizar el diagnóstico
  Future<String> diagnostico() async {
    // Obtener las respuestas
    String edad = await getEdadText();
    bool adoptado = await getAdoptadoButtonState();
    bool tiempoAcogida = await getTiempoAcogidaButtonState();
    int dominios = await getDominiosButtonState();
    bool alcohol = await getAlcoholButtonState();
    //bool etnia = await getEtniaButtonState();
    bool genero = await getGeneroButtonState();
    String peso = await getPesoText();
    String talla = await getTallaText();
    String perimetroCraneal = await getPerimetroCranealText();
    String distanciaPalpebral = await getDistanciaPalpebralText();
    int filtrum = await getFiltrum();
    int labioSuperior = await getLabioSuperior();
    bool anomalias = await getAnomalias();
    bool recurrente = await getRecurrente();

    // Convertir el valor booleano a una cadena 'male' o 'female'
    String generopaciente = genero ? 'male' : 'female';

    // Obtener la altura y el peso según la edad y el género del paciente
    String? tallaCorrespondienteString =
        getHeightFromAgeAndGender(edad, generopaciente);

    String? pesoCorrespondienteString =
        getWeightFromAgeAndGender(edad, generopaciente);

    double? pesoCorrespondiente;
    double? tallaCorrespondiente;
    if (pesoCorrespondienteString != null) {
      pesoCorrespondiente = double.tryParse(pesoCorrespondienteString);
    }
    if (tallaCorrespondienteString != null) {
      tallaCorrespondiente = double.tryParse(tallaCorrespondienteString);
    }

    // Obtener la dist palpebral segun la edad del paciente
    String? distanciaPalpebralCorrespondienteString = getDistanceFromAge(edad);
    double? distanciaPalpebralCorrespondiente;
    if (distanciaPalpebralCorrespondienteString != null) {
      distanciaPalpebralCorrespondiente =
          double.tryParse(distanciaPalpebralCorrespondienteString);
    }

    // Obtener el perimetro craneal segun la edad y el genero del paciente
    String? perimetroCorrespondienteString =
        getPerimeterFromAgeAndGender(edad, generopaciente);
    double? perimetroCorrespondiente;
    if (perimetroCorrespondienteString != null) {
      perimetroCorrespondiente =
          double.tryParse(perimetroCorrespondienteString);
    }

    double pesoPaciente = double.tryParse(peso) ?? -1;
    double pesoTabla = pesoCorrespondiente ?? -1;
    double tallaPaciente = double.tryParse(talla) ?? -1;
    double tallaTabla = tallaCorrespondiente ?? -1;
    double distanciaPalpebralPaciente =
        double.tryParse(distanciaPalpebral) ?? -1;
    double distanciaPalpebralTabla = distanciaPalpebralCorrespondiente ?? -1;
    double perimetroCranealPaciente = double.tryParse(perimetroCraneal) ?? -1;
    double perimetroCranealTabla = perimetroCorrespondiente ?? -1;

    print('pesoPaciente $pesoPaciente');
    print('pesoTabla $pesoTabla');
    print('tallaPaciente $tallaPaciente');
    print('tallaTabla $tallaTabla');
    print('distanciaPalpebralPaciente $distanciaPalpebralPaciente');
    print('distanciaPalpebralTabla $distanciaPalpebralTabla');
    print('perimetroCranealPaciente $perimetroCranealPaciente');
    print('perimetroCranealTabla $perimetroCranealTabla');

    //lógica con los percentiles -- pero creo que no hace falta sumarlos si no compararlos
    /*if (pesoPaciente <= pesoTabla) {
      percentiles += 1;
    }
    if (tallaPaciente <= tallaTabla) {
      percentiles += 1;
    }
    if (perimetroCranealPaciente <= perimetroCranealTabla) {
      percentiles += 1;
    }
    */
    if (recurrente = true) {
      percentiles += 1;
    }
    if (anomalias = true) {
      percentiles += 1;
    }

    print('percentiles $percentiles');
    //print(percentiles);
    //lógica rasgos
    if (filtrum >= 4 || labioSuperior >= 4) {
      rasgos += 1;
    }
    if (distanciaPalpebralPaciente <= distanciaPalpebralTabla) {
      rasgos += 1;
    }
    print('rasgos $rasgos');
    //print('Prueba altura ${getHeightFromAgeAndGender('60.5', 'male')}');
    //print('Prueba peso ${getWeightFromAgeAndGender('60.5', 'male')}');
    // Realizar el diagnóstico basado en las respuestas obtenidas
    if (adoptado && tiempoAcogida) {
      //si es adoptado y con un tiempo de acogida <24meses
      return 'Incomplete';
    } else {
      if (alcohol) {
        //si ha consumido alcohol
        if (rasgos >= 2) {
          if (dominios >= 1) {
            if ((pesoPaciente <= pesoTabla || tallaPaciente <= tallaTabla) &&
                (perimetroCranealPaciente <= perimetroCranealTabla ||
                    percentiles >= 1)) {
              return 'FAS';
            } else {
              return 'pFAS';
            }
          } else {
            //preguntas malformaciones
          }
        } else {
          if (dominios < 2) {
            //pregunta malformaciones
          } else {
            return 'ARND';
          }
        }
      } else {
        if (rasgos >= 2) {
          if (dominios >= 1) {
            if ((pesoPaciente <= pesoTabla || tallaPaciente <= tallaTabla) &&
                (perimetroCranealPaciente <= perimetroCranealTabla ||
                    percentiles >= 1)) {
              return 'FAS';
            } else if ((pesoPaciente > pesoTabla ||
                    tallaPaciente > tallaTabla) &&
                (perimetroCranealPaciente > perimetroCranealTabla ||
                    percentiles < 1)) {
              return 'NO FASD';
            } else {
              return 'pFAS';
            }
          }
        } else {
          return 'NO FASD';
        }
      }
    }
    return 'Error';
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
                        if (snapshot.data == 'Incomplete') {
                          circleColor = Colors.orange;
                        } else if (snapshot.data == 'FAS') {
                          circleColor = Colors.blue;
                        } else if (snapshot.data == 'pFAS') {
                          circleColor = Colors.green;
                        } else if (snapshot.data == 'ARND') {
                          circleColor = Colors.red;
                        } else if (snapshot.data == 'Error') {
                          circleColor = Colors.black;
                        } else if (snapshot.data == 'NO FASD') {
                          circleColor = Colors.grey;
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
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Visite el link para obtener más información sobre el diagnóstico:'),
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                  'https://cursoteaf.com/'); // Llama a la función para abrir el enlace
                            },
                            child: Text(
                              'Cursos TEAF',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 4, 60,
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
                                  Navigator.of(context).pop();
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
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {},
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
                  'Guardar paciente',
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
