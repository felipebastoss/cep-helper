import 'networking.dart';

const apiKey = 'AIzaSyBEEJWfRWsjaIGQeecFyUuiMO_KWWI7X-U';
const url = 'https://maps.googleapis.com/maps/api/geocode/json?address';

class LatLongData {
  Future<dynamic> getLatLongData(String cep) async {
    Uri uri = Uri.parse('$url=$cep&key=$apiKey');
    final result = await NetworkHelper(uri).getData();
    final latlong = result['results'][0]['geometry']['location'];
    return latlong;
  }
}
