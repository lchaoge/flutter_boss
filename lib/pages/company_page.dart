import 'package:flutter/material.dart';
import 'package:flutter_boss/common/model/company.dart';
import 'package:flutter_boss/common/widget/company_list_item.dart';
import 'package:flutter_boss/pages/company_detail_page.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {

  List<Company> _companties = [];

  @override
  void initState() { 
    super.initState();
    getCompanyList();
  }

  void getCompanyList(){
    setState(() {
      _companties = Company.fromJson("""
        {
        "list":[
          {
            "logo":"https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
            "name": "平安普惠",
            "location": "南通崇川区中南百货",
            "type": "有限责任公司分公司（自然人投资或控股）",
            "size": "B轮",
            "employee": "1000以上",
            "hot": "android资深架构师",
            "count": "1000",
            "inc": "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。"
          },
          {
            "logo":"https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
            "name": "平安普惠",
            "location": "南通崇川区中南百货",
            "type": "有限责任公司分公司（自然人投资或控股）",
            "size": "B轮",
            "employee": "1000以上",
            "hot": "android资深架构师",
            "count": "1000",
            "inc": "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。"
          },
          {
            "logo":"https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
            "name": "平安普惠",
            "location": "南通崇川区中南百货",
            "type": "有限责任公司分公司（自然人投资或控股）",
            "size": "B轮",
            "employee": "1000以上",
            "hot": "android资深架构师",
            "count": "1000",
            "inc": "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。"
          },
          {
            "logo":"https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
            "name": "平安普惠",
            "location": "南通崇川区中南百货",
            "type": "有限责任公司分公司（自然人投资或控股）",
            "size": "B轮",
            "employee": "1000以上",
            "hot": "android资深架构师",
            "count": "1000",
            "inc": "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。"
          },
          {
            "logo":"https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
            "name": "平安普惠",
            "location": "南通崇川区中南百货",
            "type": "有限责任公司分公司（自然人投资或控股）",
            "size": "B轮",
            "employee": "1000以上",
            "hot": "android资深架构师",
            "count": "1000",
            "inc": "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。"
          },
          {
            "logo":"https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
            "name": "百度",
            "location": "南通崇川区中南百货",
            "type": "有限责任公司分公司（自然人投资或控股）",
            "size": "D轮",
            "employee": "1000以上",
            "hot": "android资深架构师",
            "count": "1000",
            "inc": "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。"
          }
        ]
      }
      """);
    });
  }

  Widget buildCompanyItem(BuildContext context, int index){
    Company company = _companties[index];
    return InkWell(
      child: CompanyListItem(company),
      onTap: ()=>navCompanyDetail(company,index),
    );
  } 

  void navCompanyDetail(Company company,int index){
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context,_,__){
        return CompanyDetailPage(company);
      },
      transitionsBuilder: (_,Animation<double> animation,__,Widget child){
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),child: child,
          ),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公 司',style: TextStyle(fontSize: 20.0,color: Colors.white),),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: _companties.length,
        itemBuilder: buildCompanyItem,
      )
    );
  }
}