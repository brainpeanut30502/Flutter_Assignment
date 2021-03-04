
import 'package:flutter/material.dart';

class MyListItem{
  String title="";
  String subtitle="";
  MyListItem(String title){
    this.title = title;
    this.subtitle =subtitle;
  }
}
List<ListTile> getWidgetsList(List<MyListItem> listItems){
  List<ListTile> widgets = [];
  for(int i=0; i<listItems.length;i++){
    widgets.add(ListTile(title: Text(listItems[i].title), subtitle: Text(listItems[i].subtitle),));
  }return widgets;
}
class DoodleListScreen extends StatefulWidget {
  @override
  _DoodleListScreenState createState() => _DoodleListScreenState();
}
class _DoodleListScreenState extends State<DoodleListScreen> {
  List<MyListItem> listItems =[];
  TextEditingController textController = TextEditingController();
  void addNewItemToList(String title) {
    setState(() {
      listItems.add(MyListItem(title));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Doodle Away"),centerTitle: true,),
      body: ListView(
        children:<Widget>[
          TextField(
            controller: textController,
            // onChanged: (String newText){
            //   val = newText;
            // },
          )

          ] + getWidgetsList(listItems),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "New",
        child: Icon(Icons.add),
        onPressed: (){
          addNewItemToList(textController.text);
          textController.text = "";
        },
      ),
    );
  }
}
