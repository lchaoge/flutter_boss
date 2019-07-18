import 'package:flutter/material.dart';
import 'package:flutter_boss/common/widget/contact_item.dart';

class MyPage extends StatelessWidget {
  final double _appBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -4.0),
                        colors: <Color>[
                          Color(0x00000000),
                          Color(0x00000000),
                        ]
                      )
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          left: 30.0,
                          right: 20.0,

                        ),
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage("http://imagev2.xmcdn.com/group55/M06/8F/7C/wKgLf1yhz52irIQsAAHEdYLFcF4890.jpg!strip=1&quality=7&magick=webp&op_type=5&upload_type=cover&name=web_large&device_type=ios"),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.0,
                                  right: 10.0
                                ),
                                child: Text(
                                  "朝歌",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0
                                  ),
                                ),
                              ),
                              Text(
                                "在职-考虑机会",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0
                                ),
                              ),
                            ],
                          )
                        ],
                      )

                    ],
                  )

                ],
              ),
            ),
          ),
        
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color:Colors.white,
                  child:Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ContactItem(
                          key: key,
                          count: '20',
                          title: '沟通过',
                          onPressed: (){
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Text('沟通过',style: TextStyle(fontSize: 20.0),),
                              )
                            );
                          },
                        ),
                        ContactItem(
                          key: key,
                          count: '230',
                          title: '待面试',
                          onPressed: (){
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Text('待面试',style: TextStyle(fontSize: 20.0),),
                              )
                            );
                          },
                        ),
                        ContactItem(
                          key: key,
                          count: '920',
                          title: '已投简历',
                          onPressed: (){
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Text('已投简历',style: TextStyle(fontSize: 20.0),),
                              )
                            );
                          },
                        ),
                      ],
                    ),
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}