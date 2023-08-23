import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:validation/utils/color/app_colors.dart';


appLoader(BuildContext context, Color myColors) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            content: SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ));
}
hideKeyBoard(BuildContext context){
  FocusScope.of(context).unfocus();
}

void showLoadingIndicator({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(

          height: 45,width: 45,color: Colors.transparent,child:  CircularProgressIndicator(
          backgroundColor: Colors.black26,
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColor.primaryColor //<-- SEE HERE
          ),
        ),),
      );
    },
  );
}
