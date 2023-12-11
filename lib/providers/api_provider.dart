import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<Map<String, dynamic>>> fetchMultipleAPODs(int count) async {
    final apiKey = 'vDCnLVJGC6fBjhAwUGEEKJ0YvNn2Xt5DCfBw1s58';
    final url = Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=$count');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> dataList = json.decode(response.body);
        final List<Map<String, dynamic>> apodList = List<Map<String, dynamic>>.from(dataList.map((data) {
          return {
            'title': data['title'],
            'url': data['url'],
            // Puedes agregar más campos según lo que necesites
          };
        }));
        return apodList;
      } else {
        print('Error al obtener las imágenes del día: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Excepción al obtener las imágenes del día: $e');
      return [];
    }
  }
}
