import 'package:flutter/material.dart';

class DesignAppBar extends StatelessWidget {

  final String appBarName;
  final String pathBackgroundAppBar = "assets/img/AppBar.png";

  DesignAppBar(this.appBarName);

  @override
  Widget build(BuildContext context) {

    final iconAppBar = Container(
      height: 80,
      padding: EdgeInsets.only(
          top: 50.0,
          left: 20.0
      ),
      child: InkWell(
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );

    final designAppBar = Container(
      height: 94.0,
      padding: EdgeInsets.only(
          top: 30.0,
          right: 10.0
      ),
      child: Center(
        child: Text(
          appBarName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );

    final imageAppBar = Container(
      height: 100.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(pathBackgroundAppBar),
              fit: BoxFit.fill
          )
      ),
    );

    return Stack(
      children: <Widget>[
        imageAppBar,
        designAppBar,
        iconAppBar
      ],
    );
  }
}
