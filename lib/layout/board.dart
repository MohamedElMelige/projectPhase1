import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/componants/myButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';
import 'add_task.dart';
import 'schedule.dart';


class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  'Board',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                ),
                actions: [
                  IconButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Schedule(payLoad: 'First|Scand|third')));
                  }, icon: Icon(Icons.calendar_today_outlined,color: Colors.black ,)),
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeThemeState();
                      },
                      icon: Icon(Icons.nightlight_round,color: Colors.black)),
                  Icon(
                    Icons.notifications,
                    size: 30,color: Colors.black
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(children: [
                  NavigationBar(destinations: AppCubit.get(context).screen),



                  MyButton(height: 18, onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddTask()));
                  }, size: 20, text: 'Add a task', width: 18)
                ]),
              ),
              
            );
          },
          listener: (context, state) {
    if (state is InsertDatabaseState) {
    Navigator.pop(context);}
          }),
    ));
  }
}
