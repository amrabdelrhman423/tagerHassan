import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Core/SessionManagment.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';

import '../../Widgets/IntroItem.dart';

class IntroScreen extends StatefulWidget {

  static const routeName="/intro";
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _index=0;
  List titles=['ما هو "لوريم إيبسوم" ؟','ما فائدته ؟','أين أجده ؟'];
  List images=["assets/intro1.png","assets/intro2.png","assets/intro3.png"];
  List subTitles=["هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص",
    "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص ",
    "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر "];

  PageController controller =PageController(initialPage: 0);


  @override
  void initState() {
    super.initState();
    SessionManagement.onboarding(true);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                IntroItem( title:titles[_index] , image: images[_index],subtitle: subTitles[_index],index: _index,),
                IntroItem( title:titles[_index] , image: images[_index],subtitle: subTitles[_index],index: _index,),
                IntroItem( title:titles[_index] , image: images[_index],subtitle: subTitles[_index],index: _index,),

              ],
              onPageChanged: (index){
                setState(() {
                  _index=index;
                });
              },
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: MediaQuery.of(context).size.height*0.45,
              child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 15,
                      height: 2,
                      decoration: BoxDecoration(
                          color: _index==0?Colors.black:Colors.grey
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 15,
                      height: 2,
                      decoration: BoxDecoration(
                          color: _index==1?Colors.black:Colors.grey
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 15,
                      height: 2,
                      decoration: BoxDecoration(
                          color: _index==2?Colors.black:Colors.grey
                      ),
                    ),
                  )
                ],
              ),
            ),),

            Positioned(
              right: 0,
              left: 0,
              bottom: 30.sp,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _index==2?InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: ()=>Navigator.of(context).pushReplacementNamed(LoginScreen.routeName),
                    child: Container(
                      width: 200.sp,
                      height: 60.sp,
                      decoration: BoxDecoration(
                          color: HexColor("#FD8200"),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("ابدأ الان ",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                            fontFamily: "tajawalbold"

                        ),),
                      ),
                    ) ,
                  ):InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        controller.nextPage(duration: Duration(seconds: 2) , curve: Curves.linearToEaseOut);
                      });
                    },
                    child: Container(
                      width: 60.sp,
                      height: 60.sp,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(90)
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
