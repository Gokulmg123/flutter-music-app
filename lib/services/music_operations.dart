import 'package:lyrica/models/music.dart';

class MusicOperations {
  MusicOperations._() ;
  static List<Music> getMusic() {
    return <Music>[
Music('EverGreen', 'https://c.saavncdn.com/430/90-S-Evergreen-Romantic-Songs-Hindi-2020-20200608134001-500x500.jpg', 'a','assets/madhu.mp3'),
Music('Soft', 'https://static.vecteezy.com/system/resources/thumbnails/037/044/052/small_2x/ai-generated-studio-shot-of-black-headphones-over-music-note-explosion-background-with-empty-space-for-text-photo.jpg', 'b','assets/madhu.mp3'),
Music('Romantic','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3jAC3SCw_dxDIf2ev88_HlG3G074G-5v8OQ&s', 'c','assets/madhu.mp3'),
Music('Melody','https://t3.ftcdn.net/jpg/00/61/18/42/360_F_61184207_YOf6WwKV1G5HsUiXKaFqOMocYmGcHnjg.jpg','d','assets/madhu.mp3'),

    ];
  }
}
