
import 'dart:convert';

String postToJson(LoginRequest data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LoginRequest {
  String email;
  String password;
  String device_platform;
  String device_token;
  String code;

  // LoginRequest(loginRequest) {
  //   _email = loginRequest['email'];
  //   _password = loginRequest['password'];
  //   _device_platform = loginRequest['device_platform'];
  //   _device_token = loginRequest['device_token'];
  //   _code = loginRequest['code'];
  // }
  
  LoginRequest({
    this.email,
    this.password,
    this.device_platform,
    this.device_token,
    this.code
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => new LoginRequest(
    email: json["email"],
    password: json["password"],
    device_platform: json["device_platform"],
    device_token: json["device_token"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "device_platform": device_platform,
    "device_token": device_token,
    "code": code
  };

}