class Video {
  String videoid;
  String title;
  String channelTitle;
  String imageurl;

  Video({this.videoid, this.title, this.channelTitle, this.imageurl});

  factory Video.fromjson(map) {
    return Video(
        videoid: map["id"]["videoId"],
        title: map["snippet"]["title"],
        channelTitle: map["snippet"]["channelTitle"],
        imageurl: map["snippet"]["thumbnails"]["high"]["url"]);
  }
}
