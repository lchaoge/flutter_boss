import 'dart:convert';
import 'package:meta/meta.dart';

class Job {
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;

  Job({
    @required this.name,
    @required this.cname,
    @required this.size,
    @required this.salary,
    @required this.username,
    @required this.title,
  });

  static List<Job> fromJson(String json){
    List<Job> _jobs = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapdata = decoder.convert(json)['list'];
    mapdata.forEach((item){
      Job jo = new Job(
        name: item['name'],
        cname: item['cname'],
        size: item['size'],
        salary: item['salary'],
        username: item['username'],
        title: item['title']
      );
      _jobs.add(jo);
    });
    return _jobs;
  }

}