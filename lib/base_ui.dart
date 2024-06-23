// ignore: file_names
import 'package:flutter/material.dart';

class BaseUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 60, 152, 209),
        body: Stack(children: [
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
        ]));
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
                                backgroundColor: WidgetStateProperty.all(
                                    Color(0xFF001254)),
                                shape: WidgetStateProperty.all<
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
                                backgroundColor: WidgetStateProperty.all(
                                    Color(0xCC5C6EAD)),
                                shape: WidgetStateProperty.all<
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
