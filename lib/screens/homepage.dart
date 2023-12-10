import 'package:flutter/material.dart';
import 'package:la_info_nasa/providers/api_provider.dart';
import 'package:la_info_nasa/screens/detailsscreen.dart';
import 'package:la_info_nasa/widgates/cardclass.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? apodTitle;
  String? apodDescription;
  String? apodImageUrl;

  final ApiProvider _apiProvider = ApiProvider(); // Instancia de la clase ApiProvider

  @override
  void initState() {
    super.initState();
    fetchAPOD();
  }

  Future<void> fetchAPOD() async {
    final data = await _apiProvider.fetchAPOD();
    setState(() {
      apodTitle = data['title'];
      apodDescription = data['explanation'];
      apodImageUrl = data['url'];
    });
  }

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
      child: apodImageUrl != null && apodTitle != null
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: apodTitle!,
                      description: apodDescription ?? "", // Asegúrate de pasar una cadena vacía si la descripción es nula
                      imageUrl: apodImageUrl!,
                    ),
                  ),
                );
              },
              child: MyCard(
                title: apodTitle!,
                icon: Icons.star,
                image: Image.network(
                  apodImageUrl!,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : CircularProgressIndicator(),
    ),
  );
}
}
