import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'patient_details_ui.dart';
import 'inicio_ui.dart';
import 'welcome_ui.dart';
import 'app_localizations.dart';
import 'diagnostico_helper.dart';

class PatientUI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PatientUIState createState() => _PatientUIState();
}

class _PatientUIState extends State<PatientUI> {
  DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();
  List<Map<String, dynamic>> patients =
      []; // Lista de pacientes con diagnósticos

  @override
  void initState() {
    super.initState();
    _loadPatientList(); // Carga la lista de pacientes al iniciar
  }

  // Función para cargar la lista de pacientes
  Future<void> _loadPatientList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> patientList = prefs.getStringList('patient_list') ?? [];
    List<Map<String, dynamic>> loadedPatients = [];
    for (String name in patientList) {
      // Obtener el diagnóstico asociado con el paciente
      String diagnostico = prefs.getString('${name}_diagnostico') ?? '';
      loadedPatients.add({'name': name, 'diagnostico': diagnostico});
    }
    setState(() {
      // Actualizar el estado con la lista de pacientes y diagnósticos
      patients = loadedPatients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 133, 182),
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
                        builder: (context) => InicioUI(),
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
                    width: 30.0,
                    height: 30.0,
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
                // Icono de idiomas
                InkWell(
                  child: Container(
                    child: diagnosticoHelper.buildLanguageMenu(
                        context), // Llama a la función para construir el menú de idiomas
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              AppLocalizations.of(context)!.translate('patient')!,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 50,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: patients.map((patient) {
                    return Container(
                      width: 303, // Ancho del contenedor
                      margin: EdgeInsets.symmetric(
                          vertical: 10), // Espacio entre elementos
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 182, 223,
                            255), // Color de fondo del contenedor
                        borderRadius:
                            BorderRadius.circular(20), // Bordes redondeados
                      ),
                      child: ListTile(
                        title: Text(
                          patient['name'],
                          style: TextStyle(
                            color: Color(0xFF262f36),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          patient[
                              'diagnostico'], // Aquí se muestra el diagnóstico
                          style: TextStyle(
                            color: Color(0xFF262f36),
                            fontSize: 16,
                            fontFamily: 'Inter',
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientDetailsScreen(
                                patientName: patient['name'],
                              ),
                            ),
                          ).then((value) {
                            _loadPatientList();
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
