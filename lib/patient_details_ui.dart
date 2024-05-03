import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teaf_app/patients_ui.dart';
import 'welcome_ui.dart';
import 'app_localizations.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientName;

  const PatientDetailsScreen({Key? key, required this.patientName})
      : super(key: key);

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
                // Botón de regreso
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientUI(),
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
                // Logo y nombre
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
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
              'Detalles',
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
            Expanded(
              child: FutureBuilder<String>(
                future: _loadPatientDetails(patientName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              snapshot.data!,
                              style: TextStyle(
                                color: Colors.white, // Color del texto
                                fontSize: 20, // Tamaño de fuente
                                fontFamily: 'Roboto', // Tipo de fuente
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 250,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                _deletePatient(context, patientName);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(
                                    0xFF001254)), // Color de fondo del botón
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Bordes redondeados
                                    side: BorderSide(
                                        color: Colors.white,
                                        width:
                                            2.0), // Borde blanco con ancho 2.0
                                  ),
                                ),
                              ),
                              child: Text(
                                'Eliminar',
                                style: TextStyle(
                                  color: Colors
                                      .white, // Color del texto en el botón
                                  fontSize:
                                      18, // Tamaño de fuente del texto en el botón
                                  fontFamily:
                                      'Roboto', // Tipo de fuente del texto en el botón
                                  fontWeight: FontWeight.bold, // Negrita
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(
                      child: Text(
                        'No se encontraron detalles para el paciente',
                        style: TextStyle(
                          color: Colors.black, // Color del texto
                          fontSize: 20, // Tamaño de fuente
                          fontFamily: 'Roboto', // Tipo de fuente
                          fontWeight: FontWeight.bold, // Negrita
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> _loadPatientDetails(String patientName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Recupera los detalles del paciente asociados al nombre
    String? age = prefs.getString('${patientName}_age');
    bool? gender = prefs.getBool('${patientName}_gender');
    bool? adoptado = prefs.getBool('${patientName}_adoptado');
    bool? tiempoacogida = prefs.getBool('${patientName}_tiempoacogida');
    bool? alcohol = prefs.getBool('${patientName}_alcohol');
    double? peso = prefs.getDouble('${patientName}_peso');
    double? talla = prefs.getDouble('${patientName}_talla');
    double? perimetro = prefs.getDouble('${patientName}_perimetro');
    double? distancia = prefs.getDouble('${patientName}_distancia');
    int? filtrum = prefs.getInt('${patientName}_filtrum');
    int? labio = prefs.getInt('${patientName}_labio');
    int? dominios = prefs.getInt('${patientName}_dominios');
    bool? anomalias = prefs.getBool('${patientName}_anomalias');
    bool? recurrente = prefs.getBool('${patientName}_recurrente');
    bool? malformaciones = prefs.getBool('${patientName}_malformaciones');
    // Construir una cadena con los detalles del paciente
    return '''
    Name: $patientName
    Age: $age
    Gender: $gender
    Adopted: $adoptado
    Tiempo Acogida: $tiempoacogida
    Alcohol: $alcohol
    Peso: $peso
    Talla: $talla
    Dominios: $dominios
    Perimetro: $perimetro
    Distancia: $distancia
    Filtrum: $filtrum
    Labio: $labio
    Anomalias: $anomalias
    Recurrente: $recurrente
    Malformaciones: $malformaciones
  ''';
  }

  Future<void> _deletePatient(BuildContext context, String patientName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> patientList = prefs.getStringList('patient_list') ?? [];
    patientList.remove(patientName);
    await prefs.setStringList('patient_list', patientList);
    await prefs.remove('${patientName}_age');
    await prefs.remove('${patientName}_gender');
    await prefs.remove('${patientName}_adoptado');
    await prefs.remove('${patientName}_tiempoacogida');
    await prefs.remove('${patientName}_alcohol');
    await prefs.remove('${patientName}_peso');
    await prefs.remove('${patientName}_talla');
    await prefs.remove('${patientName}_perimetro');
    await prefs.remove('${patientName}_distancia');
    await prefs.remove('${patientName}_filtrum');
    await prefs.remove('${patientName}_labio');
    await prefs.remove('${patientName}_dominios');
    await prefs.remove('${patientName}_anomalias');
    await prefs.remove('${patientName}_recurrente');
    await prefs.remove('${patientName}_malformaciones');

    // Volver a la pantalla anterior después de eliminar al paciente
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
