import 'package:flutter/material.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'welcome_ui.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async {
  Uri url0 = Uri.parse(url);
  // ignore: deprecated_member_use
  if (await canLaunch(url0.toString())) {
    // ignore: deprecated_member_use
    await launch(url0.toString());
  } else {
    throw 'Could not launch $url0';
  }
}

// ignore: must_be_immutable
class InfoUI extends StatelessWidget {
  late AppLanguageProvider appLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 133, 182),
      body: Stack(
        children: [
          //Logo
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('appName')!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          // Título
          Positioned(
            right: 0,
            left: 0,
            top: 100,
            child: Padding(
              padding: EdgeInsets.all(20.0), // Agrega un margen a su alrededor
              child: Text(
                AppLocalizations.of(context)!.translate('welcome')!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Texto de información dentro de un SingleChildScrollView
          Positioned(
            left: 0,
            right: 0,
            top: 180,
            bottom: 80,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('introText')!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // Espaciado uniforme
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Aquí colocas la lógica para abrir el enlace
                            // Por ejemplo, puedes usar la función launch de 'url_launcher' package
                            // Asegúrate de haber importado 'package:url_launcher/url_launcher.dart'
                            _launchURL('https://www.sanidad.gob.es/');
                          },
                          child: Image.asset(
                            'img/ministerio.png', // Reemplaza con la ruta de tu primera imagen
                            width: 150, // Ancho de la primera imagen
                            height: 150, // Alto de la primera imagen
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Aquí colocas la lógica para abrir el enlace
                            // Por ejemplo, puedes usar la función launch de 'url_launcher' package
                            // Asegúrate de haber importado 'package:url_launcher/url_launcher.dart'
                            _launchURL('https://www.uc3m.es/');
                          },
                          child: Image.asset(
                            'img/uc3m.png', // Reemplaza con la ruta de tu segunda imagen
                            width: 150, // Ancho de la segunda imagen
                            height: 150, // Alto de la segunda imagen
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // Fila con dos botones centrados y separados
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Manejar la acción de Atrás
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeUI(),
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
                      AppLocalizations.of(context)!.translate('back')!,
                      style: TextStyle(
                        color: Color(0xFF262f36),
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 170,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Manejar la acción de Atrás
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InicioUI(),
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
                      AppLocalizations.of(context)!.translate('next')!,
                      style: TextStyle(
                        color: Color(0xFF262f36),
                        fontSize: 27,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
