import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Truckrs'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Bonjour XLQKJSDOIU7", style: TextStyle(color: Colors.black)),
                const Spacer(),
                Center(
                  child: congrats,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
