
import 'dart:io';

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("LaInfoNASA powered by Agustin Morales 🤠"),
            accountEmail: Text("l18540431@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/nasa_logo.png'), // Puedes personalizar la imagen
            ),
          ),
          ListTile(
            title: Text('Opción 1'),
            onTap: () {
             },
          ),
          ListTile(
            title: Text('Salir'),
            onTap: () {
              exit(0);
              },
          ),
         //add
        ],
      ),
    );
  }
}