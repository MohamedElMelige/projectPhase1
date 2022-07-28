import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/style/themes.dart';

class Schedule extends StatelessWidget {
  const Schedule({required this.payLoad});
  final payLoad;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,size: 30,color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Scehedule',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: primaryClr,
            ),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.text_format, size: 30, color: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Title',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  payLoad.toString().split('|')[0],
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                 SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.description, size: 30, color: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  payLoad.toString().split('|')[1],
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                 SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 35, color: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Date',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
                 SizedBox(
                  height: 20,
                ),
                Text(
                  payLoad.toString().split('|')[2],
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),

              ],
            )),
          )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
