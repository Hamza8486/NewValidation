import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
import 'package:validation/app_module/authentication/forget_password/new_password.dart';
import 'package:validation/app_module/authentication/login/login_view.dart';
import 'package:validation/app_module/authentication/model/code.dart';
import 'package:validation/app_module/authentication/otp_verify/opt_verify.dart';
import 'package:validation/app_module/bottom_tabs/learning_modules/model/learning_model.dart';
import 'package:validation/app_module/bottom_tabs/profile/model/profile_model.dart';
import 'package:validation/app_module/cliften_profile/model/theme_model.dart';
import 'package:validation/app_module/home/view/home_view.dart';
import 'package:validation/services/api_constants.dart';
import 'package:validation/utils/Widgets/exit_app_dialoge.dart';
import 'package:validation/utils/Widgets/helper_function.dart';

class ApiManger extends GetConnect {
  static var client = http.Client();

  static Uri uriPath({required String nameUrl}) {
    return Uri.parse(ApiConstants.baseURL + nameUrl);
  }


  //...........................Authentication----------------------------------//


  //...........Register.........................
  final authController = Get.put(AuthController());
  registerResponse({required BuildContext context,token}) async {

    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'name': authController.regNameController.text,
          'username': authController.regUserNameController.text,
          'email': authController.regEmailController.text,
          'family_name': authController.regFamController.text,
          'company_name':authController.regCompController.text,
          'password':authController.regPasswordController.text,
          'password_confirmation': authController.regPasswordController.text,
          'device_token': token,
          'image'
              : await dio.MultipartFile.fromFile(authController.file!.path),
        });

        var response = await dio.Dio().post(
          ApiConstants.baseURL + ApiConstants.registerURI,
          data: data,
        );
        debugPrint(response.toString());
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {

          Get.back();
          // authController.clearReg();
          Get.to( VerifyOtp(id:response.data["data"]["id"].toString(),
          email:response.data["data"]["email"] ,
          ));
          flutterToast(msg:"Please verify your email address" );
          debugPrint(response.data["data"]["id"].toString());
        } else if(response.statusCode == 202) {
          Get.back();
          flutterToast(msg:response.data["error"].toString() );
          print("object");
        }
      } on dio.DioError catch (e) {
        Get.back();
        flutterToast(msg:e.response?.data.toString() );


        debugPrint("e.response");
        debugPrint("e.response");
        debugPrint("e.response");
        debugPrint(e.response?.data.toString());
      }
    } on dio.DioError catch (e) {
      print(e.toString());
    }
  }

  //...........Login.........................

  loginResponse({required BuildContext context,token}) async {
    try {
        dio.FormData data = dio.FormData.fromMap({
          'username': authController.loginEmailController.text,
          'password': authController.loginPasswordController.text,
          'device_token': token,
        });

        var response = await dio.Dio().post(
          ApiConstants.baseURL + ApiConstants.loginURI,
          data: data,
        );
        debugPrint(response.toString());
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {

          HelperFunctions.saveInPreference(
              "id", response.data['data']['id'].toString());
          HelperFunctions.saveInPreference(
              "email", response.data['data']['email']);
          HelperFunctions.saveInPreference(
              "family", response.data['data']['family_name']);
          HelperFunctions.saveInPreference(
              "company", response.data['data']['company_name']);
          HelperFunctions.saveInPreference(
              "image", response.data['data']['image']);
          HelperFunctions.saveInPreference(
              "name", response.data['data']['name']);
          HelperFunctions.saveInPreference(
              "userName", response.data['data']['username']);


       Get.offAll(HomeView());
          flutterToastSuccess(msg:"Successfully Login" );
          debugPrint(response.data["data"]["id"].toString());
        } else if(response.statusCode == 202) {
          Get.back();
          flutterToast(msg:response.data["message"].toString() );
          print("object");
        }
        else if(response.statusCode == 404) {
          Get.back();

          print("object");
        }
      } on dio.DioError catch (e) {
        Get.back();
        flutterToast(msg:e.response?.data["error"].toString() );


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }

  }

  //...........Resend Code.........................



  //...........Resend Code.........................

  static Future<GetCode?> resendResponse({required BuildContext context, id}) async {
    var response = await client.get(
      uriPath(nameUrl: "${ApiConstants.sendEmailUrl}?id=$id"),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      Get.back();
      flutterToastSuccess(msg: "Code Recent Successfully");
      var jsonString = response.body;

      return getCodeFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
  static Future<GetVideos?> videoResponse() async {
    var response = await client.get(
      uriPath(nameUrl: ApiConstants.video),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {

      var jsonString = response.body;

      return getVideosFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }


  static Future<ThemeList?> themeResponse() async {
    var response = await client.get(
      uriPath(nameUrl: ApiConstants.domain),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {

      var jsonString = response.body;

      return themeListFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }


  // resendResponse({required BuildContext context, id}) async {
  //   try {
  //
  //     var response = await dio.Dio().get(
  //       "${ApiConstants.baseURL + ApiConstants.sendEmailUrl}?id=$id",
  //
  //     );
  //     debugPrint(response.toString());
  //     debugPrint(response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       Get.back();
  //       flutterToast(msg: "Code Recent Successfully");
  //     } else {
  //       Get.back();
  //     }
  //   } on dio.DioError catch (e) {
  //     // Get.back();
  //     flutterToast(msg: "error");
  //
  //     debugPrint("e.response");
  //     debugPrint(e.response.toString());
  //   }
  // }

  //...........Verify Code.........................


  verifyResponse({required BuildContext context,id,textCode}) async {


      try {
        dio.FormData data = dio.FormData.fromMap({
          'id': id,
          'verification_code': textCode,
        });

        var response = await dio.Dio().post(
          ApiConstants.baseURL + ApiConstants.verifyEmailURI,
          data: data,
        );
        debugPrint(response.toString());
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {
          Get.back();
          Get.offAll( LoginView(
          ));
          flutterToastSuccess(msg:"Account created successfully" );
        } else if(response.statusCode == 202) {
          Get.back();
          flutterToast(msg:response.data["error"].toString() );
          print("object");
        }
      } on dio.DioError catch (e) {
        Get.back();
        flutterToast(msg:e.response?.data["error"].toString() );


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }

  }



  //...........Verify Forget Code.........................


  verifyForget({required BuildContext context,id,textCode}) async {


    try {
      dio.FormData data = dio.FormData.fromMap({
        'id': id,
        'forgot_password_code': textCode,
      });

      var response = await dio.Dio().post(
        ApiConstants.baseURL + ApiConstants.verifyForgetCodeURI,
        data: data,
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        Get.offAll( NewPassword(
          id:response.data["data"]["id"].toString() ,
        ));

        flutterToast(msg:"Please set your password" );
      } else if(response.statusCode == 202) {
        Get.back();
        flutterToast(msg:response.data["error"].toString() );
        print("object");
      }
    } on dio.DioError catch (e) {
      Get.back();
      flutterToast(msg:e.response?.data["error"].toString() );


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }

  }

  //...........Forget Password.........................

  forgetResponse() async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'email': authController.forgetEmailController.text,
      });

      var response = await dio.Dio().post(
        ApiConstants.baseURL + ApiConstants.forgetUrl,
        data: data,
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.off(VerifyOtp(
          email: authController.forgetEmailController.text,
          id:response.data["id"].toString() ,

        ));
        flutterToast(msg:"Please verify your email address" );
        debugPrint(response.data["data"]["id"].toString());
      } else if(response.statusCode == 202) {
        Get.back();
        flutterToast(msg:response.data["error"].toString() );
        print("object");
      }
      else if(response.statusCode == 404) {
        Get.back();

        print("object");
      }
    } on dio.DioError catch (e) {
      Get.back();
      flutterToast(msg:e.response?.data["error"].toString() );


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }

  }


  //...........New Password.........................


  newPassword({required BuildContext context,id,pass,confirm}) async {


    try {
      dio.FormData data = dio.FormData.fromMap({
        'id': id,
        'password': pass,
        'password_confirmation': confirm,
      });

      var response = await dio.Dio().post(
        ApiConstants.baseURL + ApiConstants.newPassword,
        data: data,
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        Get.offAll( LoginView(
        ));
        authController.clearForget();
        flutterToastSuccess(msg:"Password reset successfully, please sign in" );
      } else if(response.statusCode == 202) {
        Get.back();
        flutterToast(msg:response.data["error"].toString() );
        print("object");
      }
    } on dio.DioError catch (e) {
      Get.back();
      flutterToast(msg:e.response?.data["error"].toString() );


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }

  }


  newPassword1({required BuildContext context,id,pass,confirm}) async {


    try {
      dio.FormData data = dio.FormData.fromMap({
        'id': id,
        'password': pass,
        'password_confirmation': confirm,
      });

      var response = await dio.Dio().post(
        ApiConstants.baseURL + ApiConstants.newPassword,
        data: data,
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();

        authController.clearForget();
        flutterToastSuccess(msg:"Password changed successfully" );
      } else if(response.statusCode == 202) {
        Get.back();
        flutterToast(msg:response.data["error"].toString() );
        print("object");
      }
    } on dio.DioError catch (e) {
      Get.back();
      flutterToast(msg:e.response?.data["error"].toString() );


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }

  }


  static Future<GetProfileResponse?> getProfileResponse({id}) async {
    var response = await client.get(
        uriPath(nameUrl: "${ApiConstants.profileUrl}/$id"),
     );
    if (response.statusCode == 200) {
      print("Hamza Profile${response.body}");
      var jsonString = response.body;
      return getProfileResponseFromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }

}
