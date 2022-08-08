import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/componants/all_widget.dart';


class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            const AllWidget(),
        separatorBuilder: (context, index) => const SizedBox(
          width: double.infinity,
          height: 5.5,
        ),
        itemCount: 4);
  }
}