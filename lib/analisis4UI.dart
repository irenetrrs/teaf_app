import 'package:flutter/material.dart';
import 'analisis5UI.dart';

class analisis4UI extends StatelessWidget {
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
                          builder: (context) => analisis5UI(),
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
