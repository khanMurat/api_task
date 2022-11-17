import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkManager {
  NetworkManager._init();
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  static const _authority = "exercises-by-api-ninjas.p.rapidapi.com";
  static const _path = "/v1/exercises";
  static const Map<String, String> _headers = {
    "x-rapidapi-key": "d10f470e43mshfe91143a8deb320p169fa6jsn96dbae273a4a",
    "x-rapidapi-host": "exercises-by-api-ninjas.p.rapidapi.com",
  };

  Future<dynamic> getData(
      {String? query, Map<String, dynamic>? queryParameters}) async {
    Uri uri = Uri.https(_authority, _path, queryParameters);

    http.Response response = await http.get(uri, headers: _headers);
    final data = convert.jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
