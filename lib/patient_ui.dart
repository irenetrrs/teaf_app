import 'package:flutter/material.dart';
import 'package:teaf_app/analisis2_ui.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'welcome_ui.dart';
import 'app_localizations.dart';

class PatientUI extends StatelessWidget {
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
                        // Puedes ajustar el tamaño del contenedor según tus necesidades
                        width: 50.0,
                        height: 50.0,
                      ),
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
              ],
            )));
  }
}
