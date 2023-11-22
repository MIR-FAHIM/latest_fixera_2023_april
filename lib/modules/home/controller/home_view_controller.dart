import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/view/profile_job_view.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/bid_now_web.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/job_details_webview.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/Home/home_api_model.dart';
import 'package:latest_fixera_2023/models/Home/lead_market_vendor_model.dart';
import 'package:latest_fixera_2023/models/Home/see_vendor_profile_model.dart';
import 'package:latest_fixera_2023/models/saved_model.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/repositories/home/home_repository.dart';
import 'package:latest_fixera_2023/repositories/saved_rep.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../repositories/auth_repositories/auth_repositories.dart';

class HomeViewController extends GetxController {
  //TODO: Implement SplashscreenController
  var searchController = TextEditingController().obs;
  final mySavedItemsListJobs = <JobSavedItems>[].obs;
  final mySavedFreelancerListJobs = <FreelancerItems>[].obs;
  final mySavedEmployerListJobs = <EmployeerItems>[].obs;
  var searchTextController = TextEditingController().obs;
  final contractorChecked =  true.obs;
  final brwsJobChecked =  false.obs;
  final marketPlaceChecked =  false.obs;
  final categoryList = <Categories>[].obs;
  final browseJobList = <JobData>[].obs;
  final contractorList = <DatumContractor>[].obs;
  final filterdContractorList = [].obs;
  final filterdMarketPlaceList = [].obs;
  final filterdBrwsProjectList = [].obs;
  final leadMarketVendorList = <VendorDatum>[].obs;
  final vendorJobList = <Job>[].obs;
  final contractorJobList = <Job>[].obs;
  final featureContractorList = <FeaturedContractors>[].obs;
  final latestJobList = <LatestJobs>[].obs;
  final latestJobLoad = false.obs;
  final vendorID = "".obs;
  final vendorName = "".obs;
  final locationList = <LanguageContractor>[].obs;
  final languageList = <LanguageContractor>[].obs;
  final skillList = <LanguageContractor>[].obs;
  final jobURL = "".obs;
  final vendorAbout = "".obs;
  final vendorImage = "".obs;
  final vendorBanner = "".obs;

  final vendorFav = false.obs;
  //final vendorFav = false.obs;
  var webController;
  final attachments = [].obs;
  final isHTML = false.obs;
  final skillDrop = false.obs;
  final locationDrop = false.obs;
  final languageDrop = false.obs;
  //List

  final selectListOfSkill = [].obs;
  final selectCardListInLocation =[].obs;
  final selectCardListInLanguage = [].obs;

  final recipientController = TextEditingController().obs;

  final subjectController = TextEditingController().obs;

  final bodyController = TextEditingController().obs;
  @override
  Future<void> onInit() async {
    getHomeApiList();
    browseJobListCOntroller();
    contractorListCOntroller();
    leadMarketVendorController();
    mySavedItemController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  callWebController() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) async {
            print("my url is $url");
            //https://shopbasebd.com/public/uploads/shop/products/1684647182_L_2.jpeg

            // NavigationDecision.navigate;
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("my url is ${request.url}");
            if (request.url.contains('proposal') == true) {
              Get.to(
                BidNowWeb(
                  url: request.url,
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://ccsforasia.com/api/v1/webview/job/test-3?token=${Get.find<AuthService>().apiToken}"));
  }

  addOrRemoveDataInSkillList(int id) {
    if (selectListOfSkill.contains(id)) {
      selectListOfSkill.remove(id);
    } else {
      selectListOfSkill.add(id);
    }
  }

  searchListController(String query) {
    if (query.isEmpty) {
      contractorListCOntroller();
      mySavedItemController();
    } else {
      if(contractorChecked.value == true){
        filterdContractorList.value = contractorList
            .where(
                (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else if(marketPlaceChecked.value == true){
        filterdMarketPlaceList.value = mySavedFreelancerListJobs
            .where(
                (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filterdBrwsProjectList.value = mySavedItemsListJobs
            .where(
                (item) => item.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

    }
  }

  addOrRemoveDataInLocationlList(int id) {
    if (selectCardListInLocation.contains(id)) {
      selectCardListInLocation.remove(id);
    } else {
      selectCardListInLocation.add(id);
    }
  }
  addOrRemoveDataInLaqnguageList(int id) {
    if (selectCardListInLanguage.contains(id)) {
      selectCardListInLanguage.remove(id);
    } else {
      selectCardListInLanguage.add(id);
    }
  }
  callPublicController(String slug, int id, String status){
    HomeRepository().callPublicRep(slug, id, status).then((value) {
      print("value is $value");
      if(value['error']== true){
        Get.showSnackbar(Ui.errorSnackBar(
            message: value['message'], title: 'Error'.tr));
      } else {
       // Get.back();
        Get.to(JobDetailsWebView(value["results"]["job_url"]));
        browseJobListCOntroller();
        getHomeApiList();
      }

    });

  }
   getHomeApiList() async {
    print("home api list working called -------");
    HomeRepository().homeApiList().then((value) {
      print(
          "working okay 11111 ${value.results!.latestJobs!.length.toString()}");
      categoryList.value = value.results!.categories!;
      featureContractorList.value = value.results!.featuredContractors!;
      latestJobList.value = value.results!.latestJobs!;
      print("category list length is ${categoryList.length}");
    });


  }

  browseJobListCOntroller() {
    print("browse api list working called -------");
    HomeRepository().browseJobList().then((value) {
      print(
          "browse hlw bro +++++ ${value.results!.jobs!.data!.length.toString()}");
      browseJobList.value = value.results!.jobs!.data!;

      print("browse list length is ${browseJobList.length}");
    });
  }

  checkPaymentStatus({id, slug, status}){
    print("check payment status working in started");
    HomeRepository().checkPaymentStatusRep(id).then((value) {



    Ui.showAwesomeDialog(
        value["results"]["modal_header"], value["results"]["modal_body_message_one"] +value["results"]["modal_body_message_two"] + value["results"]["modal_body_message_three"],
        AppColors.primaryColor, () {
          callPublicController(slug, id, 'public').then((){
            print("hlw payment $value");
            browseJobListCOntroller();
            Get.back();
          });

    },
      () {
        callPublicController(slug, id, 'private').then((){
          print("hlw payment $value");
          browseJobListCOntroller();
          Get.back();
        });
    }

        );


      print("check payment status $value");
    });
  }
  mySavedItemController() {
    print("save list api list working called -------");
    SavedRepRepository().mySavedItem().then((value) {

      mySavedItemsListJobs.value = value.results!.jobs!;
      mySavedFreelancerListJobs.value = value.results!.savedFreelancers!;
      mySavedEmployerListJobs.value = value.results!.savedEmployers!;

      print("saved list length is ${mySavedItemsListJobs.length}");
    });
  }
  makeFavCOntroller(
      id,
    favId, type, {userId}) {
    print("makeFavCOntroller working called -----${Get.find<AuthService>().currentUser.value.userInfo!.id} and  $favId------");
    HomeRepository().makeFavRep(Get.find<AuthService>().currentUser.value.userInfo!.id,favId, type).then((value) {
      print("hlw sukkur");
      seeVendorProfileController(Get.find<AuthService>().currentUser.value.userInfo!.id);
      print("hlw sukkur1111");
      getHomeApiList();
      mySavedItemController();
      contractorListCOntroller();
      browseJobListCOntroller();

    });
  }

  contractorListCOntroller() {
    print("contractor api list working called -------");
    HomeRepository().getContractorList().then((value) {
      print(
          "browse hlw bro +++++ ${value.results!.users!.data!.length.toString()}");
      contractorList.value =
          value.results!.users!.data!.map((datum) => datum).toList();
      languageList.value = value.results.languages!;
      skillList.value = value.results.skills!;
      locationList.value = value.results.locations!;

      print("browse list length is ${browseJobList.length}");
    });
  }

  leadMarketVendorController() {
    print("contractor api list working called -------");
    HomeRepository().getLeadListMarket().then((value) {
      print(
          "browse hlw bro +++++ ${value.results!.users!.length.toString()}");
      leadMarketVendorList.value = value.results!.users!;


      print("leadMarketVendorList list length is ${leadMarketVendorList.length}");
    });
  }
 //profile
  seeVendorProfileController(ids) {
    print("see vendor profile working called -------");
    HomeRepository().seeVendorProfileRep(ids).then((value) {
      vendorJobList.value = value.results!.jobs!;
      print("vendor job hlw bro +++++ ${value.results!.id!.toString()}");
      vendorName.value = value.results.name!;
      vendorImage.value = value.results.avatar;
      vendorBanner.value = value.results.banner;
      vendorAbout.value = value.results.about;
      vendorFav.value = value.results.isFavourite;



      print("vendor job list length is ${vendorJobList.length}");

      if (value.error == false) {
        Get.to(SeeVendorProfile());
      } else {
        Get.showSnackbar(Ui.errorSnackBar(
            message: "The Vendor has no profile to show", title: 'Error'.tr));
      }
    });
  }
  seeVendorProfileControllerJobList(ids) {
    print("see vendor profile working called -------");
    HomeRepository().seeVendorProfileRep(ids).then((value) {
      vendorJobList.value = value.results!.jobs!;
      print("vendor job hlw bro +++++ ${value.results!.id!.toString()}");
      vendorName.value = value.results.name!;
      vendorImage.value = value.results.avatar;
      vendorBanner.value = value.results.banner;
      vendorAbout.value = value.results.about;
      vendorFav.value = value.results.isFavourite;



      print("vendor job list length is ${vendorJobList.length}");

      if (value.error == false) {
        Get.to(SeeVendorProfileJObView());
      } else {
        Get.showSnackbar(Ui.errorSnackBar(
            message: "The Vendor has no profile to show", title: 'Error'.tr));
      }
    });
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
  seeContractorProfileController(ids) {
    print("see vendor profile working called -------");
    HomeRepository().seeContractorProfileRep(ids).then((value) {
      print("vendor job hlw bro +++++ ${value.results!.id!.toString()}");
      vendorName.value = value.results.name!;
      vendorImage.value = value.results.avatar;
      vendorBanner.value = value.results.banner;
      vendorAbout.value = value.results.about;
      vendorFav.value = value.results.isFavourite;

      //contractorList.value = value.results!.projects!;

      print("vendor job list length is ${vendorJobList.length}");

      if (value.error == false) {
        Get.to(SeeVendorProfile());
      } else {
        Get.showSnackbar(Ui.errorSnackBar(
            message: "The Vendor has no profile to show", title: 'Error'.tr));
      }
    });
  }

  /// sent mail

  void openImagePicker() async {
    final picker = ImagePicker();
    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {

        attachments.add(pick.path);

    }
  }

  void removeAttachment(int index) {

      attachments.removeAt(index);

  }
  sendEmailController(){
    AuthRepository().sendEmail(recipientController.value.text, subjectController.value.text, bodyController.value.text).then((value) {
      if(value['error'] == false){
        dataClearController();
        Get.showSnackbar(Ui.successSnackBar(
            message:value["results"]['message'], title: 'Success'.tr));
      }else{
        Get.showSnackbar(Ui.errorSnackBar(
            message: "Something Wrong",
            title: 'Error'.tr));
      }
    });
  }
  dataClearController(){
     recipientController.value.clear() ;

     subjectController.value.clear() ;

     bodyController.value.clear() ;
  }
  Future<void> attachFileFromAppDocumentsDirectoy(BuildContext c) async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final filePath = appDocumentDir.path + '/file.txt';
      final file = File(filePath);
      await file.writeAsString('Text file in app directory');


        attachments.add(filePath);

    } catch (e) {
      ScaffoldMessenger.of(c).showSnackBar(
        SnackBar(
          content: Text('Failed to create file in applicion directory'),
        ),
      );
    }
  }

// end mail
}


extension MyControllerExtensions on HomeViewController {
  // Debounced update method using GetX's debounce
  updateSearchTextDebounced(String text) {
    debounce(searchController, (value) {
      // Update the searchText only when the user has stopped typing for a while
      searchListController(text);
    },
        time: Duration(
            milliseconds: 500)); // Adjust the debounce duration as needed
  }
}