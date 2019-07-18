import 'package:flutter/material.dart';

import 'package:flutter_boss/common/widget/icon_tab.dart';
import 'package:flutter_boss/common/style/style.dart';

import 'package:flutter_boss/pages/job_page.dart';
import 'package:flutter_boss/pages/company_page.dart';
import 'package:flutter_boss/pages/message_page.dart';
import 'package:flutter_boss/pages/my_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MESSAGE = 2;
const int INDEX_MINE = 3;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onchanged;

  @override
  void initState() {
    super.initState();
    _controller =
        new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onchanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onchanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          JobPage(),
          CompanyPage(),
          MessagePage(),
          MyPage(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            fontSize: _kTabTextSize
          ),
          tabs: <IconTab>[
            IconTab(
                icon: _currentIndex == INDEX_JOB
                    ? "assets/images/ic_main_tab_find_pre.png"
                    : "assets/images/ic_main_tab_find_nor.png",
                text: "职位",
                color: _currentIndex == INDEX_JOB
                    ? BossColors.primaryColor
                    : Colors.grey[900]),
            IconTab(
                icon: _currentIndex == INDEX_COMPANY
                    ? "assets/images/ic_main_tab_company_pre.png"
                    : "assets/images/ic_main_tab_company_nor.png",
                text: "公司",
                color: _currentIndex == INDEX_COMPANY
                    ? BossColors.primaryColor
                    : Colors.grey[900]),
            IconTab(
                icon: _currentIndex == INDEX_MESSAGE
                    ? "assets/images/ic_main_tab_contacts_pre.png"
                    : "assets/images/ic_main_tab_contacts_nor.png",
                text: "消息",
                color: _currentIndex == INDEX_MESSAGE
                    ? BossColors.primaryColor
                    : Colors.grey[900]),
            IconTab(
                icon: _currentIndex == INDEX_MINE
                    ? "assets/images/ic_main_tab_my_pre.png"
                    : "assets/images/ic_main_tab_my_nor.png",
                text: "我的",
                color: _currentIndex == INDEX_MINE
                    ? BossColors.primaryColor
                    : Colors.grey[900]),
          ],
        ),
      ),
    );
  }
}
