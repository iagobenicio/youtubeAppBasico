import 'package:ytpratica/models/video.dart';
import 'package:ytpratica/models/comments.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var apikey = dotenv.env["API_KEY"];
const base_url = "https://www.googleapis.com/youtube/v3";

class Api {
  Future<dynamic> getData(String query) async {
    var result = await Dio().get("$base_url/search?part=snippet"
        "&maxResults=5&q=$query&key=$apikey");

    if (result.statusCode == 200) {
      List<Video> videos = result.data["items"].map<Video>((map) {
        return Video.fromjson(map);
      }).toList();
      return videos;
    }
  }

  Future<dynamic> getCommentsVideo(String videoId) async{
    var resulComments = await Dio().get("$base_url/commentThreads?part=snippet&"
    "maxResults=20&order=relevance&videoId=$videoId&key=$apikey");

    if(resulComments.statusCode == 200){
      List<Comments> comments = resulComments.data["items"].map<Comments>((map){
        return Comments.fromJsoncomments(map["snippet"]["topLevelComment"]);
      }).toList();

      return comments;
    }
  }
}
