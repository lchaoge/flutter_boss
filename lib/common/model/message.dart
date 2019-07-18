import 'dart:convert';
import 'package:meta/meta.dart';

class Message {
  final String name;
  final String avatar;
  final String company;
  final String position;
  final String msg;

  Message({
    @required this.name,
    @required this.avatar,
    @required this.company,
    @required this.position,
    @required this.msg
  });

  static List<Message> fromJson(String json){
    List<Message> _messages = [];

    JsonDecoder decoder = new JsonDecoder();
    var mapdata = decoder.convert(json)['list'];
    mapdata.forEach((item){
      Message el = new Message(
        name: item['name'],
        avatar: item['avatar'],
        company: item['company'],
        position: item['position'],
        msg: item['msg']
      );
      _messages.add(el);
    });
    return _messages;

  }

}