import 'package:flutter/material.dart';

class welcomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              color: Color.fromARGB(197, 2, 0,
                  67), // 0x80 establece la opacidad a aproximadamente 50%
            ),
          ),
          // Cuadrado y texto más abajo en el centro
          Positioned(
            top: 380,
            left: MediaQuery.of(context).size.width / 2 -
                155, //centrar algo en la pantalla
            child: Container(
              width: 310, // Ancho del cuadrado
              height: 60, // Alto del cuadrado
              decoration: BoxDecoration(
                color: Color(0xFFDFDFDF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Comenzar',
                  style: TextStyle(
                    color: Color(0xFF001254),
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
