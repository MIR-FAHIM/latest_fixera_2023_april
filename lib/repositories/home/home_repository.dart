import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/Home/home_api_model.dart';
import 'package:latest_fixera_2023/models/Home/lead_market_vendor_model.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
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

  Future<GetContractorModel> getContractorList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.getContactorList}?type=contractor",


      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
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


}