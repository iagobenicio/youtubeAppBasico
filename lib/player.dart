import 'package:flutter/material.dart';
import 'commentsVideo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerVideo extends StatefulWidget {
  
  String idvd;
  PlayerVideo(this.idvd);

  @override
  _PlayerVideoState createState() => _PlayerVideoState();
}

class _PlayerVideoState extends State<PlayerVideo> {
  YoutubePlayerController _controller;
  void runVideo(){
    _controller = YoutubePlayerController(initialVideoId: widget.idvd,
      flags: YoutubePlayerFlags(
        autoPlay: false
      )
    );
  }

  @override
    void initState() {
      runVideo();
      super.initState();
    }
  
  @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        progressColors: ProgressBarColors(
          backgroundColor: Colors.grey[600],
          playedColor: Colors.red,
          handleColor: Colors.red
        ),
        controller: _controller
      ), 
      builder: (context,player){
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Column(
              children: [
                player,
                Expanded(
                  child: CommentsData(widget.idvd)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}