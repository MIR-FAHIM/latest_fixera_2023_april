
import 'package:url_launcher/url_launcher_string.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
import 'package:latest_fixera_2023/modules/Auth/Signin/sign_page.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/professional_info.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/success_page_signUp.dart';
import 'package:latest_fixera_2023/repositories/auth_repositories/auth_repositories.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:email_otp/email_otp.dart';
import 'dart:ui' as ui;
import '../../../models/auth_model/sign_up_data_model.dart';
import '../sign_up/verification_page.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';


class AuthController extends GetxController {
  //TODO: Implement LoginController
  EmailOTP myauth = EmailOTP();
  var email = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var oldPassController = TextEditingController().obs;
  var conPassController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  final selectLocation = "".obs;
  final selectRole = "".obs;
  final selectCat = "".obs;
  final signInVisible = 0.obs;
  final userID = "".obs;
  final selectEmployee = "".obs;
  final selectEmployeeIndex = 0.obs;
  final visible = 0.obs;
  final passLoad = 0.obs;
  final visibleSuccess = 0.obs;
  final pinVisible = 0.obs;
  var pinCodeController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  final grpValue = 0.obs;
  final pageState = 0.obs;
  final resetEmailLoad = 0.obs;
  final resetOtpLoad = 0.obs;
  final resetPassLoad = 0.obs;
  final locatinID = 0.obs;
  final empIndex = 0.obs;
  final agreeOrNor = false.obs;
  final departmentList = <Department>[].obs;
  final locationList = <MapEntry<dynamic, dynamic>>[].obs;
  final locationListFinal = <Category>[].obs;
  //final employeeList =  <MapEntry<dynamic, dynamic>>[].obs;
  final employeeListFinal = <EmployeeCount>[].obs;
  final categoryList = <MapEntry<dynamic, dynamic>>[].obs;
  final categoryListFinal = <Category>[].obs;
  StreamController<ErrorAnimationType>? pinErrorController;
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  var  bytes ;
  final base64Image = "".obs;


  @override
  void onInit() {
    getSignUPDataListControlelr();
    pinErrorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
   handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

   handleSaveButtonPressed(context) async {
     // var dir = await getTemporaryDirectory();
     // File userSugnatureFile = File(dir.path + '/userSign.png');
     // await userSugnatureFile.writeAsBytes(
     //     await ProfessionalInfoPageState.userSignatureController.toPngBytes());
     // final bytes = File(userSugnatureFile.path).readAsBytesSync();
     // String signatureString = "data:image/png;base64," + base64Encode(bytes);
  }
  verifyOTP(BuildContext context) async {
    if (await myauth.verifyOTP(otp: pinCodeController.value.text) == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP is verified"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid OTP"),
      ));
    }
  }

  sendOTP(BuildContext context) async {
    myauth.setConfig(
        appEmail: "ridoyfahim92@gmail.com",
        appName: "Email OTP",
        userEmail: email.value.text,
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }
  advancedStatusCheck(BuildContext context) async {
    print("hlw version ________________________");
    final newVersion = NewVersionPlus(
      //iOSId: 'com.google.Vespa',
      androidId: 'com.jayga.app',
    );
    var status = await newVersion.getVersionStatus();
    print("version status ${status!.appStoreLink}");
    if (status.canUpdate == true) {
      newVersion.showUpdateDialog(
        launchMode: LaunchMode.externalApplication,
        context: context,
        versionStatus: status,
        dialogTitle: 'Update Available!',
        dialogText:
        'Upgrade Jayga ${status.localVersion} to Jayga ${status.storeVersion}',
      );
    }
  }
  resetPassFromLogin() {
   // resetPassLoad.value ++ ;
    AuthRepository()
        .forgotPassFromLogin(passController.value.text,conPassController.value.text,userID.value.toString())
        .then((value) {
      if (value['error']) {
      //  resetPassLoad.value = 0;
      } else {
      //  resetPassLoad.value = 0;
        Get.toNamed(Routes.LOGIN);
        Get.showSnackbar(Ui.successSnackBar(
            message:value['results']['message'], title: 'Success'.tr));
      }
    });
  }
  resetEmailFromLogin() {
    resetEmailLoad.value ++ ;
    AuthRepository()
        .forgotEmailFromLogin(email.value.text)
        .then((value) {
      if (value['error']) {
        resetEmailLoad.value = 0;
      } else {
        resetEmailLoad.value = 0;
        userID.value = value["results"]["user_id"].toString();
       Get.toNamed(Routes.RESETOTP);

      }
    });
  }
  checkEmailExist() {
    AuthRepository()
        .checkEmail(email.value.text, phoneController.value.text)
        .then((value) {
      if (value['error']) {
      } else {
        pageState.value = 1;
        Get.to(ProfessionalInfoView());
      }
    });
  }

  loginController() async {
    signInVisible.value++;
    AuthRepository()
        .userLogin(email.value.text, passController.value.text)
        .then((e) async {
      print("my login data");
      if (e != null) {
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        signInVisible.value = 0;
        print(
            "hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
        Get.offAllNamed(Routes.BASE);
      } else {
        print("error ++++++++++++++");
        signInVisible.value = 0;
      }
    });
  }

  registerController(String signature) async {
    visible.value++;
    AuthRepository()
        .userRegister(email: email.value.text, phone: phoneController.value.text, firstName: nameController.value.text, lastName: lastNameController.value.text,
    role: selectRole.value, catOrEmp: 1.toString(), pass: passController.value.text,
        conPass: conPassController.value.text, locations: locatinID.value , initialsignature:signature!)
        .then((e) async {
      print("my register data");
      if (e != null) {
       pageState.value = 2;
       userID.value = e["results"]["user_id"].toString();
        Get.to(VerificationView());
      } else {
        print("error ++++++++++++++");
        visible.value = 0;
      }
    });
  }
  verifyResetEmailOtpController(){
    resetOtpLoad.value ++;
    AuthRepository().verifyResetEmailOtp(email: email.value.text,
      otp: pinCodeController.value.text,
      user: userID.value.toString(), ).then((value) {
      if(value["error"]== false){
        resetOtpLoad.value = 0;
        Get.toNamed(Routes.RESETPASS);
      } else {
        resetOtpLoad.value = 0;
      }
    });
  }
  verifyEmailOtpController(){
    pinVisible.value ++;
    AuthRepository().verifyEmailOtp(email: email.value.text , pass: passController.value.text,
      otp: pinCodeController.value.text, deviceID: "new" , type: "register", user: userID.value.toString(), ).then((value) {
      if(value["error"]== false){
        pinVisible.value = 0;
        Get.to(SuccessPageView());
      } else {
        pinVisible.value = 0;
      }
    });
  }

  getSignUPDataListControlelr() async {
    locationList.value.clear();
    locationListFinal.value.clear();
    categoryList.value.clear();
    categoryListFinal.value.clear();
    //employeeList.value.clear();
    employeeListFinal.value.clear();
    AuthRepository().getSignUpData().then((value) {
      print("sign up value $value");

      locationListFinal.value = value.results.locations!;
      categoryListFinal.value = value.results.categories!;
      employeeListFinal.value = value.results.employeeCount;

      print("employee ++++++++++++ ${employeeListFinal.value[0].title}");
      print("locations ++++++++++++ ${locationListFinal.value[0]}");

      print("sign up value ${departmentList.value.length}");
    });
  }
}
