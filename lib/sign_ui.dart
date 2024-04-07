import 'package:flutter/material.dart';
import 'package:teaf_app/info_ui.dart';
import 'package:teaf_app/inicio_ui.dart';
import 'package:teaf_app/solucion_ui.dart';
import 'package:teaf_app/welcome_ui.dart';

class SignUI extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignUIState createState() => _SignUIState();
}

class _SignUIState extends State<SignUI> {
  bool showLoginFields = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001254),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Encabezado
            // Logo y título
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Acción a realizar cuando se hace clic en el botón
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoUI(),
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
            // Contenedor para los campos de inicio de sesión o registro
            Container(
              width: 315,
              height: 440,
              padding: EdgeInsets.all(20.0),
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botones para alternar entre iniciar sesión y registrarse
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showLoginFields = true;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              // Si showLoginFields es true, el botón está pulsado, de lo contrario, está desactivado
                              return showLoginFields
                                  ? Color.fromARGB(255, 15, 39, 127)
                                  : Color(0xCC5C6EAD);
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showLoginFields = false;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              // Si showLoginFields es false, el botón está pulsado, de lo contrario, está desactivado
                              return !showLoginFields
                                  ? Color.fromARGB(255, 15, 39, 127)
                                  : Color(0xCC5C6EAD);
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    ],
                  ),
                  SizedBox(height: 40),
                  // Texto correspondiente al tipo de acción (iniciar sesión o registrarse)
                  Text(
                    showLoginFields
                        ? 'Bienvenido a VisualTEAF'
                        : 'Regístrate en VisualTEAF',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      fontFamily: 'Inter',
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Campos de inicio de sesión o registro
                  if (showLoginFields) ...{
                    // Campos de inicio de sesión
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                      ),
                    ),
                  } else ...{
                    // Campos de registro
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre y apellidos',
                        labelStyle: TextStyle(
                            fontSize:
                                12), // Ajusta el tamaño de fuente del texto de etiqueta
                      ),
                      style: TextStyle(
                          fontSize:
                              14), // Ajusta el tamaño de fuente del texto de entrada
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nº Colegiado',
                        labelStyle: TextStyle(
                            fontSize:
                                12), // Ajusta el tamaño de fuente del texto de etiqueta
                      ),
                      style: TextStyle(
                          fontSize:
                              14), // Ajusta el tamaño de fuente del texto de entrada
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontSize:
                                12), // Ajusta el tamaño de fuente del texto de etiqueta
                      ),
                      style: TextStyle(
                          fontSize:
                              14), // Ajusta el tamaño de fuente del texto de entrada
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                            fontSize:
                                12), // Ajusta el tamaño de fuente del texto de etiqueta
                      ),
                      style: TextStyle(
                          fontSize:
                              14), // Ajusta el tamaño de fuente del texto de entrada
                    ),
                  },
                  SizedBox(height: 30),
                  // redireccionamiento cuando pulsamos 'iniciar sesion'
                  ElevatedButton(
                    onPressed: () {
                      if (showLoginFields) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InicioUI(),
                          ),
                        );
                      } else {
                        //redireccionamiento cuando pulsamos 'registrarse'
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SolucionUI(),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF001254)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      showLoginFields ? 'Iniciar sesión' : 'Registrarse',
                      style: TextStyle(
                        color: Color(0xFFDFDFDF),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Texto de "¿Se te olvidó la contraseña?"
                  Visibility(
                    visible: showLoginFields,
                    child: Opacity(
                      opacity: 0.60,
                      child: GestureDetector(
                        onTap: () {
                          // Aquí colocas la acción que deseas realizar cuando se haga clic en el texto
                          _showForgotPasswordDialog(context);
                        },
                        child: Text(
                          '¿Se te olvidó la contraseña?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//pop up para recuperar la contraseña
void _showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Recuperar Contraseña"),
        content: Text(
            "Aquí puedes agregar los campos para recuperar tu contraseña."),
        actions: <Widget>[
          TextButton(
            child: Text("Cerrar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
