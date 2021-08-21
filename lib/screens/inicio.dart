import 'package:flutter/material.dart';
import 'package:ytpratica/api.dart';
import 'package:ytpratica/models/video.dart';
import 'package:ytpratica/player.dart';

class Inicio extends StatefulWidget {

  String _result = "";

  Inicio(this._result);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  
  _listarVideos(String pesquisa){
    Api api = new Api();
    return api.getData(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listarVideos(widget._result),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  padding: EdgeInsets.all(16),
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                  ),
                  itemBuilder: (context, index) {
                    Video video = snapshot.data[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => PlayerVideo(
                            video.videoid
                          ))
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.imageurl)
                              )
                            ),
                          ),
                          ListTile(
                            title: Text(video.title),
                            subtitle: Text(video.channelTitle),
                          )
                        ],
                      )
                    );
                  }
                );
            } else {
              return Container(
                child: Center(
                  child: Text("nenhum dado retornado"),
                ),
              );
            }
            break;
          default:
            return Container(
              child: Center(
                child: Text("."),
              ),
            );
        }
      },
    );
  }

  
}
