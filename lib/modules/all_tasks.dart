import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/componants/componants.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (BuildContext context, state) {
        var tasks=AppCubit.get(context).allTasks;
        return tasksBuilder(tasks: tasks);
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}