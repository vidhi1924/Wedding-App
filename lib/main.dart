import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:wedding/Menu/menu.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wedding/Animation/FadeAnimation.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(MaterialApp(
      home: Demo(),
      debugShowCheckedModeBanner: false,
    ));

AudioPlayer player = AudioPlayer();

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.setAsset('assets/intro2.mp3');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 40.0,
            top: 66.0,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Animation(),
            ),
          ),
          Positioned(
            top: 90,
            bottom: 90,
            right: 0,
            left: 0,
            child: AspectRatio(
              aspectRatio: 4 / 6,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/redbackground.jpg'),
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width/1.2,
            child: FadeAnimation(
                14,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/redorangetop.png'),
                    fit: BoxFit.fill,
                  )),
                )),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            child: FadeAnimation(
                12,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/redorangebottom.png'),
                    fit: BoxFit.fill,
                  )),
                )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.9,
            left: MediaQuery.of(context).size.width / 2.88,
            width: MediaQuery.of(context).size.width / 3.2,
            height: MediaQuery.of(context).size.width / 3.2,
            child: FadeAnimation(
                1,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/savethedate.png'),
                    fit: BoxFit.fill,
                  )),
                )),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            top: MediaQuery.of(context).size.height / 2.75,
            // width: 80,
            // height: 150,
            child: FadeAnimation(
                4,
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: AutoSizeText(
                      '31st January 2021',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GreatVibes'),
                    ),
                  ),
                )),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            top: MediaQuery.of(context).size.height / 2.5,
            // width: 80,
            // height: 150,
            child: FadeAnimation(
                9,
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: AutoSizeText(
                      'Yash & Krisha',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GreatVibes'),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class Animation extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  Function playSound = () {
    player.play();
    return 1;
  };
  Map<int, Widget> output = {1: Menu()};

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 6,
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AnimatedSplash(
            imagePath: 'assets/wedding_logo.jpg',
            customFunction: playSound,
            duration: 14000,
            home: Menu(),
            outputAndHome: output,
            type: AnimatedSplashType.BackgroundProcess,
          )),
    );
  }
}
