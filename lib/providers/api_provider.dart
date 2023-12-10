import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<Map<String, dynamic>> fetchAPOD() async {
    final apiKey = 'vDCnLVJGC6fBjhAwUGEEKJ0YvNn2Xt5DCfBw1s58';
    final url = Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        print('Error al obtener la imagen del día: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      print('Excepción al obtener la imagen del día: $e');
      return {};
    }
  }
}
