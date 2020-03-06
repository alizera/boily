import '../base_model.dart';

class Login extends BaseModel {
  Login(bool status, String message) : super(status, message);

  Login.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
