import 'dart:convert';
import 'package:meta/meta.dart';

class Company{
  final String logo; // logo
  final String name; // 公司名称
  final String location; // 公司位置
  final String type; // 公司性质
  final String size; //公司规模
  final String employee; // 公司人数
  final String hot; // 热招职位
  final String count; // 职位总数
  final String inc; // 公司详情

  Company({
    @required this.logo,
    @required this.name,
    @required this.location,
    @required this.type,
    @required this.size,
    @required this.employee,
    @required this.hot,
    @required this.count,
    @required this.inc
  });

  static List<Company> fromJson(String json){
    List<Company> _companys = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapdata = decoder.convert(json)['list'];
    mapdata.forEach((item){
      Company company = new Company(
        logo: item['logo'],
        name: item['name'],
        location: item['location'],
        type: item['type'],
        size: item['size'],
        employee: item['employee'],
        hot: item['hot'],
        count: item['count'],
        inc: item['inc'],
      );
      _companys.add(company);
    });
    return _companys;
  }


}