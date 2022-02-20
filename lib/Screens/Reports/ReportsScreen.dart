import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:tagerhasan/Widgets/ReporteItem.dart';

class ReportesScreen extends StatelessWidget {
  static const routeName="/Reports";
   ReportesScreen({Key? key}) : super(key: key);
  List<String>title=["تكاليف التوصيل","إجمالي الربح","الربح من البائعين","الدفع عند الإستلام"];
  List<String>subtitle=["9,153","5,040","3,160","192,350","3,160"];
  List<String>imagepath=["assets/delivery-truck.png","assets/coins.png","assets/pie-chart.png","assets/earnings.png",];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: HexColor("#F4F6F9"),
      appBar:CustomAppBar(context,title:"التقارير",actions: false, ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return ReportItem(imagePath: imagepath[index],title: title[index],subtitle: subtitle[index],);
          },
        ),
      ),
    );
  }
}
