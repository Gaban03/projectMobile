part of 'htpp_lib.dart';

Future<http.Response> fetchDados(){
  try{
    return http.get(Uri.parse('http://127.0.0.1:1880/dados'));
  }catch (e){
    print('Erro ao fazer requisição: $e');
    rethrow;
  }
}