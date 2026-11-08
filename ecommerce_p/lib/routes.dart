
import 'package:ecommerce_p/test.dart';
import 'package:ecommerce_p/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_p/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_p/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerce_p/view/screen/auth/succsseSignup.dart';
import 'package:ecommerce_p/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_p/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_p/view/screen/lang.dart';
import 'package:ecommerce_p/view/screen/onbording.dart';
import 'package:ecommerce_p/view/test_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:image_pickers/image_pickers.dart';
import 'core/constant/routesname.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => const MyLang() , middlewares: [
  //   MyMiddleWare()
  // ]),
  GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBording, page: () => const OnBording()),
  GetPage(name: AppRoute.verfiyCodeSignup, page: () => const VerfiyCodeSignUp()),
];