//import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
//import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:lyrica/models/category.dart';
import 'package:lyrica/models/music.dart';
import 'package:lyrica/screens/account.dart';
import 'package:lyrica/screens/mainplayer.dart';
import 'package:lyrica/screens/playlistscreen.dart';
import 'package:lyrica/screens/settings.dart';
import 'package:lyrica/services/category_operations.dart';
import 'package:lyrica/services/music_operations.dart';

class Home extends StatelessWidget {
  //final Function _miniPlayer;
  const Home();
  // const Home({super.key});
  Widget createCatagory(Catagory catagory) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => playlistscreen()));
              },
              child: Image.network(
                catagory.imageURL,
                fit: BoxFit.cover,
              ),
            );
          }),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              catagory.name,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Catagory> CatagoryList = CategoryOperations.getCatagories();
    List<Widget> catagories =
        CatagoryList.map((Catagory catagory) => createCatagory(catagory))
            .toList();
    return catagories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              return Container(
                  height: 200,
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      //  _miniPlayer(music, stop: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const playlistscreen()));
                    },
                    child: Image.network(
                      music.image,
                      fit: BoxFit.cover,
                    ),
                  ));
            },
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 400,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [
          //           Colors.blueGrey.shade300,
          //           Colors.black,
          //         ],
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         stops: [0.1, 0.3])),
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: SafeArea(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text(
                      'Good morning',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    leading: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserAccountPage()));
                            },
                            icon: Icon(Icons.account_circle_rounded));
                      },
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                          icon: Icon(Icons.settings))
                    ],
                  ),
                ),
              ),
              createGrid(),
              createMusicList('Made for you'),
              createMusicList('Popular Playlist'),
            ],
          ),
        )),
      ),
    );
  }
}
