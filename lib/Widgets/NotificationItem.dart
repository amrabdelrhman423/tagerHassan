import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Providers/NotificationProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  int id;
   NotificationItem({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Consumer<NotificationsProvider>(
        builder: (context,notificationitprovider,_)=>Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                height: 70,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 7),
                      child: Image.asset("assets/logo.png",scale: 8,),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Flexible(
                      child: Text(
                        'هناك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff3b3b4d),
                          height: 1.1538461538461537,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          ),
          secondaryActions: [
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              iconWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("assets/trash.png"),
                  color: Colors.white,
                ),
              ),
              onTap: (){
                notificationitprovider.deletNotificationItem(id);
              },
            ),
          ],
        )
      )
    );
  }


}
