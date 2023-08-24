import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/repositories/saved_rep.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import '../../../../api_provider/api_url.dart';

class InvoiceController extends GetxController {
  //TODO: Implement SplashscreenController
  var JobData = TextEditingController().obs;
  var projectTitleController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var companyAddressController = TextEditingController().obs;
  var companyPhoneController = TextEditingController().obs;
  var companyReprensentativeNameController = TextEditingController().obs;
  var companyRepJobData = TextEditingController().obs;
  var companyRepPhoneController = TextEditingController().obs;
  var estimationDescriptionController = TextEditingController().obs;
  final rcvEmail = TextEditingController().obs;
  final company_name = TextEditingController().obs;
  final company_address = TextEditingController().obs;
  final company_mobile = TextEditingController().obs;
  final company_email = TextEditingController().obs;
  final vendor_name = TextEditingController().obs;
  final vendor_address = TextEditingController().obs;
  final vendor_mobile = TextEditingController().obs;
  final payment_date = TextEditingController().obs;
  final total_amount = TextEditingController().obs;
  final images = TextEditingController().obs;
  final title = TextEditingController().obs;
  final rate = TextEditingController().obs;
  final quantity = TextEditingController().obs;
  final final_amount = TextEditingController().obs;
  final titleListData = [].obs;
  final rateListData = [].obs;
  final quantityListData = [].obs;
  final final_amountListData = [].obs;
  final priceListOfSum = <int>[].obs;
  final visible = 0.obs;
  final checkLabour = false.obs;
  final checkMaterial = false.obs;
  // image
  var cropImagePath = ''.obs;
  var myFormat = DateFormat('yyyy-MM-dd');
  var cropImageSize = ''.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var imageData = "".obs;
  late File imageFIle;
  final imageList = [].obs;
  // Crop code
  DateTime? selectedDay;
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  TextEditingController dateInput = TextEditingController();
  var endDate = ''.obs;
  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  final material = <TextFieldDataInvoice>[].obs;
  @override
  Future<void> onInit() async {
    material.add(TextFieldDataInvoice());
    priceListOfSum.clear();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  void quantityList(int index, int value) {
    material[index].quantity = value;
    quantityListData.add(value.toString());
  }
  void rateList(int index, int value) {
    material[index].rate = value;
    rateListData.add(value.toString());
  }

  void priceList(int index, int value,) {

    material[index].price = value;
    for(var a = 0 ; a <= material.length ; a++){

    }
    //priceListOfSum.add(controller);
    final_amountListData.add(value.toString());
  //  print("hlw sukkur ______________111${priceListOfSum.toString()}");
    int a = material.value.fold(0, (previousValue, element) => previousValue + element.price);
    print("hlw sukkur _________222_____$a");
    total_amount.value.text = a.toString();
  }

  void productTitleList(int index, String value) {
    material[index].title = value;
    titleListData.add(value);
  }
  Future<void> selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
    }
    dateInput.text = "${myFormat.format(selectedCheckinDate)}";
  }
  createInvoiceController() {
    visible.value++;
    SavedRepRepository().upload(
      rcvEmail: rcvEmail.value.text,
      company_name: company_name.value.text,
      company_address: company_address.value.text,
      company_mobile: company_mobile.value.text,
      company_email: company_email.value.text,
      vendor_name: vendor_name.value.text,
      vendor_address: vendor_address.value.text,
      vendor_mobile: vendor_mobile.value.text,
      payment_date: dateInput.value.text,
      total_amount: total_amount.value.text,
     imageFile: imageList[0],
     // images: imageList,
      title: titleListData.value,
      rate: rateListData.value,
      quantity: quantityListData.value,
      final_amount: final_amountListData.value,
    ).then((value) {
      if (value["error"] == false) {
        Get.showSnackbar(Ui.successSnackBar(
            message:value["results"]["message"], title: 'Success'.tr));
        clearDataController();
        visible.value = 0;

      } else {
        Get.showSnackbar(Ui.errorSnackBar(
            message:value["message"], title: 'Error'.tr));
        visible.value = 0;
      }
      print("create invoice++++++ ${value}");
    });
  }
clearDataController(){
   rcvEmail.value.clear();
   company_name.value.clear();
   company_address.value.clear();
   company_mobile.value.clear();
   company_email.value.clear();
   vendor_name.value.clear();
   vendor_address.value.clear();
   vendor_mobile.value.clear();
   dateInput.clear();
    title.value.clear();
    rate.value.clear();
    quantity.value.clear();
   total_amount.value.clear();
   imageData.value == "";

  imageList.value.clear();
}
  Future<Uint8List> imageFileToUint8List(File imageFile) async {
    Uint8List uint8list = await imageFile.readAsBytes();
    return uint8list;
  }

  void getImage(ImageSource imageSource) async {
    selectedImagePath = ''.obs;
    selectedImageSize = ''.obs;

    // Crop code
    cropImagePath = ''.obs;
    cropImageSize = ''.obs;

    // Compress code
    compressImagePath = ''.obs;
    compressImageSize = ''.obs;

    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      print("my invoice image list is 111 ${imageList.value}");
      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      print("my invoice image list is 2222 ${imageList.value}");
      // Compress
      print('compress path: ${cropImagePath.value}');
      final dir = Directory.systemTemp;
      final targetPath =
          '${dir.absolute.path}/${cropImagePath.value.split('/').last}';
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 100, keepExif: false, autoCorrectionAngle: true, rotate: 0);
      print("my invoice image list is 3333 ${imageList.value}");
      compressImagePath.value = compressedFile!.path;
      print("my invoice image list is 4444 ${imageList.value}");
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      List<int> bytes = compressedFile.readAsBytesSync();
      imageData.value = base64Encode(bytes);
      print("my invoice image list is 5555 ${compressImagePath.value}");
      imageList.clear();
      print("my invoice image list is 66666 ${compressImagePath.value}");
      imageList.add(File(compressImagePath.value));
      print("my invoice image list is 777 ${imageList.value}");

      // uploadImage(compressedFile);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}

class TextFieldDataInvoice {
  int rate;
  String title;
  int quantity;
  int price;

  TextFieldDataInvoice(
      {this.rate = 0,
      this.title = '',
      this.quantity = 0,
        this.price =0,
      });
}
