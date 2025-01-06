import 'package:flutter/material.dart';
import 'package:lyrica/models/song_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:lyrica/screens/lyrics.dart';

class mainplayer2 extends StatefulWidget {
  final Song song;
  final int index;
  const mainplayer2({super.key, required this.song, required this.index});

  @override
  State<mainplayer2> createState() => _mainplayer2State();
}

class _mainplayer2State extends State<mainplayer2> {
  final player = AudioPlayer();
  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }
//   void skipnext(){
// if(_currentindex<widget.song.length-1){
//   setState(() {
//     _currentindex++;
//     player.stop();
//     player.play();
//   });
// }
//   }
  // void skipprevious(){
  //   if(_currentindex>0){
  //     setState(() {
  //
  //       _currentindex--;
  //       player.stop();
  //       player.play();
  //     });
  //   }
  // }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.setAsset(widget.song.url,
        tag: MediaItem(
          // Specify a unique ID for each media item:
          id: '1',
          // Metadata to display in the notification:
          album: "Album name",
          title: "Song name",
          artUri: Uri.parse(
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fimages&psig=AOvVaw0nHotjMxIVx88BO4m1zMk2&ust=1725815246797000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMCiy-GosYgDFQAAAAAdAAAAABAE'),
        ));
    //position update
    player.positionStream.listen((p) {
      setState(() => position = p);
      //duration update
      player.durationStream.listen((d) {
        setState(() => duration = d!);
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal.shade200,Colors.teal.shade300,Colors.teal.shade700,Colors.teal.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.song.coverurl,
                      height: 300,
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Text(formatDuration(position)),
              Slider(
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: handleSeek,
              ),
              Text(formatDuration(duration)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
                  IconButton(
                      onPressed: handlePlayPause,
                      icon: Icon(
                          player.playing ? Icons.pause : Icons.play_arrow)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                             decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal.shade200,Colors.teal.shade300,Colors.teal.shade700,Colors.teal.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(20)), 
                            height: 400,
                            child: SingleChildScrollView(

                              child: Center(
                                
                                child: Text(widget.song.lyricss),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    "lyrics",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
