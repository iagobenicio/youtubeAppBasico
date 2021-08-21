import 'package:flutter/material.dart';
import 'package:ytpratica/models/comments.dart';
import 'package:ytpratica/api.dart';

class CommentsData extends StatefulWidget {

  String idvideo;

  CommentsData(this.idvideo);
  @override
  _CommentsDataState createState() => _CommentsDataState();
}

class _CommentsDataState extends State<CommentsData> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().getCommentsVideo(widget.idvideo),
      builder: (context,snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            ); 
          break;
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context,index) => Divider(
                  height: 2,
                ),
                itemBuilder: (builder,index){
                  Comments comments = snapshot.data[index];
                  return ListTile(
                    minVerticalPadding: 12.0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    leading: CircleAvatar(
                      radius: 16.0,
                      backgroundImage: NetworkImage(comments.profileImageAuthorComment),
                    ),
                    title: Text(
                      comments.commentAuthor.toString(),
                      style: TextStyle(
                        color: Colors.white54
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          comments.commentText,
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 12.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  comments.commentLikeCount.toString()
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  );
                }, 
              );
            }else{
              return Center(child: Text("nenhum comentário"),);
            }
          break;
          default:
            return Center();
        }
      }
    );
  }
}