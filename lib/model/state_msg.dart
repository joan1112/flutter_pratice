import 'package:flutter/material.dart';

class MsgChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MCMStatue();
  }

}
class _MCMStatue extends State<MsgChange>{

  int count=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Center(
        child: Chip(
          label: Text('$count'),
        ) ,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

          setState(() {
            count++;
          });
          print("$count");

        },
      ),
    );
  }


}