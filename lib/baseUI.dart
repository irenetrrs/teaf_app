import 'package:flutter/material.dart';
import 'package:teaf_app/welcomeUI.dart';
import 'package:teaf_app/signUI.dart';

class baseUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001254),
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
          Positioned(
            left: 3,
            top: 164,
            child: Container(
              width: 303,
              height: 103.02,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 43,
                    child: SizedBox(
                      width: 303,
                      height: 60.02,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 1,
                            child: SizedBox(
                              width: 136,
                              height: 59.02,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 136,
                                      height: 59.02,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFDFDFDF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 57,
                                    top: 15,
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
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 167,
                            top: 0,
                            child: Container(
                              width: 136,
                              height: 59.02,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 136,
                                      height: 59.02,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFDFDFDF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 51,
                                    top: 15,
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 279,
                    top: 1,
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
                  Positioned(
                    left: 3,
                    top: 0,
                    child: Text(
                      '¿Adoptado/Acogido?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/**TEXTO
 * Text(
      'Iniciar sesión',
      style: TextStyle(
      color: Color(0xFFDFDFDF),
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
       ),
      ),
 */

/** ESPACIO ENTRE ELEMENTOS
 * SizedBox(
                        height: 10,
                      ),
 */
/** BOTON PULSABLE
 * Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.0,
                            width: 130.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // Acción del botón
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF001254)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                  color: Color(0xFFDFDFDF),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 130.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // Acción del botón
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xCC5C6EAD)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Registrarse',
                                style: TextStyle(
                                  color: Color(0xFFDFDFDF),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
 */
