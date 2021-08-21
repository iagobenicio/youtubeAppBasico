import 'package:flutter/material.dart';
import 'screens/inicio.dart';

class CustomSearch extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = "";
        }
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), 
      onPressed: (){
        close(context, "");
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Inicio(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }


}