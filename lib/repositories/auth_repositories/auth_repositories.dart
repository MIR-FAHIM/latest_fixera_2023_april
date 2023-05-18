import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';

class AuthRepository {
  Future userLogin(String email, String pass) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.login,
      {'email': email, 'password': pass},
    );
    print("login response is $response");

    return response;
  }
}
