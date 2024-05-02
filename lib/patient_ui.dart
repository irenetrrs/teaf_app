import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientName;

  const PatientDetailsScreen({Key? key, required this.patientName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: FutureBuilder<String>(
        future: _loadPatientDetails(patientName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // Aquí puedes mostrar los detalles del paciente
            return Center(child: Text(snapshot.data!));
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
      Name: $patientName
      Age: $age
      Gender: $gender
      Adopted: $adoptado
      Tiempo Acogida: $tiempoacogida
      Alcohol: $alcohol
      Peso: $peso
      Talla: $talla
      Perimetro: $perimetro
      Distancia: $distancia
      Filtrum: $filtrum
      Labio: $labio
    ''';
  }
}
