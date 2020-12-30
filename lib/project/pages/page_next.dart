import 'package:flutter/material.dart';

class PageNext extends StatefulWidget {
  final title;

  const PageNext({
    this.title
  });

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageNextStatues();
  }

}

class _PageNextStatues extends State<PageNext>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}