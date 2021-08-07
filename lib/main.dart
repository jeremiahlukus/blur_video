import 'package:blur_video/video_player_item.dart';
import 'package:flutter/material.dart';

import 'blur_effect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            BlurEffectPaintMap(dimensionsMap: kTopBlurEffect(screenSize)),
            BlurEffectPaintMap(dimensionsMap: kBottomBlurEffect(screenSize)),
            BlurEffectPaintMap(dimensionsMap: kRightBlurEffect(screenSize)),
            BlurEffectPaintMap(dimensionsMap: kLeftBlurEffect(screenSize)),
            Container(
              height: screenSize.height,
              padding: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: [
                    const Color(0xFF060509).withOpacity(0.4),
                    Colors.black54.withOpacity(0.3),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Container(
                        height: screenSize.height / 3.7,
                        child: VideoPlayerItem(
                          height: screenSize.height,
                          videoUrl:
                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        ),
                      ),
                    ),
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'You have pushed the button this many times:',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
