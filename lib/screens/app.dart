//import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:lyrica/models/music.dart';
import 'package:lyrica/screens/home.dart';
import 'package:lyrica/screens/mainplayer.dart';
import 'package:lyrica/screens/search.dart';
import 'package:lyrica/screens/yourlibrary.dart';
//import 'package:lyrica/screens/mainplayer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // final AudioPlayer _audioPlayer = AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;

  // Widget player() {
  //   // Size deviceSize = MediaQuery.of(context ).size;
  //   return AnimatedContainer(
  //     duration: const Duration(microseconds: 500),
  //     color: Colors.blueGrey,
  //     width: 400,
  //     height: 250,
  //     child: Row(
  //       children: [
  //         IconButton(
  //             onPressed: () {
  //               miniPlayer(music);
  //             },
  //             icon: Icon(Icons.arrow_back_rounded)),
  //         Image.network(
  //           music!.image,
  //           height: 250,
  //           width: 250,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget miniPlayer(Music? music, {bool stop = false}) {
  //   this.music = music;
  //
  //   if (music == null) {
  //     return SizedBox();
  //   }
  //   if (stop) {
  //     isPlaying = false;
  //     _audioPlayer.stop();
  //   }

    // Size deviceSize = MediaQuery.of(context).size;
  //   return AnimatedContainer(
  //     duration: const Duration(microseconds: 500),
  //     color: Colors.blueGrey,
  //     width: 500,
  //     height: 65,
  //     child: Builder(
  //       builder: (BuildContext context) {
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 Navigator.push(context,
  //                     MaterialPageRoute(builder: (context) => Player()));
  //               },
  //               child: Image.network(
  //                 music.image,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             Text(
  //               music.name,
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 isPlaying = !isPlaying;
  //                 if (isPlaying) {
  //                   _audioPlayer.play(UrlSource(music.audioURL));
  //                 } else {
  //                   _audioPlayer.pause();
  //                 }
  //               },
  //               icon: isPlaying
  //                   ? Icon(
  //                       Icons.pause,
  //                       color: Colors.white,
  //                     )
  //                   : Icon(
  //                       Icons.play_arrow,
  //                       color: Colors.white,
  //                     ),
  //             )
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [Home(), search(), LibraryPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         // miniPlayer(music),
          BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            selectedLabelStyle: TextStyle(color:Theme.of(context).colorScheme.secondary,),
            onTap: (currentIndex) {
              currentTabIndex = currentIndex;
              setState(() {});
            },
            backgroundColor: Theme.of(context).colorScheme.background,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.library_music,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: 'Your library'),
            ],
          ),
        ],
      ),
    );
  }
}
