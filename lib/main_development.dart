import 'package:doc_doc/core/helpers/constants.dart';
import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/helpers/shared_pref.dart';
import 'package:doc_doc/core/routing/app_routes.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  setupGetIt();
  //to fix issue with text being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  checkUserIfLoggedOrNot();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:
          ColorsManager.mainBlue, // Change this to your desired color
    ),
  );
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
checkUserIfLoggedOrNot() async {
  String? token = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if(token.isNullOrEmpty()){
    isLoggedInUser=false;
  }else{
    isLoggedInUser=true;
  }
}