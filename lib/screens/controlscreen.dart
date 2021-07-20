import 'package:flutter/material.dart';
import 'inicio.dart';
import 'biblioteca.dart';
import 'inscricao.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  List<Widget> myscreens = [Inicio(), Inscricao(), Inicio(), Biblioteca()];
  var _currentindex = 0;
  changeindex(newindex) {
    setState(() {
      _currentindex = newindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("youtube"),
        ),
        body: myscreens[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          currentIndex: _currentindex,
          onTap: (index) => changeindex(index),
          items: [
            BottomNavigationBarItem(label: "Inicio", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Inscrições", icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: "upload", icon: Icon(Icons.file_upload)),
            BottomNavigationBarItem(
                label: "biblioteca", icon: Icon(Icons.video_library_outlined)),
          ],
        ));
  }
}
