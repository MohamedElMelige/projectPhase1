
import 'package:flutter/material.dart';


import '../shared/componants/all_widget.dart';


class DoneTasks extends StatefulWidget {
  const DoneTasks({Key? key}) : super(key: key);

  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
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