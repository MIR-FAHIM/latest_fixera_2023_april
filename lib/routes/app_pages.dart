import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/Auth/Signin/sign_page.dart';
import 'package:latest_fixera_2023/modules/Auth/binding/auth_binding.dart';
import 'package:latest_fixera_2023/modules/base/bindings/base_bindings.dart';
import 'package:latest_fixera_2023/modules/base/view/base_screen.dart';
import 'package:latest_fixera_2023/modules/browsejob/view/browse_job_page.dart';
import 'package:latest_fixera_2023/modules/contractor/view/contractor_list.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/binding/create_estimation_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/view/create_estimation.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/binding/post_project_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/view/post_a_project.dart';
import 'package:latest_fixera_2023/modules/home/binding/home_view_binding.dart';
import 'package:latest_fixera_2023/modules/home/view/home_view.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/lead_market_place_list_screen.dart';
import 'package:latest_fixera_2023/modules/splash/bindings/splash_binding.dart';
import 'package:latest_fixera_2023/modules/splash/splash_screen.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () =>  SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () =>  BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeViewScreen(),
      binding: HomeViewcreenBinding(),
    ),
    GetPage(
      name: _Paths.POSTPROJECT,
      page: () =>  PostAProjectFormScreen(),
      binding: PostProjectBinding(),
    ),
    GetPage(
      name: _Paths.CREATEESTIMATION,
      page: () =>  CreateEstimationFormScreen(),
      binding: CreateEstimationBinding(),
    ),
    GetPage(
      name: _Paths.BROWSEJOB,
      page: () =>  BrowseJobViewScreen(),
      binding: HomeViewcreenBinding(),
    ),
    GetPage(
      name: _Paths.CONTRACTORLISTVIEW,
      page: () =>  ContractorListScreen(),
      binding: HomeViewcreenBinding(),
    ),
    GetPage(
      name: _Paths.LEADMARKET,
      page: () =>  LeadMarketViewScreen(),
      binding: HomeViewcreenBinding(),
    ),
  ];
}
