
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/componants/componants.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks=AppCubit.get(context).newTasks;
    return  BlocConsumer<AppCubit, AppState>(
      builder: (BuildContext context, state) {
        return tasksBuilder(tasks: tasks);
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}