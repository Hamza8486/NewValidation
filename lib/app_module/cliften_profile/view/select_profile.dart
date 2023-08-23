import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/bottom_tabs/profile/component/widget.dart';
import 'package:validation/app_module/cliften_profile/controller/controller.dart';
import 'package:validation/app_module/cliften_profile/theme/theme_list.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/back_button.dart';
import 'package:validation/utils/Widgets/drop_down.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';

import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

class SelectProfile extends StatefulWidget {
  SelectProfile({Key? key}) : super(key: key);

  @override
  State<SelectProfile> createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  final selectProfile = Get.put(SelectProfileController());
  var themeOneController = TextEditingController();
  var themeTwoController = TextEditingController();
  var themeThreeController = TextEditingController();
  var themeFourController = TextEditingController();
  var themeFiveController = TextEditingController();

  String? time;
  String valueSelect = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      themeOneController.text = "Select  a theme";
      themeTwoController.text = "Select  a theme";
      themeThreeController.text = "Select  a theme";
      themeFourController.text = "Select  a theme";
      themeFiveController.text = "Select  a theme";
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        valueSelect ="";
                        time = null;
                      });
                    }),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                AppText(
                  title: "CliftonStrengths Profile",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_16,
                  fontFamily: Weights.semi,
                ),
                const SizedBox()
              ],
            ),
            SizedBox(
              height: Get.height * 0.035,
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.058,
              child: SortedByDropDown(
                hint: "Select a theme",
                icon: null,
                buttonDecoration: BoxDecoration(
                  border: Border.all(color: AppColor.blackColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                fontSize: AppSizes.SIZE_14,
                fontFamily: Weights.semi,
                hintColor: AppColor.blackColor.withOpacity(0.6),
                buttonHeight: Get.height * 0.055,
                dropdownItems: const [
                  "Top 5",
                  "Top 10",
                  "Top 15",
                ],
                value: time,
                dropdownWidth: Get.width * 0.9,
                buttonElevation: 0,
                onChanged: (value) {
                  setState(() {
                    time = value;
                    valueSelect = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),

            valueSelect == ""?SizedBox.shrink():
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    fieldWidget(themeOneController, "Theme One", () {
                      Get.to(ThemeListAll());
                    },
                        AppColor.onboardText.withOpacity(0.5)),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    fieldWidget(themeOneController, "Theme Two", () {},
                        AppColor.onboardText.withOpacity(0.5)),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    fieldWidget(themeOneController, "Theme Three", () {},
                        AppColor.onboardText.withOpacity(0.5)),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    fieldWidget(themeOneController, "Theme Four", () {},
                        AppColor.onboardText.withOpacity(0.5)),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    fieldWidget(themeOneController, "Theme Five", () {},
                        AppColor.onboardText.withOpacity(0.5)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
