import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/Auth/Signin/sign_page.dart';
import 'package:latest_fixera_2023/modules/Auth/binding/auth_binding.dart';
import 'package:latest_fixera_2023/modules/base/bindings/base_bindings.dart';
import 'package:latest_fixera_2023/modules/base/view/base_screen.dart';
import 'package:latest_fixera_2023/modules/browsejob/view/browse_job_page.dart';
import 'package:latest_fixera_2023/modules/contractor/view/contractor_list.dart';
import 'package:latest_fixera_2023/modules/drawer/buy_credit/binding/buy_credit_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/buy_credit/view/buy_credit_view_list.dart';
import 'package:latest_fixera_2023/modules/drawer/packages/package_list_view.dart';
import 'package:latest_fixera_2023/modules/drawer/change_pass/binding/change_pass_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/change_pass/view/change_pass_view.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/binding/create_estimation_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/view/create_estimation.dart';
import 'package:latest_fixera_2023/modules/drawer/create_invoice/binding/invoice_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/create_invoice/view/create_invoice.dart';
import 'package:latest_fixera_2023/modules/drawer/create_work_order/dart/binding/work_order_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/create_work_order/dart/view/work_order_form_view.dart';
import 'package:latest_fixera_2023/modules/drawer/my_saved_item/binding/saved_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/binding/post_project_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/view/post_a_project.dart';
import 'package:latest_fixera_2023/modules/drawer/post_lead/binding/post_lead_binding.dart';
import 'package:latest_fixera_2023/modules/drawer/post_lead/view/post_lead_view.dart';
import 'package:latest_fixera_2023/modules/home/binding/home_view_binding.dart';
import 'package:latest_fixera_2023/modules/home/view/home_view.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/lead_market_place_list_screen.dart';
import 'package:latest_fixera_2023/modules/search_module/binding/search_binding.dart';
import 'package:latest_fixera_2023/modules/splash/bindings/splash_binding.dart';
import 'package:latest_fixera_2023/modules/splash/splash_screen.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/email_sent.dart';

import '../modules/drawer/my_saved_item/view/my_saved_view.dart';
import '../modules/search_module/view/search_page.dart';


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
      name: _Paths.SEARCHVIEW,
      page: () =>  SearchView(),
      binding: HomeViewcreenBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGELIST,
      page: () =>  PackagesListView(),
      binding: BuyCreditBinding(),
    ),
    GetPage(
      name: _Paths.CREDITLIST,
      page: () =>  BuyCreditListView(),
      binding: BuyCreditBinding(),
    ),
    GetPage(
      name: _Paths.POSTPROJECT,
      page: () =>  PostAProjectFormScreen(),
      binding: CreateEstimationBinding(),
    ),
    GetPage(
      name: _Paths.CREATEESTIMATION,
      page: () =>  CreateEstimationFormScreen(),
      binding: CreateEstimationBinding(),
    ),
    GetPage(
      name: _Paths.POSTLEAD,
      page: () =>  PostALeadFormScreen(),
      binding: PostLeadBinding(),
    ),
    GetPage(
      name: _Paths.SENDMAIL,
      page: () =>  SendMailScreen(),
      binding: HomeViewcreenBinding(),
    ),
    GetPage(
      name: _Paths.SAVEDLIST,
      page: () =>  MySavedViewScreen(),
      binding: HomeViewcreenBinding(),
    ),

    GetPage(
      name: _Paths.CREATEWORKORDER,
      page: () =>  CreateWorkOrderFormScreen(),
      binding: CreateWorkOrderBinding(),
    ),
    GetPage(
      name: _Paths.CREATEINVOICE,
      page: () =>  CreateInvoiceFormScreen(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASS,
      page: () =>  ChangePassFormScreen(),
      binding: ChangePassBinding(),
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
