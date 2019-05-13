import 'package:efeedlink_demo/src/models/base_mode.dart';

class User extends BaseModel {
  int _id;
  String _email;
  String _username;
  String _last_login;
  String _created_at;
  String _update_at;
  String _phone_number;
  String _status;
  int _country_id;
  String _token;

  // _User(user) {
  //   _id = user['id'];
  //   _email = user['email'];
  //   _last_login = user['last_login'];
  //   _created_at = user['created_at'];
  //   _update_at = user['updated_at'];
  //   _phone_number = user['phone_number'];
  //   _status = user['status'];
  //   _country_id = user['country_id'];
  //   _token = user['token'];
  // }

  User.fromJson(Map<String, dynamic> parsedJson) : super.fromJson(null) {
    print(parsedJson['email']);
    _id = parsedJson['id'];
    _email = parsedJson['email'];
    _created_at = parsedJson['created_at'];
    _update_at = parsedJson['updated_at'];
    _phone_number = parsedJson['phone_number'];
    _status = parsedJson['status'];
    _country_id = parsedJson['country_id'];
    _token = parsedJson['token'];
  }

  String get token => _token;
}