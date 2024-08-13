import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:get/get.dart';

class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
 // static String baseUrl = 'http://18.217.130.75/api/v1';
 static String baseUrl = 'https://ccsforasia.com/api/v1';
  static String mainUrl = 'https://ccsforasia.com';

  static String login = '$baseUrl/login';
  static String howItWork = 'https://ccsforasia.com/page/how-it-works?token=';
  static String payment_process = '$baseUrl/lead-details-payment-process';


  static String signup = '$baseUrl/registration';
  static String homeApiList = '$baseUrl/contractor/home';
  static String browseJobList = '$baseUrl/search-results';
  static String checkPaymentStatus = '$baseUrl/check-job-payment-status';

  static String getContactorList = '$baseUrl/search-results';
  static String getRefUserList = '$baseUrl/referrals';
  static String generateCode = '$baseUrl/referrals';
  static String referralListUsed = '$baseUrl/referrals';
  static String seeVendorProfile = '$baseUrl/vendor/profile';
  static String projectsOngoingUrl =
      "$baseUrl/webview/contractor/jobs/hired?token=";
  static String projectsCompletedUrl =
      "$baseUrl/webview/contractor/jobs/completed?token=";
  static String messageCenterUrl = "$baseUrl/webview/message-center?token=";
  static String manage_account = "$baseUrl/webview/profile/settings/manage-account?token=";
 // static String payment_setting = "$baseUrl/webview/contractor/dashboard/payment-settings";
  static String email_notification = "$baseUrl/webview/profile/settings/email-notification-settings?token=";
 // static String manage_account = "$baseUrl/webview/profile/settings/manage-account?token=";

  // static String vendorDashBoard = '$baseUrl/webview/package-lists/vendor';
  static String contractorDashBoardUrl =
      "$baseUrl/webview/contractor/dashboard?token=";
  static String vendorDashBoardUrl = "$baseUrl/webview/vendor/dashboard?token=";

  static String changePass = '$baseUrl/profile/settings/change-password';

  //// Copy From Fixera
  static String aboutUs = "$baseUrl/page/about-us";
  static String purchasePackageFromAppStore =
      "$baseUrl/page/purchaseFromAppStore?";
  static String purchaseCreditFromAppStore =
      "$baseUrl/page/creditPurchaseFromAppStore";
  static String contactSupport = "$baseUrl/page/privacy-policy";
  static String rateThisApp = "https://play.google.com/store/apps";
  static String jobByCategories = "$baseUrl/list/get-categories";
  static String loginUrl = "$baseUrl/login";
  static String logOutUrl = "$baseUrl/logout";
  static String forgotEmail = "$baseUrl/reset-email";
  static String forgotVerifyOtp = "$baseUrl/verify-otp";
  static String forgotResetPass = "$baseUrl/reset-password";
  static String jobPageUrl = "$baseUrl/search-results?type=job";
  static String vendorPageUrl = "$baseUrl/search-results?type=vendor";
  static String contractorPageUrl = "$baseUrl/search-results?type=contractor";
  static String homePageUrl = "$baseUrl/contractor/home";
  static String signUpGetUrl = "$baseUrl/registration/data";
  static String emailExistUrl = "$baseUrl/email/check";
  static String signUpPostUrl = "$baseUrl/register";
  static String favouriteUrl = "$baseUrl/user-favourite";
  static String postJobDataList = "$baseUrl/post-job?role_id=3";
  static String favouritGetUrl = "$baseUrl/user-favourite-lists";
  static String creditList = "$mainUrl/api/v2/buy-credit";
  static String buyPackage = "$mainUrl/api/v2/package/contractor?";
  static String packageListContractor = "$mainUrl/api/v2/package/contractor";
  static String packageListVendor = "$mainUrl/api/v2/package/vendor";
  static String  vendorProfileSettingUrl = "$mainUrl/api/v1/webview/vendor/profile";



  static String openJobsUrl = "$baseUrl/jobListsByUser";
  static String fullProfileUrl = "$baseUrl/vendor/profile";
  static String contractorDetailsUrl = "$baseUrl/contractor/profile";
  static String searchUrl = "$baseUrl/search-results";
  static String jobDialogUrl = "$baseUrl/check-job-payment-status";
  static String privatePublicJobsUrl = "$baseUrl/lead-details-payment-process";
  static String getPostaJobUrl = "$baseUrl/post-job";
  static String postaJobUrl = "$baseUrl/post-job?";
  static String changePassword = "$baseUrl/profile/settings/change-password";

  ///webView

  static String contractorInvoiceUrl =
      "$baseUrl/webview/contractor/package/invoice?token=";
  static String emailNotification =
      "$baseUrl/webview/profile/settings/email-notification-settings?token=";
  static String vendorInvoiceUrl =
      "$baseUrl/webview/vendor/package/invoice?token=";
  static String contractorPackagesUrl =
      "$baseUrl/webview/package-lists/contractor?token=";
  static String deactivateAccount =
      "$baseUrl/webview/profile/settings/delete-account?token=";
  static String contrctorExEdu =
      "$baseUrl/webview/contractor/dashboard/experience-education?token=";
   static String transferHistoryUrl =
       "$baseUrl/webview/${Get.find<AuthService>().currentUser.value.userInfo!.roleName}/job/tranfer_payment/summary?token=";

  static String profileDetailsAndSkill =
      "$baseUrl/webview/contractor/profile?token=";
  static String vendorPackagesUrl =
      "$baseUrl/webview/package-lists/vendor?token=";
  static String contractorProposalsUrl = "$baseUrl/webview/proposals?token=";
  static String buyCreditUrl = "$baseUrl/webview/credit-purchase?token=";
  static String creditReport =
      "$baseUrl/webview/creditPurchaseHistoryApple?token=";

  static String privacyPolicyUrl =
      "https://fix-era.com/page/privacy-policy?token=";
  //static String howItWorksUrl = "https://fix-era.com/page/how-it-works?token=";


  static String payment_setting =
      "$baseUrl/webview/contractor/dashboard/payment-settings?token=";
  static String project_certification =
      "$baseUrl/webview/contractor/dashboard/project-awards?token=";
  static String incomeHistoryUrl =
      "$baseUrl/webview/contractor/income/history?token=";
  static String withdrawUrl = "$baseUrl/webview/contractor/withdraw?token=";
  static String leadOngoingUrl = "$baseUrl/webview/vendor/jobs/hired?token=";

  static String leadCompletedUrl =
      "$baseUrl/webview/vendor/jobs/completed?token=";
  static String leadManageJobsUrl =
      "$baseUrl/webview/vendor/dashboard/manage-jobs?token=";
  static String contractorManageJobsUrl =
      "$baseUrl/webview/contractor/dashboard/manage-jobs?token=";
  // static String contractorDashBoardUrl =
  //     "$baseUrl/webview/contractor/dashboard";
  static var postAjobNew = '$mainUrl/api/v2/post-job';

  static var invoiceStore = '$baseUrl/invoice/store';
  static var estimationStore = '$baseUrl/estimation/store';
  static var workorderStore = '$baseUrl/work-order/store';
  static var SEND_EMAIL = '$baseUrl/send-mail';

// end copy from fisera.....
}