import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/Home/home_api_model.dart';
import 'package:latest_fixera_2023/models/Home/lead_market_vendor_model.dart';
import 'package:latest_fixera_2023/models/Home/see_vendor_profile_model.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
import 'package:latest_fixera_2023/models/contractor_full_profile.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';


class HomeRepository {
  Future<HomeApiListModel> homeApiList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.homeApiList,
      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"  },
    );
    return HomeApiListModel.fromJson(response);
  }

  Future checkPaymentStatusRep(id) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        "${ApiUrl.checkPaymentStatus}?check-job-payment-status?job_id=${id.toString()}",

      {

        'job_id': id.toString(),


      },

      {
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "X-Requested-With": "XMLHttpRequest",
        "Accept": "application/json",


      },
    );
    return response;
  }

  Future<BrowseJobModel> browseJobList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.browseJobList}?type=job",


        {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
          "Accept": "application/json"
        },
    );
    return BrowseJobModel.fromJson(response);
  }
  Future callPublicRep(String slug, int id, String status) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(

      "https://ccsforasia.com/api/v1/lead-details-payment-process?job_slug=$slug&job_id=$id&status=$status",
      {
        'job_slug': slug,
        'job_id': id.toString(),
        'status': status,

      },
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
        "X-Requested-With": "XMLHttpRequest",
        "Accept": "application/json"
      },
    );
    print("callPublicRep $response");

    return response;
  }

  Future<GetContractorModel> getContractorList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.getContactorList}?type=contractor",


      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "X-Requested-With": "XMLHttpRequest",
        "Accept": "application/json"
      },
    );
    return GetContractorModel.fromJson(response);
  }

  Future<GetLeadMarketVendorModel> getLeadListMarket() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.getContactorList}?type=vendor",


      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json"
      },
    );
    return GetLeadMarketVendorModel.fromJson(response);
  }

  Future<SeeVendorProfileModel> seeVendorProfileRep(id) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.seeVendorProfile,
      {
        "user_id": id.toString(),
      },

      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json"
      },
    );
    return SeeVendorProfileModel.fromJson(response);
  }
  Future<COntractorFullProfileModel> seeContractorProfileRep(id) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.contractorDetailsUrl,
      {
        "user_id": id.toString(),
      },

      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json"
      },
    );
    return COntractorFullProfileModel.fromJson(response);
  }
  Future makeFavRep(id, favId, type) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.favouriteUrl,
      {
        "id": id.toString(),
        "favorite_id": favId.toString(),
        "type" : type
      },

      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json"
      },
    );
    return response;
  }



}