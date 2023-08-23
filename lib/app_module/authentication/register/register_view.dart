
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
import 'package:validation/services/api_manager.dart';
import 'package:validation/utils/Widgets/app_button.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/back_button.dart';
import 'package:validation/utils/Widgets/exit_app_dialoge.dart';
import 'package:validation/utils/Widgets/helper_function.dart';
import 'package:validation/utils/Widgets/image_picker_sheet.dart';
import 'package:validation/utils/Widgets/validate_field.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/loader/loader.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();

  String ? token;
  void getToken() async{
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    HelperFunctions.saveInPreference("token", token!);
    print("token");
    print(token);
  }
  final authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    print("token");
    print(token);
    final isKeyBorad = MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            Row(
              children: [
                backButton(
                    color: AppColor.backColor,
                    onTap: () {
                      Get.back();
                      authController.clearForget();
                      authController.clearLogin();
                      authController.clearReg();
                    }),
                SizedBox(
                  width: Get.width * 0.26,
                ),
                AppText(
                  title: "SignUp",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_18,
                  fontFamily: Weights.semi,
                ),
                const SizedBox()
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      AppText(
                        title: "User Details",
                        color: AppColor.onboardText,
                        size: AppSizes.SIZE_17,
                        fontFamily: Weights.medium,
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      AppText(
                        title: "Provide the details register your account",
                        color: AppColor.greyColor,
                        size: AppSizes.SIZE_10,
                        fontFamily: Weights.regular,
                      ),
                      SizedBox(height: Get.height*0.03,),

                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              backgroundColor:
                              Colors.transparent,
                              context: context,
                              builder: (builder) =>
                                  bottomSheet(
                                      onCamera: (){
                                        Navigator.pop(context);
                                        HelperFunctions.pickImage(
                                            ImageSource.camera)
                                            .then((value) {
                                          setState(() {
                                            authController.file = value;
                                            debugPrint(authController.file.toString());

                                          });
                                        });
                                      },
                                      onGallery: (){
                                        Navigator.pop(context);
                                        HelperFunctions.pickImage(
                                            ImageSource.gallery)
                                            .then((value) {
                                          setState(() {
                                            authController.file = value;
                                            debugPrint(authController.file.toString());
                                          });
                                        });
                                      }

                                  ));
                        },
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height * 0.14,
                          child: Stack(
                            children: [
                              Center(
                                child: Material(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(
                                          MediaQuery.of(context).size.height * 0.1)),
                                      side:
                                      BorderSide(color: AppColor.primaryColor)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.14,
                                    width: MediaQuery.of(context).size.height * 0.14,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MediaQuery.of(context).size.height *
                                                    0.1))),

                                    child: ClipRRect(
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(1000)),
                                        child: authController.file == null
                                            ? Image.asset(

                                          "assets/images/person.png",
                                          fit: BoxFit.cover,
                                        )
                                            : Image.file(authController.file as File,
                                          fit: BoxFit.cover,)

                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: Get.width * 0.53,
                                  top: Get.height * 0.1,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppColor.primaryColor,
                                    child: Icon(
                                      Icons.add,
                                      color: AppColor.whiteColor,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height*0.02,),
                      ValidateField(
                        autovalidateMode:  AutovalidateMode.onUserInteraction,
                        isborderline: true,
                        isborderline2: true,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter username';
                          }
                          if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                            return 'Please enter valid username';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),
                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Username",
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        controller: authController.regUserNameController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),
                      SizedBox(height: Get.height*0.02,),
                      ValidateField(
                        autovalidateMode:  AutovalidateMode.onUserInteraction,
                        isborderline: true,
                        isborderline2: true,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter name';
                          }
                          if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                            return 'Please enter valid name';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),
                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Name",
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        controller: authController.regNameController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),
                      SizedBox(height: Get.height*0.02,),
                      ValidateField(
                        autovalidateMode:  AutovalidateMode.onUserInteraction,
                        isborderline: true,
                        isborderline2: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),
                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Email",
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,

                        controller: authController.regEmailController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),
                      SizedBox(height: Get.height*0.02,),
                      ValidateField(
                        autovalidateMode:  AutovalidateMode.onUserInteraction,
                        isborderline: true,
                        isborderline2: true,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter family name';
                          }
                          if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                            return 'Please enter valid family name';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),
                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Family name",
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        controller: authController.regFamController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),
                      SizedBox(height: Get.height*0.02,),
                      ValidateField(
                        autovalidateMode:  AutovalidateMode.onUserInteraction,
                        isborderline: true,
                        isborderline2: true,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter company name';
                          }
                          if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                            return 'Please enter valid company name';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),
                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Company name",
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        controller: authController.regCompController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Obx(() {
                        return ValidateField(
                          autovalidateMode:  AutovalidateMode.onUserInteraction,
                          isborderline: true,
                          obsecure: authController.isVisible1.value,
                          controller: authController.regPasswordController,
                          isborderline2: true,

                          padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                          isVisible: true,
                          isSuffix: true,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              authController.updateVisibleStatus1();
                            },
                            child: Icon(
                                authController.isVisible1.value ? Icons.visibility_off : Icons.visibility,
                                size: Get.height*0.022,
                                color: AppColor.hintColor),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          borderRadius2: BorderRadius.circular(10),
                          hint: "Password",

                          borderColor:AppColor.borderColor,
                          borderColor2: AppColor.yellowColor,
                          maxLines: 1,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          hintColor: AppColor.hintColor,
                          hintSize: AppSizes.SIZE_13,
                          validator: ( value){
                            if(value!.isEmpty)
                            {
                              return 'Please enter password';
                            }
                            if(value.length<8)
                            {
                              return 'Password must be greater then 8 character';
                            }
                            return null;
                          },
                        );
                      }
                      ),

                    ],
                  ),
                ),
              ),
            ),
            if(!isKeyBorad)
              SizedBox(
                height: Get.height * 0.015,
              ),
            if(!isKeyBorad)
            AppButton(
                buttonName: "Sign Up",
                buttonColor: AppColor.primaryColor,
                buttonRadius: BorderRadius.circular(10),
                buttonWidth: Get.width,
                fontFamily: Weights.semi,
                textColor: AppColor.whiteColor,
                onTap: () {
                  if(validateAuth(context)){
                    if (formKey.currentState!.validate()) {
                      showLoadingIndicator(context: context);
                      ApiManger().registerResponse(context: context,token: token);

                      return;
                    }
                  }

                }),

          ],
        ),
      ),
    );
  }

  bool validateAuth(BuildContext context) {

    if (authController.file==null) {
     flutterToast(msg: "please select image");
      return false;
    }
    return true;
  }
}
