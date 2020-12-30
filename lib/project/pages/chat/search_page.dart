import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/chat/chat_data_mode.dart';
import 'package:flutterapp/project/pages/chat/search_bar.dart';
import 'package:flutterapp/project/pages/constData.dart';
class SearchPage extends StatefulWidget {
 final List<ChatDataModel> data1 ;

  const SearchPage({Key key, this.data1}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List <ChatDataModel> _searchList = [];
  String  searchStr;

  void _searchData(String search){
    if(search.length==0){
      _searchList = [];
    }else{
      _searchList.clear();
      searchStr = search;
      for(int i=0;i<widget.data1.length;i++){
        if(widget.data1[i].name.contains(search)){
          _searchList.add(widget.data1[i]);
        }
      }
    }

    setState(() {

    });
  }

  Widget _richTitle(String text){
    Color _normalColor = Colors.black;
    Color _highColor = Colors.green;
    List current = text.split(searchStr);
   
    List<TextSpan> spans = [];
    for(int i=0;i<current.length;i++){
      if(current[i]==""){
        if(i!=current.length-1){
          spans.add(TextSpan(text: searchStr,style: TextStyle(color: _highColor)));

        }
      }else{
        spans.add(TextSpan(text: current[i],style: TextStyle(color: _normalColor)));

        if(i<current.length-1){

          spans.add(TextSpan(text: searchStr,style: TextStyle(color: _highColor)));

        }

      }

    }

    return  RichText(
      text: TextSpan(
         children: spans
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainThemeColor,
        child: Column(
          children: [
            SearchBar(
              valueChanged: (String text){
                print("000===${text}");
                _searchData(text);
              },

            ),
           Expanded(
             child: MediaQuery.removePadding(
               context: context,
               removeTop: true,
               child:  ListView.builder(
                 itemCount: _searchList.length,
                 itemBuilder: (BuildContext context ,int index){
                   return Container(
                     color: Colors.white,
                     child: ListTile(
                       title:_richTitle(_searchList[index].name),
                       subtitle: Container(
                         height: 20,
                         child: Text(_searchList[index].message),
                       ),
                       leading: CircleAvatar(
                         backgroundImage: NetworkImage(_searchList[index].imageUrl),
                       ),
                     ),
                   );
                 },

               ),
             )
           )
          ],
        ),
      ),
    );
  }
}
