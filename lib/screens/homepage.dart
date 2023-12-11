import 'package:flutter/material.dart';
import 'package:la_info_nasa/providers/api_provider.dart';
import 'package:la_info_nasa/screens/detailsscreen.dart';
import 'package:la_info_nasa/widgates/cardclass.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> newsList = [];
  bool isLoading = true;

  final ApiProvider _apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    fetchAPODs();
  }

  Future<void> fetchAPODs() async {
    final List<Map<String, dynamic>> data = await _apiProvider.fetchMultipleAPODs(5);

    List<Map<String, String>> convertedData = [];
    for (var element in data) {
      convertedData.add({
        'title': element['title'] ?? '',
        'url': element['url'] ?? '',
        'description': element['explanation'] ?? '', // Incluir la descripción
        // Puedes agregar otros campos si los hay y asegurarte de que sean String
      });
    }

    setState(() {
      newsList = convertedData;
      isLoading = false;
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
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(newsList[index]['description'] ?? 'No description'); 
                     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(
      screenTitle: newsList[index]['title'] ?? '',
      imageUrl: newsList[index]['url'] ?? '',
      description: newsList[index]['description'] ?? '',
    ),
  ),
);

                                        },
                    child: MyCard(
                      title: newsList[index]['title'] ?? '',
                      icon: Icons.star,
                      image: Image.network(
                        newsList[index]['url'] ?? '',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
