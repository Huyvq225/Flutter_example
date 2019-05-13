import 'dart:convert';

import 'package:efeedlink_demo/src/models/authentication.dart';
import 'package:efeedlink_demo/src/models/login_request.dart';
import 'package:efeedlink_demo/src/models/user.dart';
import 'package:http/http.dart' as http;

// final _baseUrl = "http://efeedlink.web.beesightsoft.com";
final _baseUrl = "https://spoutinfo.com";

  Future<Authentication> doLogin(LoginRequest request) async {
    // final response = await client.post("$_baseUrl/api/en/data-search/auth/sign-in");
    final response = await http.post('$_baseUrl/api/en/data-search/auth/sign-in', 
      headers: {
        'content-type' : 'application/json'
      },
      body: postToJson(request)
    );
    
    if (response.statusCode == 200) {
      return Authentication.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login Failed');
    }

    

  }

class AuthorizationApiProvider {
  // Client client = Client();
  // final _baseUrl = "http://efeedlink.web.beesightsoft.com";

  // Future<http.Response> doLogin(LoginRequest request) async {
  //   // final response = await client.post("$_baseUrl/api/en/data-search/auth/sign-in");
  //   final response = await http.post('$_baseUrl/api/en/data-search/auth/sign-in', 
  //     headers: {
  //       'content-type' : 'application/json'
  //     },
  //     body: postToJson(request)
  //   );
    
  //   return response;

  // }
}