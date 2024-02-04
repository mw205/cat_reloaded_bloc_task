import "dart:convert";

import "package:get/get.dart";
import "package:http/http.dart" as http;

class AuthService {
  Future<String?> login(String email, String password) async {
    Uri loginUrl =
        Uri.parse("https://food-api-omega.vercel.app/api/v1/user/signin");
    final response = await http.post(
      loginUrl,
      body: {"email": email, "password": password},
    );
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.back();
      print(responseBody);
      // String? token = responseBody['token'];
      return ("");
    } else {
      Get.back();
      return null;
    }
  }
}
