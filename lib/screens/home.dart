import 'package:flutter/material.dart';
import 'package:ytpratica/customsearch.dart';
import 'inicio.dart';
import 'biblioteca.dart';
import 'inscricao.dart';
import 'alta.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  var _currentindex = 0;
  var _resultquery = "";
  
  
  changeindex(newindex) {
    setState(() {
      _currentindex = newindex;
    });
  }

  @override
  Widget build(BuildContext context){
    List<Widget> myscreens = [
      Inicio(_resultquery), 
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
              "assets/image/youtube.png",
              height: AppBar().preferredSize.height.toDouble() * 0.4,
            ),
          actions: [
            IconButton(
              icon: Icon(Icons.search), 
              onPressed: () async{
               String res = await showSearch(context: context, delegate: CustomSearch());
                setState((){
                  _resultquery = res;
                });
              }
            )
          ],
        ),
        body: Container(
          child: myscreens[_currentindex]
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          iconSize: 16.0,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          currentIndex: _currentindex,
          onTap: (index) => changeindex(index),
          items: [
            BottomNavigationBarItem(label: "Inicio", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Em alta", icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: "Inscrições", icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: "biblioteca", icon: Icon(Icons.video_library_outlined)),
          ],
        ));
  }
}
