import "dart:convert";

import "package:bloc_task/constants/strings.dart";
import "package:http/http.dart" as http;

class AuthService {
  static Future<bool?> login(String email, String password) async {
    Uri loginUrl = Uri.parse("${baseUrl}user/signin");
    final response = await http.post(
      loginUrl,
      body: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      return true; // Registration successful
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<bool?> registeration(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}user/signup'));
    request.fields.addAll({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'location':
          '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkEmail(email);
    } else {
      checkEmail(email);

      print(response.reasonPhrase);
      print(await response.stream.bytesToString());
      print(response.statusCode);
      throw Exception('Failed to register');
    }
    return null;
  }
}

void checkEmail(String email) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST',
      Uri.parse('https://food-api-omega.vercel.app/api/v1/user/check-email'));
  request.body = json.encode({"email": email});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
