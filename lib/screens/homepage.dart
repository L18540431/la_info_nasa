import 'package:flutter/material.dart';
import 'package:la_info_nasa/screens/detailsscreen.dart';
import 'package:la_info_nasa/widgates/cardclass.dart';
import 'package:la_info_nasa/widgates/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 119, 201),
        title: Row(
          children: [
            Text('La info'),
            Image.asset('assets/nasa_logo.png', width: 80.0, height: 80.0),
            SizedBox(width: 8.0),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            MyCard(
              title: "Título de la Tarjeta 1",
              description: "Descripción de la tarjeta 1.",
              icon: Icons.star,
            ),
            MyCard(
              title: "Título de la Tarjeta 1",
              description: "Descripción de la tarjeta 1.",
              icon: Icons.star,
              
            ),
            MyCard(
              title: "Título de la Tarjeta 2",
              description: "Descripción de la tarjeta 2.",
              icon: Icons.info,
            ),
            // Puedes agregar más instancias de MyCard según sea necesario
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
