import 'package:flutter/material.dart';
import 'package:lyrica/models/song_model.dart';

class Lyrics extends StatefulWidget {
  
  const Lyrics({super.key,});

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Text(Song.songs[0].lyricss,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
