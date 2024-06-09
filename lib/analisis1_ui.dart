import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inicio_ui.dart';
import 'analisis2_ui.dart';
import 'welcome_ui.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';
import 'diagnostico_helper.dart';

class Analisis1UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis1UIState createState() => _Analisis1UIState();
}

class _Analisis1UIState extends State<Analisis1UI> {
  late AppLanguageProvider appLanguage;

  final String? edadText = 'edad';
  final String adoptado = 'preguntaAdoptado';
  final String tiempoacogida = 'preguntaTiempoAcogida';
  bool botonSi = false;
  bool botonNo = false;
  bool botonmenor = false;
  bool botonmayor = false;
  bool isAdopted = false;
  TextEditingController edadController = TextEditingController();

  DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();

  @override
  void initState() {
    super.initState();
    _loadAdoptadoSelectionFromPrefs();
    _loadTiempoAcogidaSelectionFromPrefs();
    _loadTextFieldsFromPrefs();
    setState(() {
      botonSi = false;
      botonNo = false;
      botonmenor = false;
      botonmayor = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 133, 182),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
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
                              AppLocalizations.of(context)!
                                  .translate('appName')!,
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
                  InkWell(
                    child: Container(
                      child: diagnosticoHelper.buildLanguageMenu(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)!.translate('evaluation')!,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 50,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('age')!,
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
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            AppLocalizations.of(context)!
                                                .translate('infoAge')!,
                                          ),
                                          content: Text(
                                            AppLocalizations.of(context)!
                                                .translate('infoAgeText')!,
                                          ),
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
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  width: 303.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: TextField(
                                    controller: edadController,
                                    decoration: InputDecoration(
                                      hintText: AppLocalizations.of(context)!
                                          .translate('months')!,
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('adopted')!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        botonSi = true;
                                        botonNo = false;
                                        isAdopted = true;
                                      });
                                      _saveAdoptadoSelectionToPrefs(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonSi
                                          ? Colors.orange
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('yes')!,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 64, 64, 66),
                                        fontSize: 25,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        botonSi = false;
                                        botonNo = true;
                                        isAdopted = false;
                                      });
                                      _saveAdoptadoSelectionToPrefs(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonNo
                                          ? Colors.orange
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('no')!,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 64, 64, 66),
                                        fontSize: 25,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 303,
                        height: 103.02,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('receptionTime')!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: isAdopted
                                        ? () {
                                            setState(() {
                                              botonmenor = true;
                                              botonmayor = false;
                                            });
                                            _saveTiempoAcogidaSelectionToPrefs(
                                                true);
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonmenor
                                          ? Colors.orange
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('less24')!,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 64, 64, 66),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: isAdopted
                                        ? () {
                                            setState(() {
                                              botonmayor = true;
                                              botonmenor = false;
                                            });
                                            _saveTiempoAcogidaSelectionToPrefs(
                                                false);
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botonmayor
                                          ? Colors.orange
                                          : Color(0xFFDFDFDF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      fixedSize: Size.fromHeight(50.0),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('more24')!,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 64, 64, 66),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Inter',
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      int? edad;
                      String texto = edadController.text;

                      edad = int.tryParse(texto);
                      print(edad);
                      if (edadController.text.isNotEmpty &&
                          (botonSi || botonNo) &&
                          (botonmayor || botonmenor)) {
                        if (edad! >= 24) {
                          _saveTextFieldsToPrefs();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Analisis2UI(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: AppLocalizations.of(context)!
                                .translate('higher')!,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Color(0xFF262f36),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .translate('please')!,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Color(0xFF262f36),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Color(0xFF262f36)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.translate('next')!,
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
        ),
      ),
    );
  }

  _saveTextFieldsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(edadText!, edadController.text);
  }

  _loadTextFieldsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      edadController.text = prefs.getString(edadText!) ?? '';
    });
  }

  _saveAdoptadoSelectionToPrefs(bool botonSi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$adoptado-botonSi', botonSi);
  }

  _loadAdoptadoSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedAdoptadoSelection = prefs.getBool('$adoptado-botonSi');

    if (savedAdoptadoSelection != null) {
      setState(() {
        botonSi = savedAdoptadoSelection;
        botonNo = !savedAdoptadoSelection;
      });
    } else {
      setState(() {
        botonSi = false;
        botonNo = false;
      });
    }
  }

  _saveTiempoAcogidaSelectionToPrefs(bool botonmenor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$tiempoacogida-botonmenor', botonmenor);
  }

  _loadTiempoAcogidaSelectionFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedTiempoAcogidaSelection =
        prefs.getBool('$tiempoacogida-botonmenor');

    if (savedTiempoAcogidaSelection != null) {
      setState(() {
        botonmenor = savedTiempoAcogidaSelection;
        botonmayor = !savedTiempoAcogidaSelection;
      });
    } else {
      setState(() {
        botonmenor = false;
        botonmayor = false;
      });
    }
  }
}
