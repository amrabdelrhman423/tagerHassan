import 'package:shared_preferences/shared_preferences.dart';

class SessionManagement {
  static const String ONBOARDING = "onbording_start";


  static var sharedPreferences;


  //this is called only once in main
  static Future<SharedPreferences> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  static Future<void> signOut() async {
    await sharedPreferences!.clear();
  }

  static Future onboarding(bool val) async {
    await sharedPreferences!.setBool(ONBOARDING, val);
  }
  static bool isOnboarding() {
    return sharedPreferences!.getBool(ONBOARDING) ?? false;
  }
}
