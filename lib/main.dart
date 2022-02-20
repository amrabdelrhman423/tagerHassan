import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Core/routes.dart';
import 'package:tagerhasan/Providers/HomeProvider.dart';
import 'package:tagerhasan/Providers/IntroProvider.dart';
import 'package:tagerhasan/Providers/NotificationProvider.dart';
import 'package:tagerhasan/Providers/ProfileProvider.dart';
import 'package:tagerhasan/Providers/RegisterProvider.dart';
import 'package:tagerhasan/Providers/ResetPasswordProvider.dart';
import 'package:tagerhasan/Providers/splash_provider.dart';
import 'package:tagerhasan/Screens/Splash/SplashScreen.dart';
import 'Core/SessionManagment.dart';
import 'Providers/LoginProvider.dart';
import 'Providers/MyOrdersProviders.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManagement.init();
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: ResetPasswordProvider()),
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: MyOrdersProvider()),
        ChangeNotifierProvider.value(value: NotificationsProvider()),
        ChangeNotifierProvider.value(value: IntroProvider()),
        ChangeNotifierProvider.value(value: RegisterProvider()),
        ChangeNotifierProvider.value(value: ProfileProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
       builder: ()=>GetMaterialApp(
          locale: Locale("ar"),
         // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            fontFamily: "tajawal"
          ),
          routes: routes,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    ) ;
  }
}
