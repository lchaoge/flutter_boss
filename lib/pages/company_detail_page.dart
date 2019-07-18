import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_boss/common/model/company.dart';
import 'package:flutter_boss/common/widget/company/company_hot_job.dart';
import 'package:flutter_boss/common/widget/company/company_inc.dart';
import 'package:flutter_boss/common/widget/company/company_info.dart';

const double _kAppBarHeight = 256.0;

class CompanyDetailPage extends StatefulWidget {

  final Company company;
  CompanyDetailPage(this.company);

  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> with TickerProviderStateMixin {

  List<Tab> _tabs;
  TabController _controller;
  Widget _companyTabContent;
  VoidCallback onChanged;
  int _currentIndex = 0;
  List<String> _urls = [
    'http://imagev2.xmcdn.com/group62/M02/6A/52/wKgMZ10u202SvnmsAAEsRjfqfG0863.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=large_pop&device_type=ios',
    'http://imagev2.xmcdn.com/group63/M09/17/A1/wKgMaF0ZfnbjkeSaAADW0dVmyZU628.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=large_pop&device_type=ios',
    '//imagev2.xmcdn.com/group62/M0B/8A/DC/wKgMcV0KN02TmDLNAAJMZlIJhSQ704.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=large_pop&device_type=ios'
  ];

  @override
  void initState() {
    super.initState();
    

    _tabs = [
      Tab(
        text: '公司概况',
      ),
      Tab(
        text: '热销职位',
      ),
    ];

    _companyTabContent = CompanyInc(widget.company.inc);

    _controller = TabController(
      length: _tabs.length,
      vsync: this
    );

    onChanged = (){
      setState(() {
        if(_currentIndex == 0){
          _companyTabContent = CompanyInc(widget.company.inc);
        } else{
          _companyTabContent = CompanyHotJob();
        }

        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);

  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (
      Image.network(
        _urls[index],
        fit: BoxFit.fill,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[

                SizedBox.fromSize(
                  size: Size.fromHeight(_kAppBarHeight),
                  child: Swiper(
                    itemBuilder: _swiperBuilder,
                      itemCount: _urls.length,
                      pagination: new SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.black54,
                          activeColor: Colors.white,
                        ),
                      ),
                      // control: new SwiperControl(),
                      scrollDirection: Axis.horizontal,
                      autoplay: true,
                      onTap: (index) => print('点击了第$index个'),
                  ),
                ),

                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      CompanyInfo(widget.company),
                      Divider(),
                      TabBar(
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(fontSize: 16.0),
                        labelColor: Colors.black,
                        controller: _controller,
                        tabs: _tabs,
                        indicatorColor: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),

                _companyTabContent

              ],
            ),
          ),

          Positioned(
            top: 10.0,
            left: -10.0,
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: BackButton(
                color: Colors.white,
              ),
            ),
          )

        ],
      ),
    );
  }
}
