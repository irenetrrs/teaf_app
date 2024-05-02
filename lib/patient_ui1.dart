import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'patient_ui.dart';

class PatientUI extends StatefulWidget {
  @override
  _PatientUIState createState() => _PatientUIState();
}

class _PatientUIState extends State<PatientUI> {
  List<String> patientList = [];

  @override
  void initState() {
    super.initState();
    _loadPatientList();
  }

  Future<void> _loadPatientList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      patientList = prefs.getStringList('patient_list') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
      ),
      body: ListView.builder(
        itemCount: patientList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patientList[index]),
            onTap: () {
              // Navegar a los detalles del paciente cuando se hace clic en el nombre
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PatientDetailsScreen(patientName: patientList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
