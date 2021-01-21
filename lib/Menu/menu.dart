import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wedding/Menu/cards.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

List<String> items = ["Invitation", "Location", "Gallery", "Songs"];

// dark, light, medium
List<Color> colors = [Color(0xff770F28), Color(0xffE8BAC2), Color(0xff9D1B35)];

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff770F28),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 15.0, top: 30.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    'Menu',
                    minFontSize: 87,
                    maxFontSize: 100,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GreatVibes',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xffB78628),
                            Color(0xffC69320),
                            Color(0xffDBA514),
                            Color(0xffEEB609),
                            Color(0xffFCC201)
                          ]),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30.0)),
                      color: Colors.red[100],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, top: 30.0),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return Cards(
                          number: (index + 1).toString(),
                          item: items[index],
                          backgrClr: colors[(index % colors.length)],
                          firstCircle: colors[(index + 1) % colors.length],
                          secondCircle: colors[(index + 2) % colors.length],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 40.0,
                        );
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.quadraticBezierTo(size.width, 0.0, size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}
