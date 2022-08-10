import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../shared/componants/all_widget.dart';
import '../shared/cubit/cubit.dart';


class FavoriteTasks extends StatefulWidget {
  const FavoriteTasks({Key? key}) : super(key: key);

  @override
  State<FavoriteTasks> createState() => _FavoriteTasksState();
}

class _FavoriteTasksState extends State<FavoriteTasks> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) =>
                AllWidget(task: AppCubit
                    .get(context)
                    .allTasks.where((element) => element.favourite==1).toList()[index],),
            separatorBuilder: (context, index) =>
            const SizedBox(
              width: double.infinity,
              height: 5.5,
            ),
            itemCount: AppCubit
                .get(context)
                .allTasks.where((element) => element.favourite==1).length);
      },
    );
  }
}
