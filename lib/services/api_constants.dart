class ApiConstants {

  // Base Url
//static const String baseURL = 'http://192.168.18.58:8000/api/';
 static const String baseURL = 'https://validated.btech.host/api/';
 // static const String baseURL = 'http://validated.btech.host/api/';

  //Authentication App
  static const String loginURI = 'login';
  static const String registerURI = 'signUp';
  static const String verifyEmailURI = 'verifyCode';
  static const String verifyForgetCodeURI = 'forgotPassword/verifyCode';
  static const String sendEmailUrl = 'resendCode';
  static const String newPassword = 'forgotPassword/resetPassword';
  static const String forgetUrl = 'forgotPassword';
  static const String profileUrl = 'profile';
  static const String video = 'overviewLinks';
  static const String domain = 'domains';



  static String FCM_TOKEN = "";






  static bool isNotification = false;
  static String bidSlug = "";

}
