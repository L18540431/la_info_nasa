
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:la_info_nasa/screens/homepage.dart';

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
            title: Text('Catalogo'),
            onTap: () {
          
             },
          ),
          ListTile(
            title: Text('¿Que es la nasa?'),
            onTap: () {

             },
          ),
          ListTile(
            title: Text('Dirección'),
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