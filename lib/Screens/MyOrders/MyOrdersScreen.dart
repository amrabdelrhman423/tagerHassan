import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Providers/MyOrdersProviders.dart';
import 'package:tagerhasan/Screens/OrderDetatils/OrderDetailsScreen.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/myOrderItem.dart';

class MyOrdersScreen extends StatefulWidget {
  static const routeName = "/MyOrders";

  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F4F6F9"),
      appBar: CustomAppBar(context, title: "طلباتي", actions: false),
      body: Consumer<MyOrdersProvider>(
        builder: (context, myOrdersProvider, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'الفرز حسب المدينة',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff3b3b4d),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          width: 80,
                          height: 56,
                          child: Center(
                              child: DropdownButton<String>(
                                underline: SizedBox(),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: HexColor("#6C7B8A"),
                                  size: 14.sp,
                                ),
                                value: myOrdersProvider.cityFilter,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "tajawal",
                                  color: const Color(0xff3b3b4d),
                                  height: 1.1363636363636365,
                                ),
                                items: <String>['الرياض', 'B', 'C', 'D']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value)=>myOrdersProvider.changeCityFilter(value!),
                              )),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed(OrderDetailsScreen.routeName),
                            child: buildMyOrderItem(context));
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
