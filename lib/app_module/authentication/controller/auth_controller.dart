import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isVisible = true.obs;
  var isVisible1 = true.obs;
  var isVisible2 = true.obs;
  var isVisible3 = true.obs;
  var isVisible4 = true.obs;
  var isVisible5 = true.obs;
  updateVisibleStatus() {
    isVisible.toggle();
    update();
  }
  updateVisibleStatus1() {
    isVisible1.toggle();
    update();
  }


  updateVisibleStatus2() {
    isVisible2.toggle();
    update();
  }
  updateVisibleStatus3() {
    isVisible3.toggle();
    update();
  }
  updateVisibleStatus4() {
    isVisible4.toggle();
    update();
  }
  updateVisibleStatus5() {
    isVisible5.toggle();
    update();
  }
  File ? file;


  clearLogin(){
    loginEmailController.clear();
    loginPasswordController.clear();

  }
  clearForget(){
    forgetPasswordController.clear();
    forgetConfirmController.clear();
    forgetEmailController.clear();

  }
  clearReg(){
    regCompController.clear();
    regPasswordController.clear();
    regFamController.clear();
    file = null;
    regEmailController.clear();
    regNameController.clear();
    regUserNameController.clear();

  }


  //Login
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();


  //Register
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regNameController = TextEditingController();
  TextEditingController regUserNameController = TextEditingController();
  TextEditingController regFamController = TextEditingController();
  TextEditingController regCompController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();


  //Forget
  TextEditingController forgetEmailController = TextEditingController();
  TextEditingController forgetPasswordController = TextEditingController();
  TextEditingController forgetConfirmController = TextEditingController();
  TextEditingController newConfirmController = TextEditingController();
  TextEditingController changeConfirmController = TextEditingController();
}



