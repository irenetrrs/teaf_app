import 'package:flutter/material.dart';
import 'package:teaf_app/analisis1UI.dart';
import 'package:teaf_app/signUI.dart';
import 'package:teaf_app/baseUI.dart';
import 'analisis1.dart';

class inicioUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF001254),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Distribuye elementos a los extremos
                children: [
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
                height: 20,
              ),
              Text(
                'Irene Torres\n100429210',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
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
                        builder: (context) => Analisis1UI(
                          edadEnMeses: 0,
                          incrementarEdad: () {},
                          decrementarEdad: () {},
                        ),
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
                    'Empezar análisis',
                    style: TextStyle(
                      color: Color(0xFF001254),
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
                        builder: (context) => baseUI(),
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
                    'Pacientes',
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
        ));
  }
}
