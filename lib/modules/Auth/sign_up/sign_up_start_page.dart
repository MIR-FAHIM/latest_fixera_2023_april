import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/professional_info.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUpStratView extends GetView<AuthController> {
  const SignUpStratView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 10,
                        backgroundColor: controller.pageState.value == 0
                            ? AppColors.textColorGreen
                            : Colors.grey),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: controller.pageState.value == 1
                          ? AppColors.textColorGreen
                          : Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: controller.pageState.value == 2
                          ? AppColors.textColorGreen
                          : Colors.grey,
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "CCS Asia",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ccsYelow),
                  ),
                ),

                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  // color: AppColors.backgroundColor,
                  child: Text(
                    "Join For a Good Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // color: AppColors.backgroundColor,
                  child: Text(
                    "Join for a good reason & benefit Yourself!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textColorGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),

                //***** for fixera
                // Container(
                //   alignment: Alignment.center,
                //   // color: AppColors.backgroundColor,
                //   child: Image.asset(
                //     'images/fixera_logo.png',
                //     height: 40,
                //   ),
                // ),
                // ****** fixera end
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          maxLines: 1,
                          controller: controller.nameController.value,
                          decoration: new InputDecoration(
                            labelText: 'First Name',
                            suffixIcon: Icon(
                              Icons.description,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Email is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 1,
                          controller: controller.lastNameController.value,
                          decoration: new InputDecoration(
                            labelText: 'Last Name',
                            suffixIcon: Icon(
                              Icons.description,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Email is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 1,
                          controller: controller.email.value,
                          decoration: new InputDecoration(
                            labelText: 'Email',
                            suffixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Email is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .3,
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.textColorWhite.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(.5),
                                    width: 1,
                                  ),
                                ),
                                child: CountryCodePicker(
                                  onChanged: print,
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: 'IT',
                                  favorite: const ['+39', 'FR'],
                                  countryFilter: const [
                                    'IT',
                                    'FR',
                                    "af",
                                    "am",
                                    "ar",
                                    "az",
                                    "be",
                                    "bg",
                                    "bn",
                                    "bs",
                                    "ca",
                                    "cs",
                                    "da",
                                    "de",
                                    "el",
                                    "en",
                                    "es",
                                    "et",
                                    "fa",
                                    "fi",
                                    "fr",
                                    "gl",
                                    "ha",
                                    "he",
                                    "hi",
                                    "hr",
                                    "hu",
                                    "hy",
                                    "id",
                                    "is",
                                    "it",
                                    "ja",
                                    "ka",
                                    "kk",
                                    "km",
                                    "ko",
                                    "ku",
                                    "ky",
                                    "lt",
                                    "lv",
                                    "mk",
                                    "ml",
                                    "mn",
                                    "ms",
                                    "nb",
                                    "nl",
                                    "nn",
                                    "no",
                                    "pl",
                                    "ps",
                                    "pt",
                                    "ro",
                                    "ru",
                                    "sd",
                                    "sk",
                                    "sl",
                                    "so",
                                    "sq",
                                    "sr",
                                    "sv",
                                    "ta",
                                    "tg",
                                    "th",
                                    "tk",
                                    "tr",
                                    "tt",
                                    "uk",
                                    "ug",
                                    "ur",
                                    "uz",
                                    "us",
                                    "sg",
                                    "my",
                                    "vi",
                                    "zh"
                                  ],
                                  // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                                  flagDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controller.phoneController.value,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    labelText: 'Phone Number',
                                    suffixIcon: Icon(
                                      Icons.phone,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty)
                                      return "Email is Required";
                                    else if (!GetUtils.isEmail(value.trim()))
                                      return "Please enter valid email";
                                    else
                                      return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //controller.getSignUPDataListControlelr();
                    // controller.sendOTP(context);

                    controller.checkEmailExist();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 60,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: AppColors.ccsYelow,
                        borderRadius: BorderRadius.circular(
                            controller.visible.value == 1 ? 60 : 10)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Continue",
                            style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                Spacer(),
                Container(
                    height: 30,
                    width: Get.width,
                    color: AppColors.primaryColor,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Login Account",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    )))
              ],
            ),
          ),
        );
      }),
    );
  }
}
