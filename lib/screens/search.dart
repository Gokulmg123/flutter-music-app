//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lyrica/models/song_model.dart';
import 'package:lyrica/screens/mainplayer2.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  List<Song> displaysong = List.from(Song.songs);

  void updateList(String value) {
    setState(() {
      displaysong = Song.songs
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  hintText: 'Search your music here',
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: displaysong.length == 0
                    ? Center(
                        child: Text(
                          'no result found',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                      )
                    : ListView.builder(
                        itemCount: displaysong.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(displaysong[index].title),
                          subtitle: Text(displaysong[index].description),
                          leading: Image.network(displaysong[index].coverurl),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>mainplayer2(song: Song.songs[index], index: index)),);
                          },
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
