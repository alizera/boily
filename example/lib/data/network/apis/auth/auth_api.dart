
import 'package:example/models/auth/login.dart';

import '../../dio_client.dart';
import '../base_api.dart';

class AuthApi extends BaseApi {
  AuthApi(DioClient dioClient) : super(dioClient);

  Future<Login> login(String user, String password, [bool isSuccess]) async {
    return Future.delayed(const Duration(seconds: 2), () {
      if (isSuccess) {
        return Login(true, null);
      }
      return Login(false, "نام کاربری اشتباست");
    });
//    var result = await dioClient.post(Endpoints.baseUrl);
//    return Login.fromJson(result);
  }
}
