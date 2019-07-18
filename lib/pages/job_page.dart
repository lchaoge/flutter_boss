import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boss/common/widget/job_list_item.dart';
import 'package:flutter_boss/common/model/job.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  List<Job> _jobs = [];
  @override
  void initState() {
    super.initState();
    getJobList();

  }

  void getJobList(){
    setState(() {
     _jobs = Job.fromJson("""
      {
        "list":[
          {
            "name":"架构师 （Android）",
            "cname": "蚂蚁金服",
            "size": "B轮",
            "salary": "25K-45K",
            "username": "Claire",
            "title": "HR"
          },{
            "name": "资深Android架构师",
            "cname": "今日头条",
            "size": "D轮",
            "salary": "40K-60K",
            "username": "Kimi",
            "title": "HRBP"
          }
        ]
      }
     """);
    });
  }

  Widget buildJobItem(BuildContext context, int index){
    Job job = _jobs[index];

    var jobItem =  InkWell(
      onTap: (){
        showDialog(
          context: context,
          child: AlertDialog(
            content: Text(
              '尽情期待',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
          )
        );
      },
      child: JobListItem(job),
    );
    return jobItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 252, 245),
      appBar: AppBar(
        title: Text('Android',style: TextStyle(fontSize: 20.0,color: Colors.white),),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add,size: 30.0,),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search,size: 30.0,),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _jobs.length,
        itemBuilder: buildJobItem,
      ),
    );
  }
}