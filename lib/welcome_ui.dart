import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'info_ui.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';

class WelcomeUI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeUIState createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {
  late AppLanguageProvider appLanguage;

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Fondo de la imagen
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/bck.jpg'),
                  fit: BoxFit.cover, // para que ocupe toda la pantalla
                ),
              ),
              child: Container(
                color: Color.fromARGB(200, 49, 61,
                    70), // 0x80 establece la opacidad a aproximadamente 50%
              ),
            ),
            // Cuadrado y texto más abajo en el centro
            Positioned(
              key: UniqueKey(), // Agregar key único
              top: 400,
              left: (MediaQuery.of(context).size.width - 310) /
                  2, // Centrar horizontalmente
              child: Container(
                width: 310,
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoUI()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xFFDFDFDF)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.translate('welcome')!,
                    style: TextStyle(
                      color: Color(0xFF262f36),
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            // Idiomas
            Positioned(
              key: UniqueKey(), // Agregar key único
              left: MediaQuery.of(context).size.width / 2 - 75,
              top: 500,
              child: SizedBox(
                width: 150,
                height: 50,
                child: Stack(
                  children: [
                    // Botón para seleccionar español
                    Positioned(
                      key: UniqueKey(), // Agregar key único
                      left: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          appLanguage.changeLanguage(const Locale("es"));
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/esp.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    // Botón para seleccionar inglés
                    Positioned(
                      key: UniqueKey(), // Agregar key único
                      left: 100,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          appLanguage.changeLanguage(const Locale("en"));
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/ing.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Texto "VisualTEAF" encima del fondo
            Positioned(
              key: UniqueKey(), // Agregar key único
              left: MediaQuery.of(context).size.width / 2 - 120,
              top: MediaQuery.of(context).size.height / 2 -
                  250, // Aquí se centra verticalmente
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.translate('appName')!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
