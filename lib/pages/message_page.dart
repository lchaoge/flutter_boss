import 'package:flutter/material.dart';
import 'package:flutter_boss/common/model/message.dart';
import 'package:flutter_boss/common/widget/message_list_item.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  List<Message> _messages;

  @override
  void initState() {
    super.initState();
    getMessageList();
    
  }

  getMessageList(){
    setState(() {
     _messages = Message.fromJson("""
      {
        "list":[
          {
            "name":"小可爱",
            "avatar": "http://imagev2.xmcdn.com/group32/M01/DC/46/wKgJUFn8I_WgCeA_AAFsCbIUb8A844.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=web_large&device_type=ios",
            "company": "百度",
            "position": "HR",
            "msg": "你好"
          },{
            "name":"架构师",
            "avatar": "http://imagev2.xmcdn.com/group55/M06/8F/7C/wKgLf1yhz52irIQsAAHEdYLFcF4890.jpg!strip=1&quality=7&magick=webp&op_type=5&upload_type=cover&name=web_large&device_type=ios",
            "company": "新浪",
            "position": "工程师",
            "msg": "hello"
          }
        ]
      }
     """);
    });
  }

  Widget buildMessageItem(BuildContext context,int index){
    Message message = _messages[index];
    return InkWell(
      child: MessageListItem(message: message,),
      onTap: (){
        showDialog(
          context: context,
          child: AlertDialog(
            content: Text('尽情期待'),
          )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊 天',style: TextStyle(color: Colors.white),),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.hdr_off),
            onPressed: (){},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: buildMessageItem,
      )
    );
  }
}