import 'package:flutter/material.dart';
import 'package:flutter_boss/common/model/message.dart';

class MessageListItem extends StatelessWidget {
  final Message message;
  MessageListItem({
    this.message
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 3.0
      ),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 0.0,
                ),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(message.avatar),
                ),
              ),
              Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      message.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 5.0
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 5.0,
                      bottom: 5.0
                    ),
                    child: Text(
                      message.company + " | " + message.position,
                      style:TextStyle(
                        fontSize: 13.0,
                        color:Colors.grey
                      )
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 5.0,
                      bottom: 10.0
                    ),
                    child: Text(
                      message.msg,
                      style:TextStyle(
                        fontSize: 13.0,
                        color:Colors.grey
                      )
                    ),
                  ),

                ],
              ),
              )
              
              
            ],
          ),
        ),
      ),
    );
  }
}