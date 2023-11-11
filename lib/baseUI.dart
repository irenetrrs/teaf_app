import 'package:flutter/material.dart';
import 'package:teaf_app/welcomeUI.dart';
import 'package:teaf_app/signUI.dart';

class baseUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF001254),
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
