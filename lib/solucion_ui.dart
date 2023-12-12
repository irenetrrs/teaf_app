import 'package:flutter/material.dart';
import 'resumen_ui.dart';

class SolucionUI extends StatelessWidget {
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
              'Diagnóstico',
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
            Container(
              width: 200.0, // Diámetro del círculo
              height: 200.0, // Diámetro del círculo
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Forma circular
                color: Colors.black, // Color del círculo
              ),
              child: Center(
                child: Text(
                  'TEF\npositivo',
                  style: TextStyle(
                    color: Colors.white, // Color del texto
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'img/pregunta.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
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
                      builder: (context) => SolucionUI(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF001254)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Descargar datos',
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
              height: 10,
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
                      builder: (context) => ResumenUI(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF001254)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Resumen',
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
              height: 10,
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
                      builder: (context) => SolucionUI(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF001254)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Inicio',
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
      ),
    );
  }
}
