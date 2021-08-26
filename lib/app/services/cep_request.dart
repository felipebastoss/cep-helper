import 'networking.dart';

const url = 'https://viacep.com.br/ws';

class CepData {
  Future<Map> getCepData(String cep) async {
    Uri uri = Uri.parse('$url/$cep/json/');
    final result = await NetworkHelper(uri).getData();
    return result;
  }
}
