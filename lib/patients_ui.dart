import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'patient_details_ui.dart'; // Importa la pantalla de detalles del paciente

class PatientUI extends StatefulWidget {
  @override
  _PatientUIState createState() => _PatientUIState();
}

class _PatientUIState extends State<PatientUI> {
  List<String> patientList = []; // Lista de pacientes

  @override
  void initState() {
    super.initState();
    _loadPatientList(); // Carga la lista de pacientes al iniciar
  }

  // Función para cargar la lista de pacientes
  Future<void> _loadPatientList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Actualiza el estado con la lista de pacientes guardados
      patientList = prefs.getStringList('patient_list') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pacientes'),
      ),
      body: ListView.builder(
        itemCount: patientList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patientList[index]), // Muestra el nombre del paciente
            onTap: () {
              // Navega a la pantalla de detalles del paciente cuando se toca un paciente
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetailsScreen(patientName: patientList[index]),
                ),
              ).then((value) {
                // Actualiza la lista de pacientes después de volver de la pantalla de detalles
                _loadPatientList();
              });
            },
          );
        },
      ),
    );
  }
}
