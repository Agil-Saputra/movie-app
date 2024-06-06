import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MovieService {

  static Future<Map?> getMovies(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODZmOThhZGRmNDI2ZTY2NDZhYmVjOTIyZWE0YzEyYSIsInN1YiI6IjY1ZGZmZWJhMmQ1MzFhMDE2MmJlZWQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Olu0l33GvUVewdfwns7vtojGDyF6ksXL_pP2hjvRAZ8',
    });
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return responseJson;
    } else {
      return null;
    }
  }

}
