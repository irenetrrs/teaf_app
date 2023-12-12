import 'package:flutter/material.dart';
import 'analisis3_ui.dart';

class Analisis2UI extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Distribuye elementos a los extremos
                children: [
                  //Icono atrás
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/atras.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Logo y nombre en una Columna
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                  // Icono de apagado en Align a la derecha
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/off.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFDFDFDF)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromHeight(50.0)),
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
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFDFDFDF)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromHeight(50.0)),
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
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFDFDFDF)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromHeight(50.0)),
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
