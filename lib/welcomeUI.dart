import 'package:flutter/material.dart';
import 'package:teaf_app/infoUI.dart';

class WelcomeUI extends StatelessWidget {
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
                155, // centrar algo en la pantalla
            child: Container(
              width: 310, // Ancho del cuadrado
              height: 60, // Alto del cuadrado
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InfoUI()), // Reemplaza 'ThirdPage' con el nombre de tu nueva página
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFDFDFDF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Ajusta el valor según tu preferencia
                    ),
                  ),
                ),
                child: Text(
                  'Comenzar',
                  style: TextStyle(
                    color: Color(0xFF001254),
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // Idiomas
          Positioned(
            left: MediaQuery.of(context).size.width / 2 -
                75, // centrar algo en la pantalla
            top: 500,
            child: SizedBox(
              width: 150,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/esp.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/ing.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Texto "VisualTEAF" encima del fondo
          Positioned(
            left: MediaQuery.of(context).size.width / 2 -
                120, // centrar en el eje horizontal
            top: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
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
                    fontSize: 50,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
