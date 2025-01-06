//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lyrica/models/music.dart';
import 'package:lyrica/models/song_model.dart';
import 'package:lyrica/services/seekbar.dart';
import 'package:lyrica/screens/lyrics.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer audioPlayer = AudioPlayer();

  Song song = Song.songs[0];

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.initState();
  }

  Stream<SeekbarData> get _SeekbarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekbarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekbarData(
          position,
          duration ?? Duration.zero,
        );
      });
  // final player = AudioPlayer();
  // String formatDuration(Duration d) {
  //   final minutes = d.inMinutes.remainder(60);
  //   final seconds = d.inSeconds.remainder(60);
  //   return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  // }

  // void handlePlayPause() {
  //   if (player.playing) {
  //     player.pause();
  //   } else {
  //     player.play();
  //   }
  // }

  // void handleSeek(double value) {
  //   player.seek(Duration(seconds: value.toInt()));
  // }

  // Duration position = Duration.zero;
  // Duration duration = Duration.zero;
  // @override
  // void initState() {
  //   super.initState();

  // player.setAudioSource(AudioSource.uri(Uri.parse('assets:///$song.url')))

  //       tag: MediaItem(
  //         // Specify a unique ID for each media item:
  //         id: '1',
  //         // Metadata to display in the notification:
  //         album: "Album name",
  //         title: "Song name",
  //         artUri: Uri.parse(
  //             'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fimages&psig=AOvVaw0nHotjMxIVx88BO4m1zMk2&ust=1725815246797000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMCiy-GosYgDFQAAAAAdAAAAABAE'),

  //      ));

  //   //position update
  //   player.positionStream.listen((p) {
  //     setState(() => position = p);
  //     //duration update
  //     player.durationStream.listen((d) {
  //       setState(() => duration = d!);
  //     });

  //   });

  // Widget mainPlayer(Music? music) {

  //   return SafeArea(
  //     child: Container(
  //       padding: EdgeInsets.all(20),
  //       child: Image.network(
  //         height: 250,
  //         width: 250,
  //         'https://c.saavncdn.com/430/90-S-Evergreen-Romantic-Songs-Hindi-2020-20200608134001-500x500.jpg',
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        // color: Colors.white,
        // // child: Row(
        // //   crossAxisAlignment: CrossAxisAlignment.start,
        // //   children: [
        //   child:
        //     IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon: Icon(Icons.arrow_back_ios_new_sharp)),
        // mainPlayer(music),
        child: SingleChildScrollView(
          child: Scaffold(
            body: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    song.coverurl,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                _MusicPlayer(
                    song: song,
                    SeekbarDataStream: _SeekbarDataStream,
                    audioPlayer: audioPlayer),
                // Container(
                //   padding: EdgeInsets.only(top: 240),
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Lyrics()));
                //     },
                //     child: Text(
                //       "lyrics",
                //       style: TextStyle(
                //         fontSize: 18,
                //         color: Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required this.song,
    required Stream<SeekbarData> SeekbarDataStream,
    required this.audioPlayer,
  })  : _SeekbarDataStream = SeekbarDataStream,
        super(key: key);
  final Song song;
  final Stream<SeekbarData> _SeekbarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        children: [
          StreamBuilder<SeekbarData>(
            stream: _SeekbarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return Seekbar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChanged: audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                  onPressed: audioPlayer.hasPrevious
                      ? audioPlayer.seekToPrevious
                      : null,
                  iconSize: 45,
                  icon: Icon(Icons.skip_previous));
            }),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState = PlayerState!.processingState;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    width: 64.0,
                    height: 64.0,
                    margin: const EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  );
                } else if (!audioPlayer.playing) {
                  return IconButton(
                      onPressed: audioPlayer.play,
                      iconSize: 75,
                      icon: Icon(Icons.play_circle));
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                      onPressed: audioPlayer.pause,
                      iconSize: 75,
                      icon: Icon(Icons.pause_circle));
                } else {
                  return IconButton(
                      onPressed: () => audioPlayer.seek(Duration.zero,
                          index: audioPlayer.effectiveIndices!.first),
                      icon: Icon(Icons.replay));
                }
              } else {
                return const CircularProgressIndicator();
              }
            }),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                  onPressed:
                      audioPlayer.hasNext ? audioPlayer.seekToNext : null,
                  iconSize: 45,
                  icon: Icon(Icons.skip_next));
            }),
      ],
    );
  }
}

extension on Type {
   get processingState => null;
}
