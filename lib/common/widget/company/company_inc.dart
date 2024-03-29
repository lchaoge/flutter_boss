import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {

  final String companyInc;

  CompanyInc(this.companyInc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding:EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      "公司介绍",
                      style: TextStyle(
                        fontSize: 15.0
                      ),
                    ),
                  )
                ],
              ),

              RichText(
                text: TextSpan(
                  text: companyInc,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black
                  )
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}