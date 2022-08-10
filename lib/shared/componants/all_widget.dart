import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllWidget extends StatelessWidget {
  final TaskModel task;
  AllWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  AppCubit.get(context).updateCompletenceTask(task.id);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: task.doneTasks == 1
                          ? AppCubit.get(context).color[task.color]
                          : null,
                      border: Border.all(color: AppCubit.get(context).color[task.color], width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: task.doneTasks == 1
                      ? const Icon(
                          Icons.check,
                          size: 22,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  task.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              IconButton(
                color: AppCubit.get(context).color[task.color],
                  onPressed: (){
                AppCubit.get(context).updatefavouriteTask(task.id);
              }, icon:task.favourite==1? Icon(Icons.favorite):Icon(Icons.favorite_border_outlined))
            ],
          ),
        )
      ],
    );
  },
);
  }
}
