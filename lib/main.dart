import 'package:flutter/material.dart';
import 'package:youtube_clone/home/home.dart';
import 'package:youtube_clone/video_player/video_player.dart';

import 'common models/video.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Youtube Clone Flutter',
    onGenerateRoute: ( settings) {
    if (settings.name == videoPlayer.routeName) {

      final args = settings.arguments as Video;

      return MaterialPageRoute(
        builder: (context) {
          return videoPlayer(
              video : args
          );
        },
      );

    }

    },
    routes: {
      Home.routeName: (BuildContext context) => const Home(),
    },
    initialRoute: Home.routeName,
  ));
}


