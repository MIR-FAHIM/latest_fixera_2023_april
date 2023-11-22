import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/success_page_signUp.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class VerificationViewForReset extends GetView<AuthController> {
  const VerificationViewForReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Verification"),
        centerTitle: true,


      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 10,
                      backgroundColor: controller.pageState.value == 0 ? AppColors.textColorGreen: Colors.grey
                  ),
                  SizedBox(width: 5,),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: controller.pageState.value == 1? AppColors.textColorGreen:Colors.grey,
                  ),
                  SizedBox(width: 5,),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor:controller.pageState.value == 2?AppColors.textColorGreen:Colors.grey ,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("OTP Verification Code", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),
              Center(child: Text("We have sent an OTP verification", style: TextStyle(fontSize: 20, color: AppColors.textColorGreen, fontWeight: FontWeight.normal),)),
              Center(child: Text(" code to your Email", style: TextStyle(fontSize: 20, color: AppColors.textColorGreen, fontWeight: FontWeight.normal),)),

              SizedBox(height: 20,),
              AnimatedContainer(
                duration: Duration(seconds: 2),
                height:  40,
                width: MediaQuery.of(context).size.width *.5,
                decoration: BoxDecoration(
                    color: AppColors.textColorGreen,
                    borderRadius:
                    BorderRadius.circular( 40)),
                alignment: Alignment.center,
                child:  Text(
                  controller.email.value.text,
                  style: TextStyle(
                    color: AppColors.backgroundColor,
                    fontSize: 12,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30,
                  ),
                  child: PinCodeTextField(

                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: true,
                    obscuringCharacter: '*',
                    obscuringWidget: const FlutterLogo(
                      size: 24,
                    ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveColor: Colors.white,
                      inactiveFillColor: AppColors.textColorBlack.withOpacity(.5),
                      selectedFillColor: AppColors.textColorBlack,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: controller.pinErrorController,
                    controller: controller.pinCodeController.value,
                    keyboardType: TextInputType.text,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);

                      //currentText = value;

                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  controller.verifyResetEmailOtpController();


                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: controller.resetOtpLoad.value == 1 ? 50 : 60,
                  width: controller.resetOtpLoad.value == 1 ? 50 : 140,
                  decoration: BoxDecoration(
                      color: AppColors.ccsYelow,
                      borderRadius:
                      BorderRadius.circular(controller.resetOtpLoad.value == 1 ? 60 : 10)),
                  alignment: Alignment.center,
                  child: controller.resetOtpLoad.value == 1
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                    "Verify OTP",
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),



            ],
          ),


        ),
      ),
    );
  }
}

