import 'package:flutter/material.dart';
import 'analisis1_ui.dart';

class SignUI extends StatefulWidget {
  @override
  _SignUIState createState() => _SignUIState();
}

class _SignUIState extends State<SignUI> {
  bool showLoginFields = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001254),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Encabezado
              // Logo y título
              // Espacio
              SizedBox(height: 20),
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
                      ],
                    ),
                    SizedBox(height: 20),
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
                        ),
                      ),
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
                    },
                    SizedBox(height: 40),
                    // Botón de acción con los botones de inciar sesion y registrarse
                    ElevatedButton(
                      onPressed: () {
                        if (showLoginFields) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Analisis1UI(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Analisis1UI(),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF001254)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
