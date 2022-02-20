import 'package:flutter/material.dart';


class ScreenPhoto extends StatelessWidget {
  const ScreenPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/profile.png")
          )
        ),
      ),
    );
  }
}
