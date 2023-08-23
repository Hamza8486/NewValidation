// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/bottom_tabs/dashboard/view/dashboard_view.dart';
import 'package:validation/app_module/bottom_tabs/learning_modules/view/learning_view.dart';
import 'package:validation/app_module/bottom_tabs/profile/view/profile_view.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int currentTab = 0;
  List<Widget> screens=[
    DashboardView(),
    LearningView(),
    Container(),
    ProfileView(),

  ];






  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(



      body: screens[currentTab],




      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border: Border(top: BorderSide(color: AppColor.bottomColor.withOpacity(0.3), width: 0.5)),
          ),

          height: Get.height*0.078,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.06,vertical: Get.height*0.014),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentTab = 0 ;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ImageIcon(
                            AssetImage(
                              "assets/icons/home.png",
                            ),
                            size: Get.height * 0.028,

                          color: currentTab == 0
                              ? AppColor.primaryColor
                              : AppColor.bottomColor.withOpacity(0.6),),
                        SizedBox(height: Get.height*0.005,),
                        AppText(title: "Home",
                        color:currentTab == 0
                            ? AppColor.primaryColor
                            : AppColor.bottomColor.withOpacity(0.6),
                          fontFamily: Weights.medium,
                          size: AppSizes.SIZE_10,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentTab = 1 ;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage(
                            "assets/icons/box.png",
                          ),
                          size: Get.height * 0.028,

                          color: currentTab == 1
                              ? AppColor.primaryColor
                              : AppColor.bottomColor.withOpacity(0.6),),
                        SizedBox(height: Get.height*0.005,),
                        AppText(title: "Modules",
                          color:currentTab == 1
                              ? AppColor.primaryColor
                              : AppColor.bottomColor.withOpacity(0.6),
                          fontFamily: Weights.medium,
                          size: AppSizes.SIZE_10,
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentTab = 2 ;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage(
                            "assets/icons/sidebar.png",
                          ),
                          size: Get.height * 0.028,

                          color: currentTab == 2
                              ? AppColor.primaryColor
                              : AppColor.bottomColor.withOpacity(0.6),),
                        SizedBox(height: Get.height*0.005,),
                        AppText(title: "Journal",
                          color:currentTab == 2
                              ? AppColor.primaryColor
                              : AppColor.bottomColor.withOpacity(0.6),
                          fontFamily: Weights.medium,
                          size: AppSizes.SIZE_10,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentTab = 3 ;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage(
                            "assets/icons/users.png",
                          ),
                          size: Get.height * 0.028,

                          color: currentTab == 3
                              ? AppColor.primaryColor
                              : AppColor.bottomColor.withOpacity(0.6),),
                        SizedBox(height: Get.height*0.005,),
                        AppText(title: "Profile",
                          color:currentTab == 3
                              ? AppColor.primaryColor
                              :AppColor.bottomColor.withOpacity(0.6),
                          fontFamily: Weights.medium,
                          size: AppSizes.SIZE_10,
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



