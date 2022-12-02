import 'package:app/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const Truckrs());
}

class Truckrs extends StatelessWidget {
  const Truckrs({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Truckrs',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignIn());
  }
}
