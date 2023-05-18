class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
  static String baseUrl = 'http://18.217.130.75/api/v1';

  static String login = '$baseUrl/login';
  static String signup = '$baseUrl/registration';
  static String homeApiList = '$baseUrl/contractor/home';
  static String browseJobList = '$baseUrl/search-results';
  static String getContactorList = '$baseUrl/search-results';

  static String changePass = '$baseUrl/changePass';
}