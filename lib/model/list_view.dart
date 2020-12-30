
import 'package:flutter/material.dart';

import 'car_file.dart';

class ListCarView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    Widget _build(BuildContext content,int index){
      return Container(
        color: Colors.grey[100],
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              datas[index].name,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10,),
            Image.network(datas[index].imageUrl)
          ],
        ),
      );
    };

    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: _build,
    );
  }
}
