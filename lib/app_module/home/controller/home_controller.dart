import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/bottom_tabs/learning_modules/model/learning_model.dart';
import 'package:validation/app_module/bottom_tabs/profile/model/profile_model.dart';
import 'package:validation/app_module/cliften_profile/model/theme_model.dart';
import 'package:validation/services/api_manager.dart';
import 'package:validation/utils/Widgets/helper_function.dart';


class HomeController extends GetxController {



  var userId = "".obs;
  var userName = "".obs;
  var name = "".obs;
  var isleaveLoading = false.obs;
  var email = "".obs;
  var company = "".obs;
  var family = "".obs;
  var image = "".obs;
  var isLoading = false.obs;

  ProfileData ? profileData;

  clearSave(){
    userId = "".obs;
    userName = "".obs;
    name = "".obs;
    email = "".obs;
    company = "".obs;
    family = "".obs;
    image = "".obs;
  }



  @override
  Future<void> onInit() async {

    HelperFunctions.getFromPreference("id").then((value) {
      userId.value = value;
      profileDataAll(userId.value);
      debugPrint(userId.value);
      update();
    });
    HelperFunctions.getFromPreference("image").then((value) {
      image.value = value;
      debugPrint(image.value);
      update();
    });

    HelperFunctions.getFromPreference("name").then((value) {
      name.value = value;
      debugPrint("name.value");
      debugPrint(name.value);
      update();
    });
    HelperFunctions.getFromPreference("userName").then((value) {
      userName.value = value;
      debugPrint(userName.value);
      update();
    });
    HelperFunctions.getFromPreference("email").then((value) {
      email.value = value;
      debugPrint("email.value");
      debugPrint(email.value);
      update();
    });
    HelperFunctions.getFromPreference("family").then((value) {
      family.value = value;

      debugPrint(family.value);
      update();
    });
    HelperFunctions.getFromPreference("company").then((value) {
      company.value = value;
      debugPrint(company.value);
      update();
    });


    super.onInit();
    getVideoData();
    getThemeData();
  }


profileDataAll(id) async {
    try {
      isLoading(true);
      update();

      var profData = await ApiManger.getProfileResponse(id: id);
      if (profData != null) {
        profileData = profData.data;



        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
      update();
    }
    update();
  }

  var videoList = <VideoDataModel>[].obs;
  var themeList = <ThemeDataModel>[].obs;
  getVideoData() async {
    try {
      isleaveLoading(true);
      update();

      var profData = await ApiManger.videoResponse();
      if (profData != null) {
        videoList.value = profData.data as dynamic;
        print("This is videoList ${profData.data?.length}");

      } else {
        isleaveLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isleaveLoading(false);
      update();
    }
    update();
  }
  getThemeData() async {
    try {
      isleaveLoading(true);
      update();

      var profData = await ApiManger.themeResponse();
      if (profData != null) {
        themeList.value = profData.data as dynamic;
        print("This is videoList ${profData.data?.length}");

      } else {
        isleaveLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isleaveLoading(false);
      update();
    }
    update();
  }
}

