import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appcat/constants/constants.dart';

class ServiceApi {


  ServiceApi ();

  Future<List<dynamic>> getBreeds({int limit = 500, int page = 0}) async {
    final response = await http.get(
      Uri.parse('$baseUrl'+'breeds?limit=$limit&page=$page'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'
      },
    );

    if (response.statusCode == 200) {
      breeds = json.decode(response.body);
      return breeds;
    } else {
      throw Exception('Failed to load breeds');
    }
  }


}
