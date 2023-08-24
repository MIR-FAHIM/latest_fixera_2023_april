import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latest_fixera_2023/api_provider/api_exception.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';


class APIManager {
  Future<dynamic> postAPICallWithHeader(String url, Map<String, dynamic> param, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param, headers: headerData);
      print("api provider bro bro bro bro ${response.body}");
      var data = jsonDecode(response.body);
      if(response.statusCode == 422){
        Get.showSnackbar(Ui.errorSnackBar(
            message:data["message"], title: 'Error'.tr));
       return data;
      } else if (response.statusCode == 400){
        Get.showSnackbar(Ui.errorSnackBar(
            message:data["message"], title: 'Error'.tr));
      } else if (response.statusCode == 500){
        Get.showSnackbar(Ui.errorSnackBar(
            message:data["message"], title: 'Error'.tr));
      }
      responseJson = _response(response);

      print("hlw bro ++++++++++++++++++++$responseJson");
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postAPICall(String url, var param, {var header}) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param, headers: header);
      if(response.statusCode ==  200 ){
        responseJson = _response(response);
        print('APIManager.postAPICall');
        print(responseJson);
      } else {
        return null;
      }

    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multipartPostAPI(
      String url,
      Map<String, String> param,
  List imageBytesList,
      Map<String, String> headerData,
      String parameterName,
      ) async {
    print("Calling API: $url");
    print("Calling parameters: ${param}");
   // print(images);
    print(headerData);

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);
      print("Calling API 111111: $url");
      if (imageBytesList.isNotEmpty) {
        for (var item in imageBytesList) {
          String fileName = item.path.split("/").last;
          var stream = http.ByteStream(item.openRead());

          stream.cast();
          print("Calling API 2222222: $url");
          print(stream);
          // get file length

          var length = await item.length(); //imageFile is your image file

          print("image file name is $length");

          // multipart that takes file
          var multipartFileSign = http.MultipartFile("images", stream, length, filename: fileName);

          request.files.add(multipartFileSign);
        }
      } else {
        print("no image found in invoice create");
      }

      print('fgdf');


      if (headerData.isNotEmpty) {
        print('APIManager.multipartPostAPI 2');
        request.headers.addAll(headerData);
      }
      print('APIManager.multipartPostAPI 3');

      http.StreamedResponse streamedResponse = await request.send();
      print('APIManager.multipartPostAPI 4');
      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      responseJson = _response(response);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url,  Map<String, String> headerData) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headerData);
      print("my getWithHeader method data response ${response.body}");
      responseJson = _response(response);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print('APIManager._response');
    print(response);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating with Server with StatusCode: ${response.statusCode}');
    }
  }
}
