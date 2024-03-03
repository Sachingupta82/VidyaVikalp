import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'http://192.168.1.155:8080'; //Enter IPV4 add from CMD



  Future<Response> saveRegister(String email, String username, String phone, String password) async {
  var res = await http.post(
    Uri.parse('$baseUrl/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'email': email,
        'username': username,
        'phone': phone,
        'password': password,
      },
    ),
  );
  return res;
}





}

