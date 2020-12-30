import 'package:flutter/material.dart';

class ChatDataModel {
  final imageUrl;
  final name;
  final message;
  final  option;


  ChatDataModel({this.imageUrl, this.name, this.message,this.option});

  factory ChatDataModel.fromJson(Map json) {
    return ChatDataModel(
      imageUrl: json["imageUrl"],
      name: json["name"],
      message: json['message'],
      option: json['option'],

    );
  }
}
