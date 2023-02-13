import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'screens/scanner.dart';
import "./mongodb.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 235, 0, 35),
        ),
      ),
      home: const MyHomePage(title: 'TEDx IARE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('TEDx IARE')),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
            children: [
              TextSpan(
                  text: 'TED',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0.0, -7.0),
                  child: const Text(
                    'x',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: ' IARE',
              ),
            ],
          ),
        ),
      ),
      body: Scanner(),
    );
  }
}
