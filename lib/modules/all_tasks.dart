import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/componants/all_widget.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ListView.separated(
        itemBuilder: (context, index) =>
             AllWidget(task: AppCubit.get(context).allTasks[index],),
        separatorBuilder: (context, index) => const SizedBox(
          width: double.infinity,
          height: 5.5,
        ),
        itemCount: AppCubit.get(context).allTasks.length);
  },
);
  }
}