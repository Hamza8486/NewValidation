// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/authentication/login/login_view.dart';
import 'package:validation/app_module/bottom_tabs/profile/component/new_password.dart';
import 'package:validation/app_module/bottom_tabs/profile/component/widget.dart';
import 'package:validation/app_module/bottom_tabs/profile/controller/profile_controller.dart';
import 'package:validation/app_module/cliften_profile/view/select_profile.dart';
import 'package:validation/app_module/home/controller/home_controller.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/exit_app_dialoge.dart';
import 'package:validation/utils/Widgets/helper_function.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var profileController = Get.put(ProfileController());
  var homeController = Get.put(HomeController());

  var emailController = TextEditingController();

  var familyController = TextEditingController();

  var nameController = TextEditingController();

  var passController = TextEditingController();

  var profileUserController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      emailController.text = homeController.email.value;
      familyController.text = homeController.family.value;
      nameController.text = homeController.company.value;
      passController.text = "**********";
      profileUserController.text = "Profile Name";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.03),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            Center(
              child: AppText(
                title: "My Profile",
                color: AppColor.primaryColor,
                size: AppSizes.SIZE_19,
                fontFamily: Weights.semi,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Expanded(child: SingleChildScrollView(
              child: Obx(() {
                return Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 1.5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          homeController.image.value,
                          fit: BoxFit.fill,
                          errorBuilder: (context, exception, stackTrace) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/person.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    AppText(
                      title: homeController.name.value,
                      color: AppColor.onboardText,
                      size: AppSizes.SIZE_17,
                      fontFamily: Weights.semi,
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    AppText(
                      title: homeController.email.value,
                      color: AppColor.onboardText,
                      size: AppSizes.SIZE_12,
                      fontFamily: Weights.regular,
                    ),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                    fieldWidget(familyController, "Family Name", () {},Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    fieldWidget(emailController, "Email address", () {},Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    fieldWidget(nameController, "company Name", () {},Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Obx(
                      () {
                        return fieldWidget(passController, "Change password", () {
                          Get.to(ChangePassword(id: homeController.userId.value,));
                        },

                            homeController.userId.value.isEmpty?AppColor.onboardText.withOpacity(0.5):
                            AppColor.onboardText.withOpacity(0.5));
                      }
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    fieldWidget(
                        profileUserController, "CliftonStrengths profile", () {
                      Get.to(SelectProfile());
                    },
                    AppColor.onboardText.withOpacity(0.5)),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {
                        showExit(
                            context: context,
                            onTap: () async {
                              setState(() {
                                HelperFunctions.clearPrefs();
                                homeController.clearSave();

                                Get.offAll(LoginView());
                              });
                            });
                      },
                      child: Container(

                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.primaryColor, width: 1.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: Get.height * 0.018),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/logOut.svg",color: AppColor.primaryColor,),
                              SizedBox(
                                width: Get.width * 0.03,
                              ),
                              AppText(
                                title: "Log Out",
                                size: AppSizes.SIZE_14,
                                fontFamily: Weights.bold,
                                color: AppColor.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}
