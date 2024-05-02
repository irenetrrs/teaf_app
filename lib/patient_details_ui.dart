import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientName;

  const PatientDetailsScreen({Key? key, required this.patientName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 152, 209),
      appBar: AppBar(
        title: Text('Detalles del paciente'),
      ),
      body: FutureBuilder<String>(
        future: _loadPatientDetails(patientName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(child: Text(snapshot.data!)),
                ),
                SizedBox(
                    height: 20), // Agrega un espacio entre el texto y el botón
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _deletePatient(context, patientName);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.red), // Cambia el color del botón a rojo
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Eliminar paciente', // Establece un texto fijo para el botón
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
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
                child: Text('No se encontraron detalles para el paciente'));
          }
        },
      ),
    );
  }

  Future<String> _loadPatientDetails(String patientName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Recupera los detalles del paciente asociados al nombre
    String? age = prefs.getString('${patientName}_age');
    String? gender = prefs.getString('${patientName}_gender');
    bool? adoptado = prefs.getBool('${patientName}_adoptado');
    bool? tiempoacogida = prefs.getBool('${patientName}_tiempoacogida');
    bool? alcohol = prefs.getBool('${patientName}_alcohol');
    double? peso = prefs.getDouble('${patientName}_peso');
    double? talla = prefs.getDouble('${patientName}_talla');
    double? perimetro = prefs.getDouble('${patientName}_perimetro');
    double? distancia = prefs.getDouble('${patientName}_distancia');
    int? filtrum = prefs.getInt('${patientName}_filtrum');
    int? labio = prefs.getInt('${patientName}_labio');

    // Construir una cadena con los detalles del paciente
    return '''
    Nombre: $patientName
    Edad: $age
    Género: $gender
    Adoptado: $adoptado
    Tiempo Acogida: $tiempoacogida
    Alcohol: $alcohol
    Peso: $peso
    Talla: $talla
    Perímetro Craneal: $perimetro
    Distancia Palpebral: $distancia
    Filtrum: $filtrum
    Labio Superior: $labio
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

    // Volver a la pantalla anterior después de eliminar al paciente
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
