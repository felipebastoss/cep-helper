import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  late final Uri url;

  Future<Map> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print("Deu erro na bagaça");
      throw 'Problem with the get request';
    }
  }
}
