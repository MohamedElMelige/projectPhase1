import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/componants/componants.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class FavoritTasks extends StatefulWidget {
  const FavoritTasks({Key? key}) : super(key: key);

  @override
  State<FavoritTasks> createState() => _FavoritTasksState();
}

class _FavoritTasksState extends State<FavoritTasks> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (BuildContext context, state) {
        var tasks=AppCubit.get(context).achriveTasks;
        return tasksBuilder(tasks: tasks);
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
