class Song {
  final String title;
  final String description;
  final String url;
  final String coverurl;
  final String lyricss;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverurl,
      required this.lyricss});

  static List<Song> songs = [
    Song(
        title:"",//add song title ,
        description: '',//add description
        url: '',//add url
        coverurl:
            '',//add cover picture
        lyricss: """ """,),//add lyrics
    Song(
        title: '',
        description: '',
        url: '',
        coverurl:
            '',
        lyricss: """ """),
    Song(
        title: '',
        description: '',
        url: '',
        coverurl:
            '',
        lyricss: """ """),
    
  ];

  var length;
}
