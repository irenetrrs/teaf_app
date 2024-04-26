import 'package:flutter/material.dart';
import 'welcome_ui.dart';
import 'DiagnosticoHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeUI(),
      // Agregar el callback de post-frame para llamar a loadData()
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          DiagnosticoHelper diagnosticohelper = DiagnosticoHelper();
          diagnosticohelper.loadData();
        });
        return child!;
      },
    );
  }
}



/**class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [+
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
 
} **/
