import 'package:flutter/material.dart';



class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<Musics> musicList = [
    Musics('Happy', 'Pharrell Williams', 'https://upload.wikimedia.org/wikipedia/en/2/23/Pharrell_Williams_-_Happy.jpg', '3:53'),
    Musics('Uptown Funk', 'Mark Ronson ft. Bruno Mars', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZKrk7PLEIse5gifosmkg-CUwxjdH5-7au5w&s', '4:38'),
    Musics('Can\'t Stop the Feeling!', 'Justin Timberlake', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMz1H3z_xcpkTkCEA6G1oZpRIQQOdI2DY6HA&s', '3:56'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Library'),
      ),
      body: ListView.builder(
        itemCount: musicList.length,
        itemBuilder: (context, index) {
          return MusicTile(musics: musicList[index]);
        },
      ),
    );
  }
}

class Musics {
  final String title;
  final String artist;
  final String image;
  final String duration;

  Musics(this.title, this.artist, this.image, this.duration);
}

class MusicTile extends StatelessWidget {
  final Musics musics;

  const MusicTile({Key? key, required this.musics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(musics.image, width: 50),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                musics.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                musics.artist,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                musics.duration,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}


