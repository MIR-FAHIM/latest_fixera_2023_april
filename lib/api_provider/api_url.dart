class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
  static String baseUrl = 'http://18.217.130.75/api/v1';

  static String login = '$baseUrl/login';
  static String signup = '$baseUrl/registration';
  static String homeApiList = '$baseUrl/contractor/home';
  static String browseJobList = '$baseUrl/search-results';
  static String getContactorList = '$baseUrl/search-results';
  static String seeVendorProfile = '$baseUrl/vendor/profile';
  static String vendorDashBoard = '$baseUrl/webview/package-lists/vendor';
  static String messageCenterUrl = "$baseUrl/webview/message-center?token=";
 // static String vendorDashBoard = '$baseUrl/webview/package-lists/vendor';

  static String changePass = '$baseUrl/changePass';
}