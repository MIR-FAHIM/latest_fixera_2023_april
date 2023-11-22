import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
import 'package:latest_fixera_2023/models/auth_model/sign_up_data_model.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';

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
  Future verifyResetEmailOtp(
      {String? email,

        String? otp,
        String? user,
      }) async {
    APIManager _manager = APIManager();
    print("my user id from register is +++++++++ $user");
    final response =
    await _manager.postAPICallWithHeader(ApiUrl.forgotVerifyOtp, {
      'otp': otp!,
      'user_id': user!,
      'email': email!,

    }, {
      "Accept": "application/json"
    });
    print("otp verify response is $response");

    return response;
  }
  Future verifyEmailOtp(
      {String? email,
      String? pass,
      String? otp,
      String? user,
      String? type,
      String? deviceID,
      String? deviceId}) async {
    APIManager _manager = APIManager();
    print("my user id from register is +++++++++ $user");
    final response =
        await _manager.postAPICallWithHeader(ApiUrl.forgotVerifyOtp, {
      'otp': otp!,
      'user_id': user!,
      'email': email!,
      'type': type!,
      "device_id": deviceID!,
      "password": pass!,
    }, {
      "Accept": "application/json"
    });
    print("otp verify response is $response");

    return response;
  }

  Future userRegister(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? role,
      String? catOrEmp,
      String? pass,
      String? conPass,
      int? locations,
      String? initialsignature}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.signUpPostUrl,
      {
        'first_name': firstName!,
        'last_name': lastName!,
        'email': email!,
        "phone": phone!,
        'role': role!,
        "categories": catOrEmp!,
        // "employees" : catOrEmp!,

        'password': pass!,

        'password_confirmation': conPass!,
        'locations': locations!.toString(),
        "initial-signature": initialsignature!,
      },
      {
        "Accept": "application/json",
      },
    );
    print("login response is $response");

    return response;
  }

  Future changePass(
      String currentPass, String newPass, String confirmPass) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.changePass,
      {
        'old_password': currentPass,
        'password': newPass,
        'password_confirmation': confirmPass,
      },
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("chane pass response is $response");

    return response;
  }


  // forgot pass from login
  Future forgotPassFromLogin(
      String pass,  String conPass, String userID) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      "${ApiUrl.forgotResetPass}?user_id=$userID&password=$pass&password_confirmation=$conPass",
        {}


    );
    print("reset pass from login pass response is $response");

    return response;
  }

  // forgot email
  Future forgotEmailFromLogin(
      String email, ) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "${ApiUrl.forgotEmail}?email=$email",
        {}


    );
    print("reset pass from login pass response is $response");

    return response;
  }

  Future sendEmail(String rcvEmail, String sub, String body) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.SEND_EMAIL,
      {
        'receiver_email': rcvEmail,
        'subject': sub,
        'description': body,
      },
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("chane pass response is $response");

    return response;
  }

  Future<SignUpDataListModel> getSignUpData() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      ApiUrl.signUpGetUrl,
    );
    print("chane pass response is $response");
    return SignUpDataListModel.fromJson(response);
  }

  Future checkEmail(String email, String mobile) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        "${ApiUrl.emailExistUrl}?email=$email&phone=$mobile", {
      'email': email,
      'phone': mobile,
    }, {
      "X-Requested-With": "XMLHttpRequest",
      "Accept": "application/json",
    });
    print("email exist response is $response");

    return response;
  }
}
