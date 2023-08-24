
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/Home/home_api_model.dart';
import 'package:latest_fixera_2023/models/Home/lead_market_vendor_model.dart';
import 'package:latest_fixera_2023/models/Home/see_vendor_profile_model.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
import 'package:latest_fixera_2023/models/credit_list_model.dart';
import 'package:latest_fixera_2023/models/package_list_model.dart';
import 'package:latest_fixera_2023/models/saved_model.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';


import '../models/post_job_data_model.dart';

class SavedRepRepository {
  Future<SavedItemModel> mySavedItem() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.favouritGetUrl,
      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"},
    );
    return SavedItemModel.fromJson(response);
  }

  Future<BuyCreditListModel> creditList(page) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.creditList}?page=$page",
      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"},
    );
    return BuyCreditListModel.fromJson(response);
  }

  Future<PostJobModelData> postJobProjectList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.postJobDataList,
      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"},
    );
    return PostJobModelData.fromJson(response);
  }

  Future<PackageListModel> packageList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.packageList,
      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"},
    );
    return PackageListModel.fromJson(response);
  }
  Future buypackage(String packageId) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.buyPackage + packageId,
      {"package_id": packageId,},
      {
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json",
      },
    );
    return response;
  }
  Future buyCredit(String purpose, String qt) async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.creditList,
      {"purpose": purpose,
        "quantity": qt},
      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"},
    );
    return response;
  }
 //punch List
  Future postJobOrLead(
      {
  project_status,
  title,
  custom_price_type,
  custom_price_value,
  job_duration,
  freelancer_type,
  measurement_type,
  measurement_value,
  project_start_date,
  project_end_date,
  lead_expiration ,
  lead_price,
  insurance_status,
  insurance_company,
  square_size,
  // "no_stories":6,
  age_of_roof,
  roof_type,
  property_type,
  lead_contact_name,
  lead_contact_phone,
  lead_contact_email,
  expiry_of_lead,
  project_cost,
  description,
  locations,
  postal_code,
  address,
  //"is_featured":  false,
  // "show_attachments": false,
  project_hire_type,
  categories,
  languages,
  skills


      }
      ) async {
    List a = ['a','d', 'f'];
    List b = ['4','5', '6'];
    // print("hlw brother ++++++++++++++++++++++++${images![0].path!}");
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      "https://ccsforasia.com/api/v2/post-job",
      {
        "project_status": "true",
        "title": "rtr",
        "custom_price_type": "Hourly",
        "custom_price_value": "121",
        "job_duration": "3 to 6 months",
        "freelancer_type": "4",
        "measurement_type": "ft",
       "measurement_value": "555",
        "project_start_date": "22-09-23",
        "project_end_date": "2021-07-28",
        "lead_expiration": "48" ,
        "lead_price":"121",
        "insurance_status": "2",
        "insurance_company": "all-farm",
        "square_size": "66",
       // "no_stories":6,
        "age_of_roof": "7 Years",
        "roof_type": "single",
        "property_type": "commercial",
        "lead_contact_name": "null",
        "lead_contact_phone":"null",
        "lead_contact_email":"null",
        "expiry_of_lead":"null",
        "project_cost": "110",
        "description": "dddd",
        "locations": "8",
        "postal_code": "ss",
        "address": "ss",
        //"is_featured":  false,
       // "show_attachments": false,
        "project_hire_type[]": "3",
        "categories[]": "3",
        "languages[]": "3",
       "skills[][id]" : "16"
      },

      {
      //  'X-Requested-With': 'XMLHttpRequest',
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json",
        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"


      },

    );
    return response;
  }

  Future createInvoice(
      {
        String? rcvEmail,
        String? company_name,
        String? company_address,
        String? company_mobile,
        String? company_email,
        String? vendor_name,
        String? vendor_address,
        String? vendor_mobile,
        String? payment_date,
        String? total_amount,
        List<Uint8List>? images,
        List? title,
        List? rate,
        List? quantity,
        List? final_amount,


      }
      ) async {
    List a = ['a','d', 'f'];
    List b = ['4','5', '6'];
   // print("hlw brother ++++++++++++++++++++++++${images![0].path!}");
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.invoiceStore,
      {
        "receivable_email": rcvEmail!,
        "company_name": company_name!,
        "company_address": company_address!,
        "company_mobile": company_mobile!,
        "company_email": company_email!,
        "vendor_name": vendor_name!,
        "vendor_address": vendor_address!,
        "vendor_mobile": vendor_mobile!,
        "payment_date": "22-09-23",
        "total_amount": total_amount!,
        "images": "" ,
        "title[]": title![0],
        "rate[]": rate![0],
        "quantity[]": quantity![0],
        "final_amount[]": final_amount![0],
      },

      {
        //'X-Requested-With': 'XMLHttpRequest',
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json",
       // "Accept-Encoding": "gzip, deflate, br",
       // "Accept":"*/*",
       // "Connection": "keep-alive"


      },

    );
    return response;
  }
  // post a jon/ project / lead

  createPostAjobMultipart(
      {
      lead_contact_name,
      lead_contact_phone,
      lead_contact_address,
      custom_price_type,
      title,
      custom_price_value,
      job_duration,
      freelancer_type,
      project_start_date,
      project_end_date,
      lead_expiration ,
      measurement_value,
      measurement_type,
      project_cost,
      public_bid_price,
      // "no_stories":6,
      private_bid_price,
      locations,
      postal_code,
      address,
      is_featured,
      show_attachments,
      description,
        //"is_featured":  false,
        // "show_attachments": false,
        File? attachments,
        categories,
        languages,



      }
      ) async {
    var a ;
    Map<String, String> data =
    {
      "lead_contact_name": "owniooiwnoinio",
      "lead_contact_phone": "9089087887",
      "lead_contact_address": "Hourly",
      "custom_price_type": "121",
      "title": "3 to 6 months",
      "custom_price_value": "4",
      "job_duration": "ft",
      "freelancer_type": "2",
      "project_start_date": "22-09-23",
      "project_end_date": "2021-07-28",
      "lead_expiration": "48" ,
      "measurement_value":"121",
      "measurement_type": "2",
      "project_cost": "8799",
      "public_bid_price": "66",
      // "no_stories":6,
      "private_bid_price": "7",
      "locations": "2",
      "postal_code": "4000",
      "address": "hjkhjk",
      "is_featured":"true",
      "show_attachments":"true",
      "description":"sdfgg",


    };
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(attachments!.openRead()));
    // get file length
    var length = await attachments.length();

    // string to uri
    var uri = Uri.parse("https://ccsforasia.com/api/v2/post-job");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('attachments[]', stream, length,
        filename: basename(attachments.path));

    // add file to multipart


    for (int i = 0; i < categories!.length; i++) {
      request.fields['categories[]'] = categories[i];
      //request.fields['rate[]'] = rate[i].toString();

    }
    for (int i = 0; i < languages!.length; i++) {
      request.fields['languages[]'] = languages[i];
      //request.fields['rate[]'] = rate[i].toString();

    }

    request.files.add(multipartFile);
    request.fields.addAll(data);
    request.headers.addAll(  {
      //'X-Requested-With': 'XMLHttpRequest',
      "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
      // 'Content-Type': 'multipart/form-data',

      "Content-Type": "application/json",
      // "Accept": "application/json"

      // "Accept-Encoding": "gzip, deflate, br",
      // "Accept":"*/*",
      // "Connection": "keep-alive"


    },);
    // send
    http.Response response = await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
   // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
 return bb;
  }
  createInvoiceMultipart(
      {
        project_status,
        title,
        custom_price_type,
        custom_price_value,
        job_duration,
        freelancer_type,
        measurement_type,
        measurement_value,
        project_start_date,
        project_end_date,
        lead_expiration ,
        lead_price,
        insurance_status,
        insurance_company,
        square_size,
        // "no_stories":6,
        age_of_roof,
        roof_type,
        property_type,
        lead_contact_name,
        lead_contact_phone,
        lead_contact_email,
        expiry_of_lead,
        project_cost,
        description,
        locations,
        postal_code,
        address,
        //"is_featured":  false,
        // "show_attachments": false,
        project_hire_type,
        categories,
        languages,
        skills,
        File? imageFile,

      }
      ) async {

    Map<String, String> data =
    {
      "project_status": "true",
      "title": "rtr",
      "custom_price_type": "Hourly",
      "custom_price_value": "121",
      "job_duration": "3 to 6 months",
      "freelancer_type": "4",
      "measurement_type": "ft",
      "measurement_value": "555",
      "project_start_date": "22-09-23",
      "project_end_date": "2021-07-28",
      "lead_expiration": "48" ,
      "lead_price":"121",
      "insurance_status": "2",
      "insurance_company": "all-farm",
      "square_size": "66",
      // "no_stories":6,
      "age_of_roof": "7 Years",
      "roof_type": "single",
      "property_type": "commercial",
      "lead_contact_name": "null",
      "lead_contact_phone":"null",
      "lead_contact_email":"null",
      "expiry_of_lead":"null",
      "project_cost": "110",
      "description": "dddd",
      "locations": "8",
      "postal_code": "ss",
      "address": "ss",
      //"is_featured":  false,
      // "show_attachments": false,
      "project_hire_type[]": "3",
      "categories[]": "3",
      "languages[]": "3",
      "skills[][id]" : "16"
    };
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(ApiUrl.invoiceStore);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('images', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart


    // for (int i = 0; i < skills!.length; i++) {
    //   request.fields['title[]'] = title[i];
    //   //request.fields['rate[]'] = rate[i].toString();
    //
    // }
    // for (int i = 0; i < project_hire_type!.length; i++) {
    //   request.fields['rate[]'] = rate[i];
    //   //request.fields['rate[]'] = rate[i].toString();
    //
    // }
    // for (int i = 0; i < categories!.length; i++) {
    //   request.fields['quantity[]'] = quantity[i];
    //   //request.fields['rate[]'] = rate[i].toString();
    //
    // }
    // for (int i = 0; i < languages!.length; i++) {
    //   request.fields['final_amount[]'] = final_amount[i];
    //   //request.fields['rate[]'] = rate[i].toString();
    //
    // }
    request.files.add(multipartFile);
    request.fields.addAll(data);
    request.headers.addAll(  {
      //'X-Requested-With': 'XMLHttpRequest',
      "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
      // 'Content-Type': 'multipart/form-data',

      "Content-Type": "application/json",
      // "Accept": "application/json"

      // "Accept-Encoding": "gzip, deflate, br",
      // "Accept":"*/*",
      // "Connection": "keep-alive"


    },);
    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
  upload(
      {
        String? rcvEmail,
        String? company_name,
        String? company_address,
        String? company_mobile,
        String? company_email,
        String? vendor_name,
        String? vendor_address,
        String? vendor_mobile,
        String? payment_date,
        String? total_amount,
        File? imageFile,
        //List<Uint8List>? images,
        List? title,
        List? rate,
        List? quantity,
        List? final_amount,


      }) async {

   Map<String, String> data = {
      "receivable_email": rcvEmail!,
    "company_name": company_name!,
    "company_address": company_address!,
    "company_mobile": company_mobile!,
    "company_email": company_email!,
    "vendor_name": vendor_name!,
    "vendor_address": vendor_address!,
    "vendor_mobile": vendor_mobile!,
    "payment_date": payment_date!,
    "total_amount": total_amount!,
    //"images": "" ,
    //"title": title![0],
   // "rate[]": rate![0],
    //"quantity[]": quantity![0],
   // "final_amount[]": final_amount![0],
    };
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(ApiUrl.invoiceStore);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('images[]', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart


   for (int i = 0; i < title!.length; i++) {
     request.fields['title[]'] = title[i];
     //request.fields['rate[]'] = rate[i].toString();

   }
   for (int i = 0; i < rate!.length; i++) {
     request.fields['rate[]'] = rate[i];
     //request.fields['rate[]'] = rate[i].toString();

   }
   for (int i = 0; i < quantity!.length; i++) {
     request.fields['quantity[]'] = quantity[i];
     //request.fields['rate[]'] = rate[i].toString();

   }
   for (int i = 0; i < final_amount!.length; i++) {
     request.fields['final_amount[]'] = final_amount[i];
     //request.fields['rate[]'] = rate[i].toString();

   }
   for (int i = 0; i < 1; i++) {
     request.files.add(multipartFile);
     //request.fields['rate[]'] = rate[i].toString();

   }

    request.fields.addAll(data);
   request.headers.addAll(  {
     //'X-Requested-With': 'XMLHttpRequest',
     "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
    // 'Content-Type': 'multipart/form-data',

      "Content-Type": "application/json",
     // "Accept": "application/json"

     // "Accept-Encoding": "gzip, deflate, br",
     // "Accept":"*/*",
     // "Connection": "keep-alive"


   },);
    // send
   http.Response response = await http.Response.fromStream(await request.send());
   print(response.statusCode);
   print(response.body);

   // listen for response
   // response.stream.transform(utf8.decoder).listen((value) {
   //   print("hlw everyone $value");
   //    a = value;
   // });
   // print("hlw sujkkur ${response.stream}");
   var bb = jsonDecode(response.body);
   return bb;
  }

  Future createInvoiceData(
      {
        String? rcvEmail,
        String? company_name,
        String? company_address,
        String? company_mobile,
        String? company_email,
        String? vendor_name,
        String? vendor_address,
        String? vendor_mobile,
        String? payment_date,
        String? total_amount,
        dynamic images,
        List? title,
        List? rate,
        List? quantity,
        List? final_amount,


      }
      ) async {
    List a = ['a','d', 'f'];
    List b = ['4','5', '6'];
    // print("hlw brother ++++++++++++++++++++++++${images![0].path!}");
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.invoiceStore,
      {
        "receivable_email": rcvEmail!,
        "company_name": company_name!,
        "company_address": company_address!,
        "company_mobile": company_mobile!,
        "company_email": company_email!,
        "vendor_name": vendor_name!,
        "vendor_address": vendor_address!,
        "vendor_mobile": vendor_mobile!,
        "payment_date": "22-09-23",
        "total_amount": total_amount!,
        "images": images!,
        "title[]": title![0],
        "rate[]": rate![0],
        "quantity[]": quantity![0],
        "final_amount[]": final_amount![0],
      },

      {
        //'X-Requested-With': 'XMLHttpRequest',
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        'Content-Type': 'multipart/form-data'
       // "Content-Type": "application/json",
       // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"


      },


    );
    return response;
  }

  // Future<void> sendPostRequest(
  //     {
  //       String? rcvEmail,
  //       String? company_name,
  //       String? company_address,
  //       String? company_mobile,
  //       String? company_email,
  //       String? vendor_name,
  //       String? vendor_address,
  //       String? vendor_mobile,
  //       String? payment_date,
  //       String? total_amount,
  //       dynamic images,
  //       List? title,
  //       List? rate,
  //       List? quantity,
  //       List? final_amount,
  //
  //
  //     }
  //     ) async {
  //   try {
  //     var dio = Dio();
  //     dio.interceptors.add(DioLoggingInterceptor());
  //
  //     var formData = FormData.fromMap({
  //       "receivable_email": rcvEmail!,
  //       "company_name": company_name!,
  //       "company_address": company_address!,
  //       "company_mobile": company_mobile!,
  //       "company_email": company_email!,
  //       "vendor_name": vendor_name!,
  //       "vendor_address": vendor_address!,
  //       "vendor_mobile": vendor_mobile!,
  //       "payment_date": "22-09-23",
  //       "total_amount": total_amount!,
  //       "title[]": title![0],
  //       "rate[]": rate![0],
  //       "quantity[]": quantity![0],
  //       "final_amount[]": final_amount![0],
  //       "images": await MultipartFile.fromFile(
  //         imagePath, // Replace with the actual path to your image file
  //         filename: 'image.jpg',
  //       ),
  //      // Replace with your map data
  //     });
  //
  //     var response = await dio.post(
  //       ApiUrl.invoiceStore,
  //       data: formData,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print('Post request successful');
  //       print(response.data);
  //     } else {
  //       print('Post request failed');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }


  Future createWorkOrder(      {
    String? rcvEmail,
    String? company_name,
    String? company_address,
    String? job_name,
    String? work_order_crew,
    String? work_order_crew_start,
    String? work_order_crew_end,
    String? customer_name,
    String? customer_address,
    String? com_rep_name,
    String? com_rep_email,
    String? com_rep_phone,
    String? work_order_total_amount,
    String? work_order_desc,
    String? work_order_disclaimer,
    List? work_order_metarial_qty,
    List? work_order_metarial_unit,
    List? work_order_metarial_desc,



  }) async {
    List a = ["a", "b"];
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.workorderStore,
      {
        "receivable_email": rcvEmail,
        "company_name": "Md Sukkur Ali",
        "company_address": "Mirpur Dohs",
        "job_name": "Test Job",
        "work_order_crew": "Test Crew",
        "work_order_crew_start": "2022-01-01",
        "work_order_crew_end":"2022-02-01",
        "customer_name": "Fix-era",
        "customer_address": "Usa",
        "com_rep_name": "mahbub",
        "com_rep_email": "mahbub@gmail.com",
        "com_rep_phone": "0199999999",
        "work_order_total_amount": "22",
        "work_order_desc": "iu uiui ui ui uh uhh oih9 0h0h h09 h09h 09h0h ",
        "work_order_disclaimer": "workorder disclaimer",
        "work_order_metarial_qty[]": a[0],
        "work_order_metarial_unit[]": a[0],
        "work_order_metarial_desc[]" : a[0]
      },
      {
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json",
      },
    );
    return response;
  }
  Future createEstimation(      {
    String? receiver_email,
    String? project_title,
    String? company_name,
    String? company_address,
    String? company_phone,
    String? company_representive_name,
    String? company_representive_email,
    String? company_representive_phone,
    String? estimation_description,
    String? estimation_final_amount,
    String? estimation_policy,
    List<String>? estimation_product_title,
    List<String>? estimation_card_title,
    List<String>? estimation_product_desc,
    List<String>? estimation_product_qty,
    List<String>? estimation_product_price,
    List<String>? estimation_product_total,

    String? signature


  }) async {
    List a = ["a", "b"];
    List b = ["22", "33"];
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.estimationStore,
      {
        "receiver_email": receiver_email!,
        "project_title": project_title!,
        "company_name": company_name!,
        "company_address": company_address!,
        "company_phone": company_phone!,
        "company_representive_name": company_representive_name!,
        "company_representive_email": company_representive_email!,
        "company_representive_phone": company_address,
        "estimation_description": estimation_description!,
        "estimation_product_title[]":estimation_product_title![0].toString(),
        "estimation_card_title[]": estimation_card_title![0].toString(),
        "estimation_product_desc[]":estimation_product_desc![0].toString(),
        "estimation_product_qty[]": estimation_product_qty![0],
        "estimation_product_price[]": estimation_product_price![0],
        "estimation_product_total[]": estimation_product_total![0],
        "estimation_final_amount": "400",
        "estimation_policy": estimation_policy!,
        "company_signature": signature!,
        "company_authorized_signature_date": "2021-01-01"
      },
      {
        "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "Accept": "application/json",
      },
    );
    return response;
  }
}
