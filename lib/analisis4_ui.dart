import 'package:flutter/material.dart';
import 'package:teaf_app/analisis3_ui.dart';
import 'analisis5_ui.dart';
import 'welcome_ui.dart';
import 'sign_ui.dart';

class Analisis4UI extends StatelessWidget {
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
                          builder: (context) => Analisis3UI(),
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
                height: 40,
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
                        width: 350,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Peso',
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'kg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                  'Talla',
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'cm',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                  'Perímetro craneal',
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'cm',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                  'Distancia palpebral',
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
                        Container(
                          width: 310.0, // Ancho del rectángulo
                          height: 30.0, // Alto del rectángulo
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Color gris del rectángulo
                            borderRadius: BorderRadius.circular(
                                20.0), // Bordes redondeados
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Espaciado interno
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'mm',
                            ),
                          ),
                        ),
                      ],
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
                          builder: (context) => Analisis5UI(),
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