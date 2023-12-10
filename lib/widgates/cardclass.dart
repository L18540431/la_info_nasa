import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget image; // Agregamos un Widget para la imagen

  const MyCard({
    required this.title,
    required this.icon,
    required this.image, // Asegúrate de recibir la imagen como parámetro
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: image, // Mostramos la imagen aquí
          ),
        ],
      ),
    );
  }
}
