import 'package:efeedlink_demo/src/models/authentication.dart';
import 'package:efeedlink_demo/src/models/login_request.dart';

abstract class AuthenticationServices {
  Future<Authentication> doLogin(LoginRequest request);
}