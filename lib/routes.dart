import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/midleware/appMiddleware.dart';
import 'package:chat_app/view/pages/addUser.dart';
import 'package:chat_app/view/pages/appStyle.dart';
import 'package:chat_app/view/pages/bottomNavigationBar.dart';
import 'package:chat_app/view/pages/chat.dart';
import 'package:chat_app/view/pages/home.dart';
import 'package:chat_app/view/pages/language.dart';
import 'package:chat_app/view/pages/onBoarding.dart';
import 'package:chat_app/view/pages/registration/forgetPassword.dart';
import 'package:chat_app/view/pages/registration/log_in.dart';
import 'package:chat_app/view/pages/registration/sig_in.dart';
import 'package:chat_app/view/pages/upadteUserData.dart';
import 'package:chat_app/view/pages/viewImage.dart';
import 'package:chat_app/view/pages/viewVideo.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: "/",
      page: () => const OnBoardingPage(),
      middlewares: [AppMiddleware()]),
  GetPage(name: AppRoutes.sigInPage, page: () => const Sig_inPage()),
  GetPage(name: AppRoutes.logInPage, page: () => const Log_inPage()),
  GetPage(
      name: AppRoutes.forgetPasswordPage,
      page: () => const ForgetPasswordPage()),
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(
      name: AppRoutes.navigationBarPge,
      page: () => const Custom_NavigationBar()),
  GetPage(name: AppRoutes.forgetPasswordPage, page: () => const AddUserPage()),
  GetPage(name: AppRoutes.addUserPge, page: () => const AddUserPage()),
  GetPage(name: AppRoutes.chatPage, page: () => const ChatPage()),
  GetPage(name: AppRoutes.viweImagePage, page: () => const ViewImagePage()),
  GetPage(name: AppRoutes.viewVideoPage, page: () => const ViewVideoPage()),
  GetPage(
      name: AppRoutes.updateUerDataPage,
      page: () => const UpdateUserDataPage()),
  GetPage(name: AppRoutes.appStylesPage, page: () => const AppStylePage()),
  GetPage(name: AppRoutes.onBoardingPage, page: () => const OnBoardingPage()),
  GetPage(name: AppRoutes.languagePage, page: () => const LanguagePage()),
];
