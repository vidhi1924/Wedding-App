import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/first.png'),
          AssetImage('assets/second.png'),
          AssetImage('assets/third.png'),
          AssetImage('assets/fourth.png'),
          AssetImage('assets/fifth.png'),
          AssetImage('assets/sixth.png'),
          AssetImage('assets/seventh.png'),
          
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1800),
        dotSize: 4.0,
        indicatorBgPadding: 10.0,
        dotBgColor: Colors.transparent,
        dotColor: Colors.white70,
      ),
    );
  }
}