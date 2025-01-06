//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:lyrica/screens/Splashscreen.dart';
import 'package:lyrica/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await Firebase.initializeApp(
      // name: "lyrica-feafd",
      options: FirebaseOptions(
          apiKey: "AIzaSyBLXaklJDwTO7E4Wg8pb-eRWIYzIMlOm-Q",
          authDomain: "lyrica-c9bda.firebaseapp.com",
          projectId: "lyrica-c9bda",
          storageBucket: "lyrica-c9bda.appspot.com",
          messagingSenderId: "606957612475",
          appId: "1:606957612475:web:0090f9e2566a157afb289e",
          measurementId: "G-44MPGE2ELV"));
  Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp1(),
    ),
  );
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
