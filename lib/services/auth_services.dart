import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
import 'package:uni_links/uni_links.dart';




class AuthService extends GetxService {
  final currentUser = LoginModel().obs;
  late GetStorage _box;
  final used = false.obs;
  final deviceToken = ''.obs;
  final refId = ''.obs;


  final language_key = 'en_US'.obs;

  AuthService() {
    _box = GetStorage();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    _box = GetStorage();
    //getLanguage();
    //  getDeviceToken();

    // getUsed();
    getCurrentUser();

    super.onInit();
  }

  setFirstUseOrNot() async {
    _box.write('used', true);
    getUsed();
  }

  getUsed() {
    if (_box.hasData('used')) {
      used.value = _box.read('used');
    }
  }

  setUser(LoginModel user) async {
    _box.write('currentUser', user.toJson());
    getCurrentUser();
  }
  setRefCode(String refCode) async {
    _box.write('ref', refCode);
    getRefCode();
  }

  getCurrentUser() {
    if (_box.hasData('currentUser')) {
      currentUser.value = LoginModel.fromJson(_box.read('currentUser'));
      print("${_box.read('currentUser')}");
    }
    print('customer data: ${currentUser.value.userInfo!.firstName}');
  }

  getRefCode() {
    if (_box.hasData('ref')) {
      refId.value = _box.read('ref');
      print("${_box.read('ref')}");
    }
    print('ref: ${refId.value}');
  }
  Future removeRefCode() async {

    await _box.remove('ref');
  }
  Future removeCurrentUser() async {
    currentUser.value = LoginModel();
    await _box.remove('currentUser');
  }

  bool get isAuth => currentUser.value.accessToken == null ? false : true;

  String get apiToken => currentUser.value.accessToken!;

  getLanguage() async {
    language_key.value = GetStorage().read<String>('language') ?? 'en_US';
  }

  Future<void> handleDeepLink() async {
    print("bro i am here in deeplinkk");
    // Handle deep link when the app is launched from a cold start
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        _parseDeepLink(initialLink);
      }
    } catch (e) {
      print('Error getting initial link: $e');
    }

    // Handle deep link when the app is resumed
    linkStream.listen((String? link) {
      if (link != null) {
        _parseDeepLink(link);
      }
    });
  }
  void _parseDeepLink(String link) async {
    final uri = Uri.parse(link);
    final refid = uri.queryParameters['refid'];
    if (refid != null) {
      print('Received refid: $refid');

      await setRefCode(refid);
      // Add any additional logic for handling refid here
    }
  }

// Future<void> getDeviceToken() async {
//   deviceToken.value = await FirebaseMessaging.instance.getToken() ?? '';
//
//   print('AuthService.getDeviceToken:${deviceToken.value}');
// }
}
