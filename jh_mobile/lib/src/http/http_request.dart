part of 'htpp_lib.dart';

Future<http.Response> fetchDados(){
  return http.get(Uri.parse('http:/http://127.0.0.1:1880/dadosFlutter'));
}