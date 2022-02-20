import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:tagerhasan/Providers/HomeProvider.dart';
import 'package:tagerhasan/Screens/About%20Us/AboutUSScreen.dart';
import 'package:tagerhasan/Screens/Contact%20US/ContactUsScreen.dart';
import 'package:tagerhasan/Screens/MyOrders/MyOrdersScreen.dart';
import 'package:tagerhasan/Screens/Notification/NotificationScreen.dart';
import 'package:tagerhasan/Screens/OrderDetatils/OrderDetailsScreen.dart';
import 'package:tagerhasan/Screens/Profile/ProfileScreen.dart';
import 'package:tagerhasan/Screens/Reports/ReportsScreen.dart';
import 'package:tagerhasan/Screens/Seller/SellerScreen.dart';
import 'package:tagerhasan/Screens/Settings/SettingsScreen.dart';
import 'package:tagerhasan/Screens/TermsAndCondations/TermsAndCondationsScreen.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:tagerhasan/Widgets/Itemorder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/Home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.png"), fit: BoxFit.fill),
              ),
            ),
            SideMenu(
              key: _endSideMenuKey,
              inverse: true,
              //  closeIcon: null,
              background: Colors.transparent,
              type: SideMenuType.shrinkNSlide,
              menu: buildMenu(),
              maxMenuWidth: MediaQuery.of(context).size.width,
              radius: BorderRadius.circular(15),
              child: SideMenu(
                key: _sideMenuKey,
                menu: buildMenu(),
                type: SideMenuType.shrinkNSlide,
                background: null,
                radius: null,
                child: InkWell(
                  onTap: () {
                    final _state = _endSideMenuKey.currentState;
                    if (_state!.isOpened) {
                      _state.closeSideMenu();
                      homeProvider.isOpendrawer(false);
                    }
                  },
                  child: Scaffold(
                      backgroundColor: HexColor("#F4F6F9"),
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(
                            MediaQuery.of(context).size.height *
                                0.07), // here the desired height
                        child: AppBar(
                          backgroundColor: homeProvider.avilable
                              ? HexColor("#FD8200")
                              : HexColor("#707070"),
                          centerTitle: true,
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  final _state = _endSideMenuKey.currentState;
                                  if (_state!.isOpened) {
                                    _state.closeSideMenu();
                                    homeProvider.isOpendrawer(false);
                                  } else {
                                    _state.openSideMenu();
                                    homeProvider.isOpendrawer(true);
                                  }
                                }),
                          ),
                          elevation: 0,
                          actions: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8),
                              child: InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(NotificationSCreen.routeName),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: ImageIcon(
                                    AssetImage("assets/notif.png"),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: FlutterSwitch(
                                  height: 20.h,
                                  width: 44.w,
                                  value: homeProvider.avilable,
                                  borderRadius: 30.0,
                                  padding: 2,
                                  inactiveColor: Colors.white,
                                  activeColor: Colors.white,
                                  toggleColor: HexColor("#707070"),
                                  activeToggleColor: HexColor("#FD8200"),
                                  switchBorder: Border.all(
                                      width: 1,
                                      color: homeProvider.avilable
                                          ? HexColor("#FD8200")
                                          : HexColor("#707070")),
                                  onToggle: (val) =>
                                      homeProvider.changetoAvalibale(val)),
                            ),
                            SizedBox(
                              width: 15.w,
                            )
                          ],
                          title: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              'الرئيسية',
                              style: TextStyle(
                                fontFamily: "",
                                fontSize: 13.sp,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      body: IgnorePointer(
                        ignoring: homeProvider.isopen,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Stack(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        child: PageView(
                                          scrollDirection: Axis.horizontal,
                                          controller: controller,
                                          children: [
                                            Image.asset(
                                              "assets/bghome.png",
                                              fit: BoxFit.fill,
                                            ),
                                            Image.asset(
                                              "assets/logo.png",
                                              fit: BoxFit.fill,
                                            ),
                                            Image.asset(
                                              "assets/intro1.png",
                                              fit: BoxFit.fill,
                                            ),
                                            Image.asset(
                                              "assets/bg.png",
                                              fit: BoxFit.fill,
                                            )
                                          ],
                                          onPageChanged: (index) => homeProvider
                                              .changeSwapeIndex(index),
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 27.h,
                                      color: homeProvider.avilable
                                          ? HexColor("#34CF58")
                                          : HexColor("#AFAFAF"),
                                      child: Center(
                                        child: Text(
                                          homeProvider.avilable
                                              ? 'جاهز لإستلام الطلبات'
                                              : "غير متوفر",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 15,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: homeProvider
                                                                .Pageindex ==
                                                            0
                                                        ? HexColor("#FD8200")
                                                        : Colors.black26),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: homeProvider
                                                                .Pageindex ==
                                                            1
                                                        ? HexColor("#FD8200")
                                                        : Colors.black26),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: homeProvider
                                                                .Pageindex ==
                                                            2
                                                        ? HexColor("#FD8200")
                                                        : Colors.black26),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: homeProvider
                                                                .Pageindex ==
                                                            3
                                                        ? HexColor("#FD8200")
                                                        : Colors.black26),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              homeProvider.avilable
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'قائمة الطلبات',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color:
                                                      const Color(0xff3b3b4d),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Expanded(child: SizedBox()),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الفرز حسب مكان المتجر',
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: const Color(
                                                          0xff3b3b4d),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Container(
                                                    width: 60.h,
                                                    child: Center(
                                                        child: DropdownButton<
                                                            String>(
                                                      underline: SizedBox(),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            HexColor("#6C7B8A"),
                                                        size: 14.sp,
                                                      ),
                                                      value: homeProvider.city,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily: "tajawal",
                                                        color: const Color(
                                                            0xff3b3b4d),
                                                        height:
                                                            1.1363636363636365,
                                                      ),
                                                      items: <String>[
                                                        'الرياض',
                                                        'B',
                                                        'C',
                                                        'D'
                                                      ].map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        homeProvider.cityChosse(value!);
                                                      },
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        for (int i = 0; i < 15; i++)
                                          InkWell(
                                            onTap: () => Navigator.of(context)
                                                .pushNamed(OrderDetailsScreen
                                                    .routeName),
                                            child: buildOrderItem(context),
                                          )
                                      ],
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, _) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            overflow: Overflow.visible,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/profile.png"),
                                radius: 30,
                              ),
                              Positioned(
                                top: -7,
                                left: -2,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: const Color(0xfffd8200)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'محمد صالح',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Riyadh',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(0xffffffff),
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.68,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 5, left: 10, right: 8),
                        itemCount: homeProvider.titles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: InkWell(
                              onTap: () {
                                homeProvider.changeindex(index);
                                switch (index) {
                                  case 0:
                                    final _state = _endSideMenuKey.currentState;
                                    _state!.closeSideMenu();
                                    homeProvider.isOpendrawer(false);
                                    break;
                                  case 1:
                                    Navigator.of(context).pushNamed(
                                        NotificationSCreen.routeName);
                                    break;
                                  case 2:
                                    Navigator.of(context)
                                        .pushNamed(MyOrdersScreen.routeName);
                                    break;
                                  case 3:
                                    Navigator.of(context)
                                        .pushNamed(SellerScreen.routeName);
                                    break;
                                  case 4:
                                    Navigator.of(context)
                                        .pushNamed(ReportesScreen.routeName);
                                    break;
                                  case 5:
                                    Navigator.of(context)
                                        .pushNamed(SettingsScreen.routeName);
                                    break;
                                  case 6:
                                    Navigator.of(context).pushNamed(
                                        TermsAndCondationsScreen.routeName);
                                    break;
                                  case 7:
                                    Navigator.of(context)
                                        .pushNamed(AboutUsScreen.routeName);
                                    break;
                                  case 8:
                                    Navigator.of(context)
                                        .pushNamed(ContactUsScreen.routeName);
                                    break;
                                  case 9:
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            LoginScreen.routeName,
                                            (route) => false);
                                    break;
                                }
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: homeProvider.index == index
                                        ? Colors.white.withOpacity(0.2)
                                        : Colors.transparent),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                          homeProvider.Iconsmenue[index]),
                                      size: 17,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    Text(
                                      homeProvider.titles[index],
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
