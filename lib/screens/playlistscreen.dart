import 'package:flutter/material.dart';
import 'package:lyrica/models/song_model.dart';
import 'package:lyrica/screens/mainplayer2.dart';

class playlistscreen extends StatefulWidget {
  const playlistscreen({super.key});

  @override
  State<playlistscreen> createState() => _playlistscreenState();
}

class _playlistscreenState extends State<playlistscreen> {

 // Song song = Song.songs[0];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal.shade700,
      appBar: AppBar(
        title: Text('playlist'),
        backgroundColor:  Colors.teal.shade900,
        
      ),
      body: ListView.separated(
        
          itemBuilder: (ctx, index) {
            return ListTile(
             hoverColor: Colors.teal.shade300,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mainplayer2(song:Song.songs[index],index: index,)));
              },
              title: Text(Song.songs[index].title),
              subtitle: Text(Song.songs[index].description),
              leading: Image.network(Song.songs[index].coverurl),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 15,
            );
          },
          itemCount: Song.songs.length),
    ));
  }
}




