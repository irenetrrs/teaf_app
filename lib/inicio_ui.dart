import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teaf_app/info_ui.dart';
import 'welcome_ui.dart';
import 'analisis1_ui.dart';
import 'app_language_provider.dart';
import 'app_localizations.dart';
import 'patients_ui.dart';
import 'diagnostico_helper.dart';

// ignore: must_be_immutable
class InicioUI extends StatelessWidget {
  DiagnosticoHelper diagnosticoHelper = DiagnosticoHelper();
  late AppLanguageProvider appLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 133, 182),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoUI(),
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
              SizedBox(
                height: 80,
              ),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/user.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
                    backgroundColor: WidgetStateProperty.all(Color(0xFFDFDFDF)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF262f36), width: 2.0),
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
                        builder: (context) => PatientUI(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xFF262f36)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets
                                .zero, // Elimina el padding del diálogo
                            content: Container(
                              width: double
                                  .maxFinite, // Asegura que el diálogo ocupe todo el ancho posible
                              color: Colors.white, // Color blanco para el fondo
                              child: SingleChildScrollView(
                                // Añade scroll si el contenido es demasiado largo
                                padding: EdgeInsets.all(
                                    16.0), // Añade padding alrededor del texto
                                child: Text(
                                  '''Consejos de uso:
                                  
1. Se incluyen algunos enlaces a textos o videos explicativos: esquema diagnóstico del TEAF de Hoyme y símbolos “?” al lado de algunos apartados
2. Las cifras de los valores de las medidas físicas no admiten decimales
3. La página donde se muestran las imágenes de labio y filtrum incluye un enlace
4. En la página “Diagnóstico”:
    a. El botón “Editar” remite al principio de la evaluación en curso para revisar los datos introducidos
    b. El botón “Resumen”
    c. El botón “Inicia” remite a iniciar una nueva evaluación
5. En la página “Resumen”:
    a. El botón con un disquete deriva a guardar el paciente (de forma anónima)
    b. El botón con una flecha deriva a enviar el cuadro resumen al e-mail
    c. El botón con una papelera elimina los datos introducidos y lleva al principio de la App''',
                                  style: TextStyle(
                                    color: Colors.black, // Color del texto
                                    fontSize:
                                        14, // Tamaño más pequeño del texto
                                    fontWeight: FontWeight
                                        .normal, // Estilo normal del texto
                                    height: 1.5, // Espaciado entre líneas
                                  ),
                                  textAlign: TextAlign
                                      .left, // Alineación del texto a la izquierda
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Bordes redondeados del diálogo
                            ),
                          );
                        },
                      );
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
                      AppLocalizations.of(context)!.translate('guide')!,
                      style: TextStyle(
                        color: Colors.white,
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
}
