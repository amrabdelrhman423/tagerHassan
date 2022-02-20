import 'package:flutter/material.dart';
import 'package:tagerhasan/Screens/About%20Us/AboutUSScreen.dart';
import 'package:tagerhasan/Screens/AddNewSeller/AddNewSellerScreen.dart';
import 'package:tagerhasan/Screens/Contact%20US/ContactUsScreen.dart';
import 'package:tagerhasan/Screens/Home/HomeScreen.dart';
import 'package:tagerhasan/Screens/Intro/IntroScreen.dart';
import 'package:tagerhasan/Screens/MyOrders/MyOrdersScreen.dart';
import 'package:tagerhasan/Screens/Notification/NotificationScreen.dart';
import 'package:tagerhasan/Screens/OrderDetatils/ConfirmReciveOrderScreen.dart';
import 'package:tagerhasan/Screens/OrderDetatils/OrderDetailsRateScreen.dart';
import 'package:tagerhasan/Screens/OrderDetatils/OrderDetailsScreen.dart';
import 'package:tagerhasan/Screens/OrderDetatils/confirmOrderScreen.dart';
import 'package:tagerhasan/Screens/Profile/ProfileScreen.dart';
import 'package:tagerhasan/Screens/Reports/ReportsScreen.dart';
import 'package:tagerhasan/Screens/Seller/SellerScreen.dart';
import 'package:tagerhasan/Screens/Settings/SettingsScreen.dart';
import 'package:tagerhasan/Screens/Splash/SplashScreen.dart';
import 'package:tagerhasan/Screens/TermsAndCondations/TermsAndCondationsScreen.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:tagerhasan/Screens/auth/Register/registerScreen.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/ResetPasswordScreen.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/forgetPasswordScreen.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/otpScreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NotificationSCreen.routeName: (context) => NotificationSCreen(),
  MyOrdersScreen.routeName: (context) => MyOrdersScreen(),
  OrderDetailsScreen.routeName: (context) => OrderDetailsScreen(),
  ConfirmOrderScreen.routeName: (context) => ConfirmOrderScreen(),
  ConfirmReciveOrderScreen.routeName: (context) => ConfirmReciveOrderScreen(),
  OrderDetailsRateScreen.routeName: (context) => OrderDetailsRateScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SellerScreen.routeName: (context) => SellerScreen(),
  AddNewSellerScreen.routeName: (context) => AddNewSellerScreen(),
  ContactUsScreen.routeName: (context) => ContactUsScreen(),
  ReportesScreen.routeName: (context) => ReportesScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  AboutUsScreen.routeName: (context) => AboutUsScreen(),
  TermsAndCondationsScreen.routeName: (context) => TermsAndCondationsScreen(),
};