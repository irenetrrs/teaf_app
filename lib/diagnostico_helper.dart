import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:teaf_app/app_localizations.dart';
import 'patients_ui.dart';
import 'app_language_provider.dart';
import 'package:provider/provider.dart';

class DiagnosticoHelper {
  late AppLanguageProvider appLanguage;
  List<Map<String, dynamic>> maleHeightData = [];
  List<Map<String, dynamic>> femaleHeightData = [];
  List<Map<String, dynamic>> maleWeightData = [];
  List<Map<String, dynamic>> femaleWeightData = [];
  List<Map<String, dynamic>> distanciaPalpebralData = [];
  List<Map<String, dynamic>> perimetroCranealHombresData = [];
  List<Map<String, dynamic>> perimetroCranealMujeresData = [];
  int percentiles = 0;
  int rasgos = 0;

  DiagnosticoHelper() {
    // Llama al método loadData() en el constructor para cargar los datos al iniciar la instancia
    loadData();
  }

//////////////////Redondear la entrada del usuario///////////////////////////////////////////////
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

///////////////////////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////Cargar las tablas///////////////////////////////////////////////////
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
    } catch (e) {
      print("Error loading CSV: $e");
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////
////////////////FUNCIÓN PARA OBTENER LA ALTURA A PARTIR DEL CSV//////////////////
  String? getHeightFromAgeAndGender(String age, String gender) {
    double userAge = double.tryParse(age) ?? -1;
    if (userAge > 240) {
      userAge = 240;
    }
    // Redondear la edad al siguiente más cercano por arriba que sea .5
    num roundedAge = roundToNearestHalf(userAge);
    if (roundedAge >= 240.5) {
      roundedAge = 240;
    }
    //print('Edad getHeight $roundedAge');
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
    if (userAge > 240) {
      userAge = 240;
    }
    // Redondear la edad al siguiente más cercano por arriba que sea .5
    num roundedAge = roundToNearestHalf(userAge);
    print('Edad getWeight $roundedAge');
    if (roundedAge >= 240.5) {
      roundedAge = 240;
    }
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
    if (userAge > 168) {
      userAge = 168;
    }
    for (var row in distanciaPalpebralData) {
      String rowAgeString = row['Age (in months)'].toString();
      double rowAge = double.tryParse(rowAgeString) ?? -1;
      if (rowAge == userAge) {
        return row['Length (in milimeters)'].toString();
      }
    }

    return null;
  }
//////////////////////////////////////////////////////////////////////////////

///////////////////FUNCIÓN PARA OBTENER EL PER CRANEAL A PARTIR DEL CSV//////////////////
  String? getPerimeterFromAgeAndGender(String age, String gender) {
    double userAge = double.tryParse(age) ?? -1;
    if (userAge > 240) {
      userAge = 240;
    }
    List<Map<String, dynamic>> selectedData = (gender.toLowerCase() == 'male')
        ? perimetroCranealHombresData
        : perimetroCranealMujeresData;
    //print(selectedData);
    for (var row in selectedData) {
      String rowAgeString = row['Age (in months)'].toString();
      double rowAge = double.tryParse(rowAgeString) ?? -1;
      if (rowAge == userAge) {
        return row['Head Circumference (in milimetres)'].toString();
      }
    }

    return null;
  }

///////////////////////////////////////////////////////////////////////////
  ///
//////////////////////Obtener las respuestas del usuario///////////////////////////////
  static Future<void> resetPreferences(BuildContext context) async {
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

  //malformaciones
  static Future<bool> getMalformaciones() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preguntaMalformaciones-botonmalformacionessi') ??
        false;
  }
  ////////////////////////////////////////////////////////////////
  ///
  ////////////////////Método para obtener las respuestas//////////

  Future<String> diagnostico(BuildContext context) async {
    // Obtener las respuestas del usuario
    String edad = await getEdadText();
    bool adoptado = await getAdoptadoButtonState();
    bool tiempoAcogida = await getTiempoAcogidaButtonState();
    bool dominiosBoton0 = await getDominiosButtonState(0);
    bool dominiosBoton1 = await getDominiosButtonState(1);
    bool dominiosBoton2 = await getDominiosButtonState(2);
    bool alcohol = await getAlcoholButtonState();
    bool genero = await getGeneroButtonState();
    String peso = await getPesoText();
    String talla = await getTallaText();
    String perimetroCraneal = await getPerimetroCranealText();
    String distanciaPalpebral = await getDistanciaPalpebralText();
    int filtrum = await getFiltrum();
    int labioSuperior = await getLabioSuperior();
    bool anomalias = await getAnomalias();
    bool recurrente = await getRecurrente();
    bool malformaciones = await getMalformaciones();

    String generoPaciente = getGeneroPaciente(genero);
    double pesoPaciente = double.tryParse(peso) ?? -1;
    double pesoTabla =
        await obtenerPesoCorrespondiente(edad, generoPaciente) ?? -1;
    double tallaPaciente = double.tryParse(talla) ?? -1;
    double tallaTabla =
        await obtenerTallaCorrespondiente(edad, generoPaciente) ?? -1;
    double distanciaPalpebralPaciente =
        double.tryParse(distanciaPalpebral) ?? -1;
    double distanciaPalpebralTabla =
        await obtenerDistanciaPalpebralCorrespondiente(edad) ?? -1;
    double perimetroCranealPaciente = double.tryParse(perimetroCraneal) ?? -1;
    double perimetroCranealTabla =
        await obtenerPerimetroCranealCorrespondiente(edad, generoPaciente) ??
            -1;
//esto creo que lo puedo sacar a otra funcion
    int dominios = 0;
    if (dominiosBoton0) {
      dominios = 0;
    }
    if (dominiosBoton1) {
      dominios = 1;
    }
    if (dominiosBoton2) {
      dominios = 2;
    }
    if (filtrum >= 4) {
      rasgos += 1;
    }
    if (labioSuperior >= 4) {
      rasgos += 1;
    }
    if (distanciaPalpebralPaciente <= distanciaPalpebralTabla) {
      rasgos += 1;
    }

    print('dominios $dominios');
    print('rasgos $rasgos');
    print(generoPaciente);
    print(pesoPaciente);
    print(pesoTabla);
    print(tallaPaciente);
    print(tallaTabla);
    print(distanciaPalpebralPaciente);
    print(distanciaPalpebralTabla);
    print(perimetroCranealPaciente);
    print(perimetroCranealTabla);

    String diagnostico = realizarDiagnostico(
        context,
        adoptado,
        tiempoAcogida,
        alcohol,
        rasgos,
        dominios,
        pesoPaciente,
        tallaPaciente,
        perimetroCranealPaciente,
        filtrum,
        labioSuperior,
        recurrente,
        anomalias,
        percentiles,
        pesoTabla,
        tallaTabla,
        distanciaPalpebralTabla,
        perimetroCranealTabla,
        malformaciones);
    
    return diagnostico;
  }

// Convertir el valor booleano a una cadena 'male' o 'female'
  String getGeneroPaciente(bool genero) {
    return genero ? 'male' : 'female';
  }

///////////////////////DATOS TABLAS/////////////////////////////////////////////////////////
// Obtener la altura según la edad y el género del paciente
  Future<double?> obtenerTallaCorrespondiente(
      String edad, String generoPaciente) async {
    String? tallaCorrespondienteString =
        getHeightFromAgeAndGender(edad, generoPaciente);
    print("talla tabla: $tallaCorrespondienteString");
    return tallaCorrespondienteString != null
        ? double.tryParse(tallaCorrespondienteString)
        : null;
  }

// Obtener el peso según la edad y el género del paciente
  Future<double?> obtenerPesoCorrespondiente(
      String edad, String generoPaciente) async {
    print(edad);
    String? pesoCorrespondienteString =
        getWeightFromAgeAndGender(edad, generoPaciente);
    print("peso tabla: $pesoCorrespondienteString");
    return pesoCorrespondienteString != null
        ? double.tryParse(pesoCorrespondienteString)
        : null;
  }

// Obtener la distancia palpebral según la edad del paciente
  Future<double?> obtenerDistanciaPalpebralCorrespondiente(String edad) async {
    String? distanciaPalpebralCorrespondienteString = getDistanceFromAge(edad);
    print("distancia tabla: $distanciaPalpebralCorrespondienteString");
    return distanciaPalpebralCorrespondienteString != null
        ? double.tryParse(distanciaPalpebralCorrespondienteString)
        : null;
  }

// Obtener el perímetro craneal según la edad y el género del paciente
  Future<double?> obtenerPerimetroCranealCorrespondiente(
      String edad, String generoPaciente) async {
    String? perimetroCorrespondienteString =
        getPerimeterFromAgeAndGender(edad, generoPaciente);
    return perimetroCorrespondienteString != null
        ? double.tryParse(perimetroCorrespondienteString)
        : null;
  }

  Future<bool> verificarPerimetroCraneal(
      String perimetroUsuario, String edad, String generoPaciente) async {
    // Obtener el perimetro craneal de la tabla
    double perimetroTabla =
        await obtenerPerimetroCranealCorrespondiente(edad, generoPaciente) ??
            -1;

    // Convertir el perimetro craneal del usuario a un valor numérico
    double perimetroUsuarioNum = double.tryParse(perimetroUsuario) ?? 0;
    print('perimetro en la funcion: $perimetroUsuarioNum');
    print('perimetro tabla: $perimetroTabla');
    // Comparar el perimetro craneal del usuario con el de la tabla
    return perimetroUsuarioNum < perimetroTabla;
  }

///////////////////////////////////////////////////////////////////////////////////////////////////
  // Función para realizar el diagnóstico basado en las respuestas obtenidas
  String realizarDiagnostico(
    BuildContext context,
    bool adoptado,
    bool tiempoAcogida,
    bool alcohol,
    int rasgos,
    int dominios,
    double pesoPaciente,
    double tallaPaciente,
    double perimetroCranealPaciente,
    int filtrum,
    int labioSuperior,
    bool recurrente,
    bool anomalias,
    int percentiles,
    double pesoTabla,
    double tallaTabla,
    double distanciaPalpebralTabla,
    double perimetroCranealTabla,
    bool malformaciones,
  ) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    if (adoptado && tiempoAcogida) {
      return 'Incomplete';
    } else {
      if (alcohol) {
        if (rasgos >= 2) {
          if (dominios >= 1) {
            if ((pesoPaciente <= pesoTabla || tallaPaciente <= tallaTabla) &&
                (perimetroCranealPaciente <= perimetroCranealTabla ||
                    percentiles >= 1)) {
              return localizations.translate('SAF')!;
            } else {
              return localizations.translate('pFAS')!;
            }
          } else {
            if (malformaciones) {
              return 'ARBD';
            } else {
              return localizations.translate('NOTEAF')!;
            }
          }
        } else {
          if (dominios < 2) {
            if (malformaciones) {
              return 'ARBD';
            } else {
              return localizations.translate('NOTEAF')!;
            }
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
              return localizations.translate('NOTEAF')!;
            } else {
              return localizations.translate('pFAS')!;
            }
          } else {
            return localizations.translate('NOTEAF')!;
          }
        } else {
          return localizations.translate('NOTEAF')!;
        }
      }
    }
  }

/////////////Para guardar la info del paciente
  Future<void> savePatient(BuildContext context, String name) async {
    // Obtener las respuestas del usuario
    String edad = await getEdadText();
    bool adoptado = await getAdoptadoButtonState();
    bool tiempoAcogida = await getTiempoAcogidaButtonState();
    bool alcohol = await getAlcoholButtonState();
    bool genero = await getGeneroButtonState();
    bool dominiosBoton0 = await getDominiosButtonState(0);
    bool dominiosBoton1 = await getDominiosButtonState(1);
    bool dominiosBoton2 = await getDominiosButtonState(2);
    String peso = await getPesoText();
    String talla = await getTallaText();
    String perimetroCraneal = await getPerimetroCranealText();
    String distanciaPalpebral = await getDistanciaPalpebralText();
    int filtrum = await getFiltrum();
    int labioSuperior = await getLabioSuperior();
    bool anomalias = await getAnomalias();
    bool recurrente = await getRecurrente();
    bool malformaciones = await getMalformaciones();
    // Almacenar el contexto en una variable local
    final BuildContext localContext = context;

    // Ejecutar la operación asíncrona
    // ignore: use_build_context_synchronously
    String resultadoDiagnostico = await diagnostico(localContext);

    double pesoPaciente = double.tryParse(peso) ?? -1;
    double tallaPaciente = double.tryParse(talla) ?? -1;
    double distanciaPalpebralPaciente =
        double.tryParse(distanciaPalpebral) ?? -1;
    double perimetroCranealPaciente = double.tryParse(perimetroCraneal) ?? -1;
    int dominios = 0;
    if (dominiosBoton0) {
      dominios = 0;
    }
    if (dominiosBoton1) {
      dominios = 1;
    }
    if (dominiosBoton2) {
      dominios = 2;
    }
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> patientList = prefs.getStringList('patient_list') ??
          []; // Obtener la lista de pacientes o una lista vacía
      patientList.add(name); // Agregar el nombre del paciente a la lista
      await prefs.setStringList('patient_list',
          patientList); // Guardar la lista de pacientes actualizada

      // Guardar los detalles del paciente usando el nombre como clave
      await prefs.setString('${name}_diagnostico', resultadoDiagnostico);
      await prefs.setString('${name}_age', edad);
      await prefs.setBool('${name}_gender', genero);
      await prefs.setBool('${name}_adoptado', adoptado);
      await prefs.setBool('${name}_tiempoacogida', tiempoAcogida);
      await prefs.setBool('${name}_alcohol', alcohol);
      await prefs.setDouble('${name}_peso', pesoPaciente);
      await prefs.setDouble('${name}_talla', tallaPaciente);
      await prefs.setDouble('${name}_perimetro', perimetroCranealPaciente);
      await prefs.setDouble('${name}_distancia', distanciaPalpebralPaciente);
      await prefs.setInt('${name}_dominios', dominios);
      await prefs.setInt('${name}_filtrum', filtrum);
      await prefs.setInt('${name}_labio', labioSuperior);
      await prefs.setBool('${name}_anomalias', anomalias);
      await prefs.setBool('${name}_recurrente', recurrente);
      await prefs.setBool('${name}_malformaciones', malformaciones);
    } catch (e) {
      print("Error al guardar paciente en SharedPreferences: $e");
    }

    // Navegar a la pantalla PatientUI después de guardar el paciente
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PatientUI()),
    );
  }

/////////////////////RASGOS Y DOMINIOS/////////////////////////////////
  Future<Map<String, int>> rasgosYDominios() async {
    // Obtener las respuestas del usuario
    String edad = await getEdadText();
    bool dominiosBoton0 = await getDominiosButtonState(0);
    bool dominiosBoton1 = await getDominiosButtonState(1);
    bool dominiosBoton2 = await getDominiosButtonState(2);
    String distanciaPalpebral = await getDistanciaPalpebralText();
    int filtrum = await getFiltrum();
    int labioSuperior = await getLabioSuperior();

    double distanciaPalpebralPaciente =
        double.tryParse(distanciaPalpebral) ?? -1;
    double distanciaPalpebralTabla =
        await obtenerDistanciaPalpebralCorrespondiente(edad) ?? -1;

    int rasgos = 0;
    if (filtrum >= 4) {
      rasgos += 1;
    }
    if (labioSuperior >= 4) {
      rasgos += 1;
    }
    if (distanciaPalpebralPaciente <= distanciaPalpebralTabla) {
      rasgos += 1;
    }

    int dominios = 0;
    if (dominiosBoton0) {
      dominios = 0;
    }
    if (dominiosBoton1) {
      dominios = 1;
    }
    if (dominiosBoton2) {
      dominios = 2;
    }

    return {'rasgos': rasgos, 'dominios': dominios};
  }

//////////////texto pdf
  static Future<String> diagnosticoPaciente(BuildContext context) async {
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
    bool anomalias = await getAnomalias();
    bool recurrente = await getRecurrente();

    // Construye el mensaje del popup
    String popupMessage =
        '${AppLocalizations.of(context)!.translate('age')}: $edadText ${AppLocalizations.of(context)!.translate('months')}\n'
        '${AppLocalizations.of(context)!.translate('gender')}: ${genero ? '${AppLocalizations.of(context)!.translate('male')}' : '${AppLocalizations.of(context)!.translate('female')}'}\n'
        '${AppLocalizations.of(context)!.translate('adopted')}: ${adoptado ? '${AppLocalizations.of(context)!.translate('yes')}' : '${AppLocalizations.of(context)!.translate('no')}'}\n'
        '${AppLocalizations.of(context)!.translate('receptionTime')}: ${tiempoAcogida ? '${AppLocalizations.of(context)!.translate('-24')}' : '${AppLocalizations.of(context)!.translate('+24')}'}\n'
        '${AppLocalizations.of(context)!.translate('domains')}: ${dominiosBoton0 ? '${AppLocalizations.of(context)!.translate('0')}' : ''}${dominiosBoton1 ? '${AppLocalizations.of(context)!.translate('1')}' : ''}${dominiosBoton2 ? '${AppLocalizations.of(context)!.translate('more2')}' : ''}\n'
        '${AppLocalizations.of(context)!.translate('alcohol')}: ${alcohol ? '${AppLocalizations.of(context)!.translate('yes')}' : '${AppLocalizations.of(context)!.translate('no')}'}\n'
        '${AppLocalizations.of(context)!.translate('ethnicity')}: ${etnia ? '${AppLocalizations.of(context)!.translate('caucasian')}' : '${AppLocalizations.of(context)!.translate('african')}'}\n'
        '${AppLocalizations.of(context)!.translate('weight')}: $pesoText kg\n'
        '${AppLocalizations.of(context)!.translate('height')}: $tallaText cm\n'
        '${AppLocalizations.of(context)!.translate('head_circumference')}: $perimetroCranealText cm\n'
        '${AppLocalizations.of(context)!.translate('palpebral_distance')}: $distanciaPalpebralText cm\n'
        '${AppLocalizations.of(context)!.translate('filtrum')}: $imagenseleccionadafiltrum \n'
        '${AppLocalizations.of(context)!.translate('upper_lip')}: $imagenseleccionadalabio \n'
        '${AppLocalizations.of(context)!.translate('cranial_malformations')}: ${anomalias ? '${AppLocalizations.of(context)!.translate('yes')}' : '${AppLocalizations.of(context)!.translate('na')}'}\n'
        '${AppLocalizations.of(context)!.translate('recurrent_fever')}: ${recurrente ? '${AppLocalizations.of(context)!.translate('yes')}' : '${AppLocalizations.of(context)!.translate('na')}'}\n';

    return popupMessage;
  }

//////////////menu desplegable
  Widget buildLanguageMenu(BuildContext context) {
    // Obtén una instancia de AppLanguageProvider
    AppLanguageProvider appLanguage = Provider.of<AppLanguageProvider>(context);

    // Función para construir cada elemento del menú desplegable
    PopupMenuItem<String> buildMenuItem(String language, String flagImage) {
      return PopupMenuItem<String>(
        value: language,
        child: Row(
          children: [
            Image.asset(
              flagImage,
              width: 30, // Ajusta el ancho de la bandera según sea necesario
              height: 30, // Ajusta la altura de la bandera según sea necesario
            ),
            SizedBox(width: 10), // Espacio entre la bandera y el texto
            Text(language),
          ],
        ),
      );
    }

    // Devuelve el menú desplegable
    return PopupMenuButton<String>(
      // Icono del lenguaje que al hacer clic muestra el menú desplegable
      icon: Icon(
        Icons.language,
        size: 30, // Cambia el tamaño del icono
        color: Colors.white, // Cambia el color del icono
      ),
      onSelected: (String selectedLanguage) {
        if (selectedLanguage == 'Español') {
          appLanguage.changeLanguage(const Locale("es"));
        } else {
          appLanguage.changeLanguage(const Locale("en"));
        }
        print('Selected language: $selectedLanguage');
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        buildMenuItem('Español',
            'img/esp.png'), // Ruta de la imagen de la bandera de Español
        buildMenuItem('English',
            'img/ing.png'), // Ruta de la imagen de la bandera de Inglés
      ],
    );
  }
}
