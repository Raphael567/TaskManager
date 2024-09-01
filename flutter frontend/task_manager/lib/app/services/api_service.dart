import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  //Requisição GET
  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url);
  }

  //Requisição POST
  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.post (
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body)
    );
  }

  //Requisição PUT
  Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.put (
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body)
    );
  }

  //Requisição DELETE
  Future<http.Response> delete(String endpoint) async{
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.delete(url);
  }
}