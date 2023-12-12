import 'package:flutter/material.dart';
import 'package:teaf_app/analisis1_ui.dart';
import 'analisis3_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

class Analisis2UI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Analisis2UIState createState() => _Analisis2UIState();
}

class _Analisis2UIState extends State<Analisis2UI> {
  // Variables para manejar el estado de los botones
  bool isButton0Selected = false;
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  bool isButtonSiSelected = false;
  bool isButtonNoSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF001254),
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
                          builder: (context) => Analisis1UI(
                            edadEnMeses: 0,
                            incrementarEdad: () {},
                            decrementarEdad: () {},
                          ),
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
                              'VisualTEAF',
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
                          builder: (context) => SignUI(),
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
                height: 50,
              ),
              Text(
                'Evaluación',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 50,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 310,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 310,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Número de dominios afectados',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('img/pregunta.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón "Sí"
                              setState(() {
                                isButton0Selected = true;
                                isButton1Selected = false;
                                isButton2Selected = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isButton0Selected
                                  ? Colors
                                      .orange // Color cuando está seleccionado
                                  : Color(0xFFDFDFDF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fixedSize: Size.fromHeight(50.0),
                            ),
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xFF68696C),
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
                              // Acción cuando se presiona el botón "No"
                              setState(() {
                                isButton0Selected = false;
                                isButton1Selected = true;
                                isButton2Selected = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: isButton1Selected
                                  ? Colors
                                      .orange // Color cuando está seleccionado
                                  : Color(0xFFDFDFDF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fixedSize: Size.fromHeight(50.0),
                            ),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Color(0xFF68696C),
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
                              // Acción cuando se presiona el botón "No"
                              setState(() {
                                isButton0Selected = false;
                                isButton1Selected = false;
                                isButton2Selected = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isButton2Selected
                                  ? Colors
                                      .orange // Color cuando está seleccionado
                                  : Color(0xFFDFDFDF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fixedSize: Size.fromHeight(50.0),
                            ),
                            child: Text(
                              '≥ 2',
                              style: TextStyle(
                                color: Color(0xFF68696C),
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
                    SizedBox(
                      height: 30,
                    ),
                    Positioned(
                      left: 3,
                      top: 164,
                      child: SizedBox(
                        width: 303,
                        child: Column(
                          children: [
                            Text(
                              'Consumo de alcohol en el embarazo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción cuando se presiona el botón "Sí"
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFDFDFDF)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                          Size.fromHeight(50.0)),
                                    ),
                                    child: Text(
                                      'Sí',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
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
                                      // Acción cuando se presiona el botón "No"
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFDFDFDF)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                          Size.fromHeight(50.0)),
                                    ),
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: Color(0xFF68696C),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Manejar la acción de Atrás
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Analisis3UI(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF001254)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Siguiente',
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
        ));
  }
}
