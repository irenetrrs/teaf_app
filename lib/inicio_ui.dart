import 'package:flutter/material.dart';
import 'welcome_ui.dart';
import 'analisis1_ui.dart';
import 'base_ui.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';

// ignore: must_be_immutable
class InicioUI extends StatelessWidget {
  late AppLanguageProvider appLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 60, 152, 209),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  // Logo y nombre en una Columna
                  Column(
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
                  // Icono de apagado
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
                height: 80,
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
                        builder: (context) => Analisis1UI(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFDFDFDF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.translate('startAnalysis')!,
                    style: TextStyle(
                      color: Color(0xFF262f36),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                        builder: (context) => BaseUI(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF262f36)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.translate('patient')!,
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
        ));
  }
}
