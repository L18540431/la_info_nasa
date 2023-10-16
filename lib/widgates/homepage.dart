import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 119, 201),
        title: Row(
          children: [
            Text('La info'),
            Image.asset('assets/nasa_logo.png', width: 80.0, height: 80.0), // 
            SizedBox(width: 8.0), // tiulo de la aplicación
          ],
        ),
      ),
      body: Center(
        child: Text('lugar de la info'),
      ),
    );
  }
}
