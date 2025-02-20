import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_login_app/constant/const.dart';

class ApiService {
  static const String _url =
      API_URL;

  static Future<Map<String, dynamic>> login(String username, String password) async {
    final Map<String, dynamic> requestBody = {
      "API_Body": [
        {
          "Unique_Id": "",
          "Pw": password,
        }
      ],
      "Api_Action": "GetUserData",
      "Company_Code": username,
    };

    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {
        "Status_Code": response.statusCode,
        "Message": "Error: ${response.reasonPhrase}"
      };
    }
  }
}
