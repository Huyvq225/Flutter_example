import 'package:efeedlink_demo/src/models/base_mode.dart';
import 'package:efeedlink_demo/src/models/user.dart';

class Authentication {

  User _data;


  Authentication.fromJson(Map<String, dynamic> parsedJson) {
    // _data = parsedJson['data'];
    _data = User.fromJson(parsedJson['data']);
  }
  

  User get data => _data;
}

class APIResponse<T extends BaseModel> {
  T _data;
  List<T> _datas;

  APIResponse.formJson(Map<String, dynamic> parsedJson) {
  }

}