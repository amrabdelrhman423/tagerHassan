
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Providers/RegisterProvider.dart';
import 'package:tagerhasan/Screens/auth/Register/BankRegister.dart';
import 'package:tagerhasan/Screens/auth/Register/carRegister.dart';
import 'package:tagerhasan/Screens/auth/Register/personalRegister.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/errorsnackbar.dart';

class RegisterScreen extends StatefulWidget  {
  static const routeName = "/register";
  static TabController ?tabController;

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin{
  String? password;
  String? confirmPassword;

  @override
  void initState() {
    super.initState();
    RegisterScreen.tabController=TabController(vsync: this , length:3,initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<RegisterProvider>(

      builder:(context, registerProvider, child) =>  Scaffold(
        backgroundColor: Colors.white,
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.08), // here the desired height
          child:  AppBar(
            backgroundColor: HexColor("#FD8200"),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                   if(registerProvider.index==0){
                     Navigator.pop(context);
                   }else{
                     registerProvider.changeindexTab((registerProvider.index - 1));
                     RegisterScreen.tabController!.animateTo(registerProvider.index,duration: Duration(milliseconds: 1000));
                   }
                  }),
            ),

            title: Padding(
              padding:  EdgeInsets.only(top: 22),
              child: Text(
               "تسجيل جديد",
                style: TextStyle(
                  fontSize: 16,
                  color:  Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),

          ),

        ),
        body:  Column(

          children: [
            Container(
              height: 50.h,
              color: HexColor("#F0F0F0"),
              child: TabBar(
                onTap: (index){
                  if(RegisterScreen.tabController!.index > registerProvider.index){
                    showSnackbarWithError(context, "يجب عليك ملئ البيانات اولا");
                  }
                  RegisterScreen.tabController!.index=registerProvider.index;
                },
                controller: RegisterScreen.tabController,
                indicatorColor: HexColor("#F88409"),
                unselectedLabelColor:HexColor("#140F26") ,
                labelColor: HexColor("#FD8200"),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 9.5.sp
                ),
                tabs: [
                  Tab(text: "بيانات شخصية",),
                  Tab(text: "بيانات السيارة"),
                  Tab(text: "بيانات الحساب البنكي"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller:RegisterScreen.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PersonalRegisterScreen(),
                  CarRedister(),
                  BankRegister(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: HexColor("#34CF58"),
          child: Center(
            child: Image.asset(
              "assets/call.png",
              scale: 7,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
// Adobe XD layer: 'bg' (shape)
