part of 'htpp_lib.dart';

Future<Map<String, dynamic>> fetchDados() async {
  try {
    final response =
        await http.get(Uri.parse('http://192.168.0.28:1880/dados'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Erro ao carregar dados: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erro na requisição: $e');
  }
}
