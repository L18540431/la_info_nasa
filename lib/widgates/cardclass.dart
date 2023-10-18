import 'package:flutter/material.dart';
import 'package:la_info_nasa/screens/detailsscreen.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  MyCard({required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
