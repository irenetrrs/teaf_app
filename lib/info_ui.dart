import 'package:flutter/material.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';

class InfoUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 152, 209),
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
                  'VisualTEAF',
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
                '¡Bienvenido!',
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
                      'Esta App es una herramienta para ayudar a los profesionales sanitarios a realizar la valoración de los criterios diagnósticos del Trastorno del Espectro Alcohólico Fetal (TEAF) de acuerdo con las guías internacionales (Hoyme, 2016).\n\nEsta App está realizada por VisualTEAF y el Grup de Recerca Infància i Entorn (GRIE), Hospital Clínic-Maternitat, ICGON, FCRB, IDIBAPS, BCNatal, RICORS (RD21/0012/0017), Barcelona.\n\n© Visual TEAF 2023',
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
                        Image.asset(
                          'img/ministerio.png', // Reemplaza con la ruta de tu primera imagen
                          width: 150, // Ancho de la primera imagen
                          height: 150, // Alto de la primera imagen
                        ),
                        Image.asset(
                          'img/uc3m.png', // Reemplaza con la ruta de tu segunda imagen
                          width: 150, // Ancho de la segunda imagen
                          height: 150, // Alto de la segunda imagen
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
                      AppLocalizations.of(context)!.translate('Back')!,
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
                          builder: (context) => SignUI(),
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
                      'Siguiente',
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
