import 'package:device_preview/device_preview.dart';
import 'package:doc_doc/Features/auth/presentation/views/login_view.dart';
import 'package:doc_doc/Features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Features/home/presentation/views/nav_bar_widget.dart';
import 'core/cache/cache_helper.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/get_user_token.dart';
import 'core/theming/colors.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await ScreenUtil.ensureScreenSize();
  await getUserToken();
  runApp(DevicePreview(enabled: false, builder: (context) => const DocDoc()));
}

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize:  const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: child,
        );
      },
      child: token==null?OnBoardingView():UserMainLayoutScreen(),
    );
  }
}
