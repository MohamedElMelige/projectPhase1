import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';


class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var formKey = GlobalKey<FormState>();

    var titleController = TextEditingController();
    var timeController = TextEditingController();
    var dateController = TextEditingController();

    return SafeArea(
        child: BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Board',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.schedule)),
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeThemeState();
                      },
                      icon: Icon(Icons.nightlight_round)),
                  Icon(
                    Icons.notifications,
                    size: 30,
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(children: [
                ]),
              ),
            );
          },
          listener: (context, state) {}),
    ));
  }
}
